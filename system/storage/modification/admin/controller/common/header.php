<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		$data['title'] = $this->document->getTitle();

		if ($this->request->server['HTTPS']) {
			$data['base'] = HTTPS_SERVER;
		} else {
			$data['base'] = HTTP_SERVER;
		}

		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$this->load->language('common/header');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_order'] = $this->language->get('text_order');
		$data['text_processing_status'] = $this->language->get('text_processing_status');
		$data['text_complete_status'] = $this->language->get('text_complete_status');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_customer'] = $this->language->get('text_customer');
		$data['text_online'] = $this->language->get('text_online');
		$data['text_approval'] = $this->language->get('text_approval');
		$data['text_product'] = $this->language->get('text_product');
		$data['text_stock'] = $this->language->get('text_stock');
		$data['text_review'] = $this->language->get('text_review');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_store'] = $this->language->get('text_store');
		$data['text_front'] = $this->language->get('text_front');
		$data['text_help'] = $this->language->get('text_help');
		$data['text_homepage'] = $this->language->get('text_homepage');
		$data['text_documentation'] = $this->language->get('text_documentation');
		$data['text_support'] = $this->language->get('text_support');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->user->getUserName());
		$data['text_logout'] = $this->language->get('text_logout');

		if (!isset($this->request->get['token']) || !isset($this->session->data['token']) || ($this->request->get['token'] != $this->session->data['token'])) {
			$data['logged'] = '';

			$data['home'] = $this->url->link('common/dashboard', '', true);
		} else {
			$data['logged'] = true;

				$this->load->model('sale/newfastorder');
				$data['countfastorder'] = $this->model_sale_newfastorder->countTotalNewFastorder();
				$data['newfastorder'] = $this->url->link('sale/newfastorder', 'token=' . $this->session->data['token'], 'SSL');
				$data['title_fastorder'] = $this->language->get('title_fastorder');
			
	
				$this->load->model('extension/module/cyber_question_answer');
				$this->load->language('extension/module/cyber_question_answer');      
				$question_answer = (array)$this->config->get('qadata');
				$data['question_answer'] = (array)$this->config->get('qadata'); 
				if (isset($question_answer['status']) && $question_answer['status']) {
					$data['title_icon_header_qa'] = $this->language->get('title_icon_header_qa');
					$data['countquestion_answer'] = $this->model_extension_module_cyber_question_answer->getTotalNewQuestionAnswer();
					$data['question_answer_url'] = $this->url->link('extension/module/cyber_question_answer', 'tablist=1&token=' . $this->session->data['token'], 'SSL');
				}									
			
	
				$this->load->model('extension/module/cyber_found_cheaper_product');
				$this->load->language('extension/module/cyber_found_cheaper_product');      
				$found_cheaper_product = (array)$this->config->get('fcpdata');
				$data['found_cheaper_product'] = (array)$this->config->get('fcpdata'); 
				if (isset($found_cheaper_product['status']) && $found_cheaper_product['status']) {
					$data['title_icon_header_fcp'] = $this->language->get('title_icon_header_fcp');
					$data['countfound_cheaper'] = $this->model_extension_module_cyber_found_cheaper_product->getTotalNewFoundCheaper();
					$data['found_cheaper_product_url'] = $this->url->link('extension/module/cyber_found_cheaper_product', 'tablist=1&token=' . $this->session->data['token'], 'SSL');
				}									
			

			$data['home'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true);
			$data['logout'] = $this->url->link('common/logout', 'token=' . $this->session->data['token'], true);

			$this->load->model('catalog/reviews_store');
			$this->load->language('catalog/reviews_store'); 
			$data['countreviewsoff'] = $this->model_catalog_reviews_store->countTotalStatusOff();
			$data['link_reviews'] = $this->url->link('catalog/reviews_store', 'token=' . $this->session->data['token'], true);
			$data['text_reviews_store'] = $this->language->get('text_reviews_store');
			

			$this->load->model('sale/callback');
			$data['countcallback'] = $this->model_sale_callback->countTotal();
			$data['callback'] = $this->url->link('sale/callback', 'token=' . $this->session->data['token'], 'SSL');
			$data['text_callback'] = $this->language->get('text_callback');
			

			// Orders
			$this->load->model('sale/order');

			// Processing Orders
			$data['processing_status_total'] = $this->model_sale_order->getTotalOrders(array('filter_order_status' => implode(',', $this->config->get('config_processing_status'))));
			$data['processing_status'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&filter_order_status=' . implode(',', $this->config->get('config_processing_status')), true);

			// Complete Orders
			$data['complete_status_total'] = $this->model_sale_order->getTotalOrders(array('filter_order_status' => implode(',', $this->config->get('config_complete_status'))));
			$data['complete_status'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&filter_order_status=' . implode(',', $this->config->get('config_complete_status')), true);

			// Returns
			$this->load->model('sale/return');

			$return_total = $this->model_sale_return->getTotalReturns(array('filter_return_status_id' => $this->config->get('config_return_status_id')));

			$data['return_total'] = $return_total;

			$data['return'] = $this->url->link('sale/return', 'token=' . $this->session->data['token'], true);

			// Customers
			$this->load->model('report/customer');

			$data['online_total'] = $this->model_report_customer->getTotalCustomersOnline();

			$data['online'] = $this->url->link('report/customer_online', 'token=' . $this->session->data['token'], true);

			$this->load->model('customer/customer');

			$customer_total = $this->model_customer_customer->getTotalCustomers(array('filter_approved' => false));

			$data['customer_total'] = $customer_total;
			$data['customer_approval'] = $this->url->link('customer/customer', 'token=' . $this->session->data['token'] . '&filter_approved=0', true);

			// Products
			$this->load->model('catalog/product');

			$product_total = $this->model_catalog_product->getTotalProducts(array('filter_quantity' => 0));

			$data['product_total'] = $product_total;

			$data['product'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&filter_quantity=0', true);

			// Reviews
			$this->load->model('catalog/review');

			$review_total = $this->model_catalog_review->getTotalReviews(array('filter_status' => 0));

			$data['review_total'] = $review_total;

			$data['review'] = $this->url->link('catalog/review', 'token=' . $this->session->data['token'] . '&filter_status=0', true);

			// Affliate
			$this->load->model('marketing/affiliate');

			$affiliate_total = $this->model_marketing_affiliate->getTotalAffiliates(array('filter_approved' => false));

			$data['affiliate_total'] = $affiliate_total;
			$data['affiliate_approval'] = $this->url->link('marketing/affiliate', 'token=' . $this->session->data['token'] . '&filter_approved=1', true);

			$data['alerts'] = $customer_total + $product_total + $review_total + $return_total + $affiliate_total;

			// Online Stores
			$data['stores'] = array();

			$data['stores'][] = array(
				'name' => $this->config->get('config_name'),
				'href' => HTTP_CATALOG
			);

			$this->load->model('setting/store');

			$results = $this->model_setting_store->getStores();

			foreach ($results as $result) {
				$data['stores'][] = array(
					'name' => $result['name'],
					'href' => $result['url']
				);
			}
		}

		return $this->load->view('common/header', $data);
	}
}
