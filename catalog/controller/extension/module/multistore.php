<?php
class ControllerExtensionModuleMultistore extends Controller {

	// Первоначальная загрузка
	public function index($parameters) {

		if (!isset($parameters['product_id'])) return false;

		$this->load->library('multistore');

		if (!$this->multistore->getConfigValue('multistore_status')) return;

		$this->load->language('extension/module/multistore');
		$language_id = $this->multistore->getConfigValue('config_language_id');

		$this->document->addStyle('catalog/view/javascript/multistore/style.css');
		$this->document->addScript('catalog/view/javascript/multistore/script.js');

		$product_id = (int)$parameters['product_id'];

		if ($this->multistore->getConfigValue('multistore_display_title')) {
			$data['multistore_title'] = $this->language->get('multistore_title');
		} else {
			$data['multistore_title'] = false;
		}

		$data['get'] = htmlspecialchars_decode($this->url->link('extension/module/multistore/get', 'p_id='.$product_id, true));
		$data['hash'] = bin2hex(random_bytes(5));
		$data['product_id'] = $product_id;

		if (isset($parameters['is_product_page']) && (bool)$parameters['is_product_page'] === true) {

			if (isset($this->multistore->getConfigValue('multistore_display_before')[$language_id])) {
				$data['multistore_before'] = htmlspecialchars_decode($this->multistore->getConfigValue('multistore_display_before')[$language_id]);
			} else {
				$data['multistore_before'] = false;
			}

			if (isset($this->multistore->getConfigValue('multistore_display_after')[$language_id])) {
				$data['multistore_after'] = htmlspecialchars_decode($this->multistore->getConfigValue('multistore_display_after')[$language_id]);
			} else {
				$data['multistore_after'] = false;
			}

			return $this->load->view('extension/module/multistore/product', $data);

		}

		return $this->load->view('extension/module/multistore/category', $data);

	}

	public function get(){

		$this->load->library('multistore');
		$this->load->language('extension/module/multistore');

		$data['text_not_multistore'] = $this->language->get('text_not_multistore');

		if ($this->request->server['REQUEST_METHOD'] == 'GET' && !empty($this->request->get['p_id'])) {

			$multistores = array();
			$isEmptyEnabled = $this->multistore->getConfigValue('multistore_empty');
			$isStockEnabled = $this->multistore->getConfigValue('multistore_display_stock');
			$isTradeEnabled = $this->multistore->getConfigValue('multistore_display_trade');

			if (!empty($this->request->get['options_id'])) {
				$result = $this->multistore->getMultistoresForProduct($this->request->get['p_id'], explode(',', $this->request->get['options_id']));
			} else {
				$result = $this->multistore->getMultistoresForProduct($this->request->get['p_id']);
			}

			foreach($result as $multistore){

				// Превращаем в псевдо-бесконечный остаток
				$quantity = $multistore['infinity'] ? 99999 : (int)$multistore['minimum'];

				// Выключаем пустые склады из вывода
				if (!$isEmptyEnabled && $quantity <= 0) continue;

				$multistores[] = array(
					'multistore_id' => $multistore['multistore_id'],
					'type' 					=> $multistore['type'],
					'quantity' 			=> $quantity,
					'name' 					=> trim(strip_tags($multistore['name'])),
					'description' 	=> html_entity_decode($multistore['description'])
				);

			}

			if ($this->multistore->getConfigValue('multistore_matrix_status')) {
				$data['multistores'] = $this->getStockMatrix($multistores);
			} elseif (!$this->multistore->getConfigValue('config_stock_display')) {
				$data['multistores'] = $this->getStockText($multistores);
			} else {
				$data['multistores'] = $multistores;
			}

			foreach($data['multistores'] as $key => $multistore){

				// Выключаем склады
				if (!$isStockEnabled && $multistore['type'] == 'stock') unset($data['multistores'][$key]);

				// Выключаем поставщиков
				if (!$isTradeEnabled && $multistore['type'] == 'trade') unset($data['multistores'][$key]);;

			}

		} else {
			$data['error'] = 'error';
		}

		$this->response->setOutput($this->load->view('extension/module/multistore/list', $data));

	}

	private function getStockText($multistores){

		$this->load->language('extension/module/multistore');
		$language_id = $this->multistore->getConfigValue('config_language_id');

		$stock_statuses = $this->multistore->getStockStatuses();

		$stock_all = 0;
		$trade_all = 0;

		// Объединяем склады и поставщиков, приниминяем условную бесконечность
		foreach($multistores as $multistore){
			if ($multistore['type'] == 'stock') {
				$stock_all += $multistore['quantity'];
			} elseif ($multistore['type'] == 'trade') {
				$trade_all += $multistore['quantity'];
			}
		}

		// Формируем текстовое описание
		foreach($multistores as $key => $multistore){

			// Товар есть в магазине
			if ($multistore['quantity'] > 0) {
				$stock_status_id = $this->multistore->getConfigValue('multistore_stock_status_instore');
				$color = $this->multistore->getConfigValue('multistore_color_instore');

			// Товар есть на каком-то из складах
			} elseif ($stock_all > 0) {
				$stock_status_id = $this->multistore->getConfigValue('multistore_stock_status_instock');
				$color = $this->multistore->getConfigValue('multistore_color_instock');

			// Товар есть у какого-либо поставщика
			} elseif ($trade_all > 0) {
				$stock_status_id = $this->multistore->getConfigValue('multistore_stock_status_intrade');
				$color = $this->multistore->getConfigValue('multistore_color_intrade');

			// Товара нигде нет
			} else {
				$stock_status_id = $this->multistore->getConfigValue('multistore_stock_status_out_of_stock');
				$color = $this->multistore->getConfigValue('multistore_color_out_of_stock');

			}

			$multistores[$key]['quantity'] = $stock_statuses[$stock_status_id];
			$multistores[$key]['color'] = $color;

		}

		return $multistores;

	}

	private function getStockMatrix($multistores){

		$this->load->language('extension/module/multistore');
		$language_id = $this->multistore->getConfigValue('config_language_id');

		$stock_statuses = $this->multistore->getStockStatuses();

		$matrix = $this->multistore->getConfigValue('multistore_matrix');
		foreach($multistores as $multistore_id => $multistore){

			if ($multistore['quantity'] <= 0) {
				$multistores[$multistore_id]['quantity'] = $stock_statuses[$this->multistore->getConfigValue('multistore_stock_status_out_of_stock')];
				$multistores[$multistore_id]['color'] = $this->multistore->getConfigValue('multistore_color_out_of_stock');
			} else {

				$found = false;
				foreach($matrix as $item){
					if ($multistore['quantity'] <= $item['value']) {
						$multistores[$multistore_id]['quantity'] = $item['title'][$language_id];
						$multistores[$multistore_id]['color'] = $item['color'];
						$found = true;
						break;
					}
				}

				if (!$found) {
					$multistores[$multistore_id]['quantity'] = $stock_statuses[$this->multistore->getConfigValue('multistore_stock_status_instore')];
					$multistores[$multistore_id]['color'] = $this->multistore->getConfigValue('multistore_color_instore');
				}
			}
		}

		return $multistores;

	}

}