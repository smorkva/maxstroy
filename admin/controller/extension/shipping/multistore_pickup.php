<?php
class ControllerExtensionShippingMultistorePickup extends Controller {

	protected $registry;
	private $error = array();
	private $token_name = '';
	private $token_value = '';
	private $module_code = '';

	public function __construct($registry){
		$this->registry = $registry;

		if (VERSION < 3) {
			$this->module_code = 'multistore_pickup';
			$this->token_name = 'token';
			$this->token_value = $this->session->data['token'];
		} else {
			$this->module_code = 'shipping_multistore_pickup';
			$this->token_name = 'user_token';
			$this->token_value = $this->session->data['user_token'];
		}
  }

  public function __get($name) {
    if ($this->registry->has($name)) {
      return $this->registry->get($name);
    } else {
      return null;
    }
	}

	public function index() {
		$this->load->language('extension/shipping/multistore_pickup');

		$this->document->setTitle($this->language->get('page_title'));

		$this->load->model('setting/setting');
		$this->load->library('multistore');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting($this->module_code, $this->getPost($this->request->post));
			$data['success'] = $this->language->get('text_success');
		}

		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', $this->token_name .'='. $this->token_value, true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', $this->token_name .'='. $this->token_value . '&type=shipping', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('page_title'),
			'href' => $this->url->link('extension/shipping/multistore_pickup', $this->token_name .'='. $this->token_value, true)
		);

		$data['action'] = $this->url->link('extension/shipping/multistore_pickup', $this->token_name .'='. $this->token_value, true);

		$data['cancel'] = $this->url->link('extension/extension', $this->token_name .'='. $this->token_value . '&type=shipping', true);

		if (isset($this->request->post['multistore_pickup_status'])) {
			$data['multistore_pickup_status'] = $this->request->post['multistore_pickup_status'];
		} else {
			$data['multistore_pickup_status'] = $this->multistore->getConfigValue('multistore_pickup_status', 'shipping');
		}

		if (isset($this->request->post['multistore_pickup_total'])) {
			$data['multistore_pickup_total'] = $this->request->post['multistore_pickup_total'];
		} else {
			$data['multistore_pickup_total'] = $this->multistore->getConfigValue('multistore_pickup_total', 'shipping');
		}

		$data['possibilityes'] = array(
			'store' => $this->language->get('text_possibility_store'),
			'stock' => $this->language->get('text_possibility_stock'),
			'trade' => $this->language->get('text_possibility_trade')
		);

		if (isset($this->request->post['multistore_pickup_possibility'])) {
			$data['multistore_pickup_possibility'] = $this->request->post['multistore_pickup_possibility'];
		} else {
			$data['multistore_pickup_possibility'] = $this->multistore->getConfigValue('multistore_pickup_possibility', 'shipping');
		}

		if (isset($this->request->post['multistore_pickup_sort_order'])) {
			$data['multistore_pickup_sort_order'] = $this->request->post['multistore_pickup_sort_order'];
		} else {
			$data['multistore_pickup_sort_order'] = $this->multistore->getConfigValue('multistore_pickup_sort_order', 'shipping');
		}

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_none'] = $this->language->get('text_none');

		$data['entry_total'] = $this->language->get('entry_total');
		$data['entry_possibility'] = $this->language->get('entry_possibility');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['help_total'] = $this->language->get('help_total');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/shipping/multistore_pickup', $data));
	}

	// Help
	private function getPost($data){
		if (VERSION < 3) {
			return $data;
		} else {
			$new_data = array();
			foreach($data as $key => $param){
				$new_data['shipping_'.$key] = $param;
			}
			return $new_data;
		}
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/shipping/multistore_pickup')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}