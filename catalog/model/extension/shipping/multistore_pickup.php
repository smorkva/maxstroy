<?php
class ModelExtensionShippingMultistorePickup extends Model {
	function getQuote($address) {

		// Заказ при нехватке на складе, использовать для отображения/не складов
		$stock_checkout = $this->config->get('config_stock_checkout');

		$this->load->language('extension/shipping/multistore_pickup');
		$this->load->library('multistore');

		$status = true;
		if (!$this->multistore->getConfigValue('multistore_pickup_status', 'shipping')) {
			$status = false;
		} elseif ($this->cart->getSubTotal() < $this->multistore->getConfigValue('multistore_pickup_total', 'shipping')) {
			$status = false;
		}

		$method_data = array();

		if ($status) {

			$quote_data = array();
			foreach($this->getMultistores() as $multistore){
				$multistore_id = $multistore['multistore_id'];
				$quote_data['multistore_'.$multistore_id] = array(
					'code'         => 'multistore_pickup.multistore_'.$multistore_id,
					'title'        => sprintf($this->language->get('text_method'), $multistore['name'], $multistore['stock_status']),
					'cost'         => 0,
					'tax_class_id' => 0,
					'text'         => $this->currency->format(0.00, $this->session->data['currency'])
				);
			}

			if (!empty($quote_data)) {
				$method_data = array(
					'code'       => 'multistore_pickup',
					'title'      => $this->language->get('text_title'),
					'quote'      => $quote_data,
					'sort_order' => $this->multistore->getConfigValue('multistore_pickup_sort_order', 'shipping'),
					'error'      => false
				);
			}
		}

		return $method_data;
	}

	private function getMultistores(){

		// Получить локацию пользователя
		$language_id = $this->config->get('config_language_id');

		// Статусы
		$stock_statuses = $this->multistore->getStockStatuses();

		// Общий остаток на своих складах
		// Если складов нет, надо сразу делать false
		$in_stock = true;
		if ($this->multistore->getCountMultistore('stock') == 0){
			$in_stock = false;
		}

		// Общий остаток у поставщика
		// Если складов нет, надо сразу делать false
		$in_trade = true;
		if ($this->multistore->getCountMultistore('trade') == 0){
			$in_trade = false;
		}

		// Информация о складах
		$multistores = array();
		foreach($this->multistore->getMultistoresStores() as $multistore){
			$multistore_id = $multistore['multistore_id'];
			$multistores[$multistore_id] = array(
				'quantity' 			=> true,
				'name' 					=> trim(strip_tags(html_entity_decode($multistore['name']))),
				'description' 	=> trim(strip_tags(html_entity_decode($multistore['description'])))
			);
		}

		// Получаем данные по корзине. Отдельным запросом, так как опции хранятся в json
		$products = array();
		foreach($this->getCartProducts() as $product){

			$product_id = $product['product_id'];
			$product_quantity = (int)$product['quantity'];
			$product_options = json_decode($product['option'], true);

			// Сбрасываем склады
			if ($in_stock && $this->multistore->getTotalForProducts($product_id, $product_quantity, 'stock', array_values($product_options)) <= 0) $in_stock = false;

			// Сбрасываем поставщиков
			if ($in_trade && $this->multistore->getTotalForProducts($product_id, $product_quantity, 'trade', array_values($product_options)) <= 0) $in_trade = false;

			foreach($this->multistore->getQuantityForProduct($product_id, array_values($product_options)) as $multistore){
				$multistore_id = $multistore['multistore_id'];
				$quantity = $multistore['infinity'] ? 99999 : (int)$multistore['minimum'];

				if ($quantity < $product_quantity) {
					$multistores[$multistore_id]['quantity'] = false;
				}
			}

		}

		// Формируем способы
		$methods = array();
		foreach($multistores as $multistore_id => $multistore){

			if ($multistore['quantity']){
				$stock_status_id = $this->multistore->getConfigValue('multistore_stock_status_instore');
			} elseif ($in_stock){
				$stock_status_id = $this->multistore->getConfigValue('multistore_stock_status_instock');
			} elseif ($in_trade){
				$stock_status_id = $this->multistore->getConfigValue('multistore_stock_status_intrade');
			} else {
				$stock_status_id = $this->multistore->getConfigValue('multistore_stock_status_out_of_stock');
			}

			$methods[] = array(
				'multistore_id' => $multistore_id,
				'name' => trim(strip_tags(html_entity_decode($multistore['name']))),
				'description' => trim(strip_tags(html_entity_decode($multistore['description']))),
				'stock_status' => $stock_statuses[$stock_status_id]
			);
		}

		return $methods;

	}

	private function getCartProducts(){
		$query = $this->db->query("
			SELECT *
			FROM " . DB_PREFIX . "cart
			WHERE
				api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND
				customer_id = '" . (int)$this->customer->getId() . "' AND
				session_id = '" . $this->db->escape($this->session->getId()) . "'
		");

		return $query->rows;
	}

}