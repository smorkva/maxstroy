<?php
class ControllerExtensionModuleMultistore extends Controller {

	protected $registry;
	private $error = array();
	private $token_name = '';
	private $token_value = '';
	private $module_code = '';
	private $module_version = '2.3';

	public function __construct($registry){
		$this->registry = $registry;

		if (VERSION < 3) {
			$this->module_code = 'multistore';
			$this->token_name = 'token';
			$this->token_value = $this->session->data['token'];
		} else {
			$this->module_code = 'module_multistore';
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

		$this->load->language('extension/module/multistore');

		$this->document->setTitle($this->language->get('page_title'));

		$this->load->model('setting/setting');
		$this->load->model('extension/module/multistore');
		$this->load->library('multistore');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting($this->module_code, $this->getPost($this->request->post));
			$data['success'] = $this->language->get('text_success');
		}

		$data['error'] = array();

		if (isset($this->error['permission'])) {
			$data['error'][] = $this->error['permission'];
		}

		if (isset($this->error['matrix'])) {
			$data['error'][] = $this->error['matrix'];
		}

		if (empty($data['error']) && !empty($this->error)) {
			$data['error'][] = $this->language->get('error_form');
		}

		if (isset($this->error['error_stock_status_instore'])) {
			$data['error_stock_status_instore'] = $this->error['error_stock_status_instore'];
		} else {
			$data['error_stock_status_instore'] = false;
		}

		if (isset($this->error['error_stock_status_instock'])) {
			$data['error_stock_status_instock'] = $this->error['error_stock_status_instock'];
		} else {
			$data['error_stock_status_instock'] = false;
		}

		if (isset($this->error['error_stock_status_intrade'])) {
			$data['error_stock_status_intrade'] = $this->error['error_stock_status_intrade'];
		} else {
			$data['error_stock_status_intrade'] = false;
		}

		if (isset($this->error['error_stock_status_out_of_stock'])) {
			$data['error_stock_status_out_of_stock'] = $this->error['error_stock_status_out_of_stock'];
		} else {
			$data['error_stock_status_out_of_stock'] = false;
		}

		if (!file_exists(DIR_SYSTEM.'library/PHPExcel.php')) {
			$data['error'][] = $this->language->get('error_phpexcel');
		}

		if (isset($this->request->post['multistore_status'])) {
			$data['multistore_status'] = $this->request->post['multistore_status'];
		} else {
			$data['multistore_status'] = $this->multistore->getConfigValue('multistore_status');
		}

		if (isset($this->request->post['multistore_product_status'])) {
			$data['multistore_product_status'] = $this->request->post['multistore_product_status'];
		} else {
			$data['multistore_product_status'] = $this->multistore->getConfigValue('multistore_product_status');
		}

		if (isset($this->request->post['multistore_category_status'])) {
			$data['multistore_category_status'] = $this->request->post['multistore_category_status'];
		} else {
			$data['multistore_category_status'] = $this->multistore->getConfigValue('multistore_category_status');
		}

		if (isset($this->request->post['multistore_option_with_quantity_status'])) {
			$data['multistore_option_with_quantity_status'] = $this->request->post['multistore_option_with_quantity_status'];
		} else {
			$data['multistore_option_with_quantity_status'] = $this->multistore->getConfigValue('multistore_option_with_quantity_status');
		}

		if (isset($this->request->post['multistore_empty'])) {
			$data['multistore_empty'] = $this->request->post['multistore_empty'];
		} else {
			$data['multistore_empty'] = $this->multistore->getConfigValue('multistore_empty');
		}

		if (isset($this->request->post['multistore_display_title'])) {
			$data['multistore_display_title'] = $this->request->post['multistore_display_title'];
		} else {
			$data['multistore_display_title'] = $this->multistore->getConfigValue('multistore_display_title');
		}

		if (isset($this->request->post['multistore_display_stock'])) {
			$data['multistore_display_stock'] = $this->request->post['multistore_display_stock'];
		} else {
			$data['multistore_display_stock'] = $this->multistore->getConfigValue('multistore_display_stock');
		}

		if (isset($this->request->post['multistore_display_trade'])) {
			$data['multistore_display_trade'] = $this->request->post['multistore_display_trade'];
		} else {
			$data['multistore_display_trade'] = $this->multistore->getConfigValue('multistore_display_trade');
		}

		if (isset($this->request->post['multistore_display_before'])) {
			$data['multistore_display_before'] = $this->request->post['multistore_display_before'];
		} else {
			$data['multistore_display_before'] = $this->multistore->getConfigValue('multistore_display_before');
		}

		if (isset($this->request->post['multistore_display_after'])) {
			$data['multistore_display_after'] = $this->request->post['multistore_display_after'];
		} else {
			$data['multistore_display_after'] = $this->multistore->getConfigValue('multistore_display_after');
		}

		if (isset($this->request->post['multistore_matrix_status'])) {
			$data['multistore_matrix_status'] = $this->request->post['multistore_matrix_status'];
		} else {
			$data['multistore_matrix_status'] = $this->multistore->getConfigValue('multistore_matrix_status');
		}

		if (isset($this->request->post['multistore_matrix'])) {
			$data['multistore_matrix'] = $this->request->post['multistore_matrix'];
		} elseif (is_array($this->multistore->getConfigValue('multistore_matrix'))) {
			$data['multistore_matrix'] = $this->multistore->getConfigValue('multistore_matrix');
		} else {
			$data['multistore_matrix'] = array();
		}

		$this->load->model('localisation/stock_status');
		$data['stock_statuses'] = $this->model_localisation_stock_status->getStockStatuses();

		if (isset($this->request->post['multistore_stock_status_instore'])) {
			$data['multistore_stock_status_instore'] = $this->request->post['multistore_stock_status_instore'];
		} else {
			$data['multistore_stock_status_instore'] = 7;
		}

		if (isset($this->request->post['multistore_stock_status_instock'])) {
			$data['multistore_stock_status_instock'] = $this->request->post['multistore_stock_status_instock'];
		} else {
			$data['multistore_stock_status_instock'] = 6;
		}

		if (isset($this->request->post['multistore_stock_status_intrade'])) {
			$data['multistore_stock_status_intrade'] = $this->request->post['multistore_stock_status_intrade'];
		} else {
			$data['multistore_stock_status_intrade'] = 8;
		}

		if (isset($this->request->post['multistore_stock_status_out_of_stock'])) {
			$data['multistore_stock_status_out_of_stock'] = $this->request->post['multistore_stock_status_out_of_stock'];
		} else {
			$data['multistore_stock_status_out_of_stock'] = 5;
		}

		if (isset($this->request->post['multistore_color_instore'])) {
			$data['multistore_color_instore'] = $this->request->post['multistore_color_instore'];
		} else {
			$data['multistore_color_instore'] = '#3cb371';
		}

		if (isset($this->request->post['multistore_color_instock'])) {
			$data['multistore_color_instock'] = $this->request->post['multistore_color_instock'];
		} else {
			$data['multistore_color_instock'] = '#9acd32';
		}

		if (isset($this->request->post['multistore_color_intrade'])) {
			$data['multistore_color_intrade'] = $this->request->post['multistore_color_intrade'];
		} else {
			$data['multistore_color_intrade'] = '#ff7f50';
		}

		if (isset($this->request->post['multistore_color_out_of_stock'])) {
			$data['multistore_color_out_of_stock'] = $this->request->post['multistore_color_out_of_stock'];
		} else {
			$data['multistore_color_out_of_stock'] = '#cd5c5c';
		}

		$this->load->model('localisation/geo_zone');
		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		$data['token'] = $this->token_value;

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', $this->token_name .'='. $this->token_value, true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', $this->token_name .'='. $this->token_value . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('page_title'),
			'href' => $this->url->link('extension/module/multistore', $this->token_name .'='. $this->token_value, true)
		);

		// Heading
		$data['heading_title'] = $this->language->get('page_title');

		// Tabs
		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_template'] = $this->language->get('tab_template');
		$data['tab_matrix'] = $this->language->get('tab_matrix');
		$data['tab_import'] = $this->language->get('tab_import');
		$data['tab_status'] = $this->language->get('tab_status');
		$data['tab_about'] = $this->language->get('tab_about');

		// Entry
		$data['entry_yes'] = $this->language->get('entry_yes');
		$data['entry_no'] = $this->language->get('entry_no');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['entry_product_status'] = $this->language->get('entry_product_status');
		$data['entry_category_status'] = $this->language->get('entry_category_status');
		$data['entry_option_with_quantity'] = $this->language->get('entry_option_with_quantity');
		$data['entry_template_numeric'] = $this->language->get('entry_template_numeric');
		$data['entry_template_text'] = $this->language->get('entry_template_text');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_template'] = $this->language->get('entry_template');
		$data['entry_template'] = $this->language->get('entry_template');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_type'] = $this->language->get('entry_type');
		$data['entry_sort'] = $this->language->get('entry_sort');
		$data['entry_setting'] = $this->language->get('entry_setting');
		$data['entry_infinity'] = $this->language->get('entry_infinity');
		$data['entry_default'] = $this->language->get('entry_default');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_geo_all'] = $this->language->get('entry_geo_all');
		$data['entry_download'] = $this->language->get('entry_download');
		$data['entry_load'] = $this->language->get('entry_load');
		$data['entry_display_empty'] = $this->language->get('entry_display_empty');
		$data['entry_display_stock'] = $this->language->get('entry_display_stock');
		$data['entry_display_trade'] = $this->language->get('entry_display_trade');
		$data['entry_display_title'] = $this->language->get('entry_display_title');
		$data['entry_display_before'] = $this->language->get('entry_display_before');
		$data['entry_display_after'] = $this->language->get('entry_display_after');
		$data['entry_display_type'] = $this->language->get('entry_display_type');
		$data['entry_import_download'] = $this->language->get('entry_import_download');
		$data['entry_import_template'] = $this->language->get('entry_import_template');
		$data['entry_matrix_graphic'] = $this->language->get('entry_matrix_graphic');
		$data['entry_matrix_before'] = $this->language->get('entry_matrix_before');
		$data['entry_matrix_after'] = $this->language->get('entry_matrix_after');
		$data['entry_matrix_title'] = $this->language->get('entry_matrix_title');
		$data['entry_matrix_zero'] = $this->language->get('entry_matrix_zero');
		$data['entry_matrix_big'] = $this->language->get('entry_matrix_big');
		$data['entry_stock_status_instore'] = $this->language->get('entry_stock_status_instore');
		$data['entry_stock_status_instock'] = $this->language->get('entry_stock_status_instock');
		$data['entry_stock_status_intrade'] = $this->language->get('entry_stock_status_intrade');
		$data['entry_stock_status_out_of_stock'] = $this->language->get('entry_stock_status_out_of_stock');
		$data['entry_color'] = $this->language->get('entry_color');

		// Text
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_extension'] = $this->language->get('text_extension');
		$data['text_success'] = $this->language->get('text_success');
		$data['text_module_edit'] = $this->language->get('text_module_edit');
		$data['text_support'] = $this->language->get('text_support');
		$data['text_store'] = $this->language->get('text_store');
		$data['text_stock'] = $this->language->get('text_stock');
		$data['text_trade'] = $this->language->get('text_trade');
		$data['text_import_success'] = $this->language->get('text_import_success');
		$data['text_import_failed'] = $this->language->get('text_import_failed');
		$data['text_import'] = $this->language->get('text_import');
		$data['text_experement'] = $this->language->get('text_experement');
		$data['text_loading'] = $this->language->get('text_loading');
		$data['text_modificator'] = $this->language->get('text_modificator');
		$data['text_layout'] = $this->language->get('text_layout');
		$data['text_need_migration'] = $this->language->get('text_need_migration');
		$data['text_matrix_zero'] = $this->language->get('text_matrix_zero');
		$data['text_matrix_big'] = $this->language->get('text_matrix_big');

		// Button
		$data['button_add'] 		= $this->language->get('button_add');
		$data['button_save'] 		= $this->language->get('button_save');
		$data['button_cancel'] 	= $this->language->get('button_cancel');
		$data['button_download'] 		= $this->language->get('button_download');
		$data['button_upload'] 		= $this->language->get('button_upload');
		$data['button_matrix_row_add'] 		= $this->language->get('button_matrix_row_add');
		$data['button_matrix_row_remove'] 		= $this->language->get('button_matrix_row_remove');

		// File
		$data['file_column_name'] = $this->language->get('file_column_name');
		$data['file_column_model'] = $this->language->get('file_column_model');
		$data['file_column_sku'] = $this->language->get('file_column_sku');
		$data['file_example_name'] = $this->language->get('file_example_name');
		$data['file_example_model'] = $this->language->get('file_example_model');
		$data['file_example_sku'] = $this->language->get('file_example_sku');

		// Example
		$data['example_instore'] = $this->language->get('example_instore');
		$data['example_instock'] = $this->language->get('example_instock');
		$data['example_intrade'] = $this->language->get('example_intrade');
		$data['example_empty'] = $this->language->get('example_empty');

		// Help
		$data['help_template'] = $this->language->get('help_template');
		$data['help_modification'] = $this->language->get('help_modification');
		$data['help_option_with_quantity'] = $this->language->get('help_option_with_quantity');
		$data['help_xlsx'] = $this->language->get('help_xlsx');
		$data['help_default'] = $this->language->get('help_default');
		$data['help_import_template'] = $this->language->get('help_import_template');
		$data['help_display_empty'] = $this->language->get('help_display_empty');
		$data['help_display_stock'] = $this->language->get('help_display_stock');
		$data['help_display_trade'] = $this->language->get('help_display_trade');
		$data['help_display_title'] = $this->language->get('help_display_title');
		$data['help_display_before'] = $this->language->get('help_display_before');
		$data['help_display_after'] = $this->language->get('help_display_after');
		$data['help_display_type'] = $this->language->get('help_display_type');

		// Error
		$data['error_permission'] = $this->language->get('error_permission');
		$data['error_stock'] = $this->language->get('error_stock');
		$data['error_method'] = $this->language->get('error_method');
		$data['error_multistore_empty'] = $this->language->get('error_multistore_empty');
		$data['error_search_products'] = $this->language->get('error_search_products');
		$data['error_file_empty'] = $this->language->get('error_file_empty');
		$data['error_file_upload'] = $this->language->get('error_file_upload');
		$data['error_file_code'] = $this->language->get('error_file_code');

		// About
		$data['about_module'] = $this->language->get('about_module');
		$data['version'] = sprintf($this->language->get('version'), $this->module_version);

		// Editor
		if ($this->multistore->getConfigValue('config_editor_default')) {
			$data['ckeditor'] = $this->multistore->getConfigValue('config_editor_default');
			$this->document->addScript('view/javascript/ckeditor/ckeditor.js');
			$this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
		} else {
			$this->document->addScript('view/javascript/summernote/summernote.js');
			$this->document->addScript('view/javascript/summernote/lang/summernote-' . $this->language->get('lang') . '.js');
			$this->document->addScript('view/javascript/summernote/opencart.js');
			$this->document->addStyle('view/javascript/summernote/summernote.css');
		}

		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();

		// if ($this->model_extension_module_multistore->check1version() == 0) {
		// 	$data['is1version'] = true;
		// } else {
		// 	$data['is1version'] = false;
		// }

		$data['action'] = $this->url->link('extension/module/multistore', $this->token_name .'='. $this->token_value, true);
		$data['cancel'] = $this->url->link('marketplace/extension', $this->token_name .'='. $this->token_value . '&type=module', true);
		$data['zero']		= $this->url->link('extension/module/multistore/setZero', $this->token_name .'='. $this->token_value, true);
		$data['template'] = htmlspecialchars_decode($this->url->link('extension/module/multistore/getTemplate', $this->token_name .'='. $this->token_value, true));
		$data['upload'] = htmlspecialchars_decode($this->url->link('tool/upload/upload', $this->token_name .'='. $this->token_value, true));
		$data['import'] = htmlspecialchars_decode($this->url->link('extension/module/multistore/import', $this->token_name .'='. $this->token_value, true));

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/multistore', $data));
	}

	public function listing(){
		$this->load->language('extension/module/multistore');

		$this->document->setTitle($this->language->get('page_title'));

		$this->load->model('extension/module/multistore');
		$this->load->library('multistore');

		$this->getList();
	}

	public function add(){
		$this->load->language('extension/module/multistore');

		$this->document->setTitle($this->language->get('page_title'));

		$this->load->model('extension/module/multistore');
		$this->load->library('multistore');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_extension_module_multistore->addMultistore($this->request->post);

			$this->session->data['success'] = $this->language->get('text_add_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_type'])) {
				$url .= '&filter_type=' . urlencode(html_entity_decode($this->request->get['filter_type'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_geo_zone_id'])) {
				$url .= '&filter_geo_zone_id=' . $this->request->get['filter_geo_zone_id'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('extension/module/multistore/listing', $this->token_name .'='. $this->token_value . $url, true));
		}

		$this->getForm();
	}

	public function edit(){
		$this->load->language('extension/module/multistore');

		$this->document->setTitle($this->language->get('page_title'));

		$this->load->model('extension/module/multistore');
		$this->load->library('multistore');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_extension_module_multistore->editMultistore($this->request->get['multistore_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_edit_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_type'])) {
				$url .= '&filter_type=' . urlencode(html_entity_decode($this->request->get['filter_type'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_geo_zone_id'])) {
				$url .= '&filter_geo_zone_id=' . $this->request->get['filter_geo_zone_id'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('extension/module/multistore/listing', $this->token_name .'='. $this->token_value . $url, true));
		}

		$this->getForm();
	}

	public function delete(){
		$this->load->language('extension/module/multistore');

		$this->document->setTitle($this->language->get('page_title'));

		$this->load->model('extension/module/multistore');
		$this->load->library('multistore');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $multistore_id) {
				$this->model_extension_module_multistore->deleteMultistore($multistore_id);
			}

			$this->session->data['success'] = $this->language->get('text_remove_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_type'])) {
				$url .= '&filter_type=' . urlencode(html_entity_decode($this->request->get['filter_type'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_geo_zone_id'])) {
				$url .= '&filter_geo_zone_id=' . $this->request->get['filter_geo_zone_id'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('extension/module/multistore/listing', $this->token_name .'='. $this->token_value . $url, true));
		}

		$this->getList();
	}

	public function clear(){
		$this->load->language('extension/module/multistore');
		$this->load->model('extension/module/multistore');
		$this->load->library('multistore');

		$this->document->setTitle($this->language->get('page_title'));

		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateClear()) {

			$this->model_extension_module_multistore->clearQuantity($this->request->post);
			$this->model_extension_module_multistore->clearQuantityOption($this->request->post);

			$data['success'] = $this->language->get('text_clear_success');
		}

		if (!empty($this->error) && is_array($this->error)) {
			$data['errors'] = $this->error;
		} else {
			$data['errors'] = array();
		}

		$data['heading_title'] = $this->language->get('heading_form_title');

		$data['text_form'] = $this->language->get('text_multistore_clear');
		$data['text_select_all'] = $this->language->get('text_select_all');
		$data['text_unselect_all'] = $this->language->get('text_unselect_all');
		$data['text_quantity_clear'] = $this->language->get('text_quantity_clear');

		$data['entry_category'] = $this->language->get('entry_category');
		$data['entry_multistore'] = $this->language->get('entry_multistore');
		$data['entry_manufacturer'] = $this->language->get('entry_manufacturer');

		$data['button_clear'] = $this->language->get('button_clear');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_type'])) {
			$url .= '&filter_type=' . urlencode(html_entity_decode($this->request->get['filter_type'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filer_geo_zone'])) {
			$url .= '&filer_geo_zone=' . $this->request->get['filer_geo_zone'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', $this->token_name .'='. $this->token_value, true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_clear'),
			'href' => $this->url->link('extension/module/multistore/clear', $this->token_name .'='. $this->token_value . $url, true)
		);

		$data['action'] = $this->url->link('extension/module/multistore/clear', $this->token_name .'='. $this->token_value . $url, true);

		// Category block
		$this->load->model('catalog/category');
		$data['categories'] = array();
		foreach ($this->model_catalog_category->getCategories() as $category) {
			$data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'       	=> $category['name']
			);
		}

		if (isset($this->request->post['checked_category'])) {
			$data['checked_category'] = $this->request->post['checked_category'];
		} else {
			$data['checked_category'] = array();
		}

		// Manufacturer block
		$this->load->model('catalog/manufacturer');
		$data['manufacturers'] = array();
		foreach($this->model_catalog_manufacturer->getManufacturers() as $manufacturer){
			$data['manufacturers'][] = array(
				'manufacturer_id' => $manufacturer['manufacturer_id'],
				'name'       			=> $manufacturer['name']
			);
		}

		if (isset($this->request->post['checked_manufacturer'])) {
			$data['checked_manufacturer'] = $this->request->post['checked_manufacturer'];
		} else {
			$data['checked_manufacturer'] = array();
		}

		// Multistore block
		$this->load->model('extension/module/multistore');
		$data['multistores'] = array();
		foreach ($this->model_extension_module_multistore->getMultistores() as $multistore) {
			$data['multistores'][] = array(
				'multistore_id' => $multistore['multistore_id'],
				'name'       		=> $multistore['name']
			);
		}

		if (isset($this->request->post['checked_multistore'])) {
			$data['checked_multistore'] = $this->request->post['checked_multistore'];
		} else {
			$data['checked_multistore'] = array();
		}

		$data['cancel'] = $this->url->link('extension/module/multistore/listing', $this->token_name .'='. $this->token_value . $url, true);

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/multistore_clear', $data));
	}

	protected function getList(){
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}

		if (isset($this->request->get['filter_type'])) {
			$filter_type = $this->request->get['filter_type'];
		} else {
			$filter_type = null;
		}

		if (isset($this->request->get['filter_geo_zone_id'])) {
			$filter_geo_zone_id = $this->request->get['filter_geo_zone_id'];
		} else {
			$filter_geo_zone_id = null;
		}

		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}


		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_type'])) {
			$url .= '&filter_type=' . urlencode(html_entity_decode($this->request->get['filter_type'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filer_geo_zone'])) {
			$url .= '&filer_geo_zone=' . $this->request->get['filer_geo_zone'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', $this->token_name .'='. $this->token_value, true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_listing_title'),
			'href' => $this->url->link('extension/module/multistore/list', $this->token_name .'='. $this->token_value . $url, true)
		);

		$data['add'] = $this->url->link('extension/module/multistore/add', $this->token_name .'='. $this->token_value . $url, true);
		$data['delete'] = $this->url->link('extension/module/multistore/delete', $this->token_name .'='. $this->token_value . $url, true);
		$data['clear'] = $this->url->link('extension/module/multistore/clear', $this->token_name .'='. $this->token_value . $url, true);
		$data['setting'] = $this->url->link('extension/module/multistore', $this->token_name .'='. $this->token_value . $url, true);

		$data['multistores'] = array();

		$filter_data = array(
			'filter_name'    			=> $filter_name,
			'filter_type'     		=> $filter_type,
			'filter_status'     	=> $filter_status,
			'filter_geo_zone_id' 	=> $filter_geo_zone_id,
			'sort'              	=> $sort,
			'order'             	=> $order,
			'start'             	=> ($page - 1) * $this->multistore->getConfigValue('config_limit_admin'),
			'limit'             	=> $this->multistore->getConfigValue('config_limit_admin')
		);

		$multistores_total = $this->model_extension_module_multistore->getTotalMultistores($filter_data);

		$results = $this->model_extension_module_multistore->getMultistores($filter_data);

		foreach ($results as $result) {
			$data['multistores'][] = array(
				'multistore_id' => $result['multistore_id'],
				'name'       		=> $result['name'],
				'type'     			=> $this->language->get('text_'.$result['type']),
				'geo_zone'     	=> ($result['geo_zone'] ? $result['geo_zone'] : $this->language->get('text_all_zones')),
				'geo_zone_id'   => $result['geo_zone_id'],
				'status'     		=> ($result['status']) ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
				'edit'       		=> $this->url->link('extension/module/multistore/edit', $this->token_name .'='. $this->token_value . '&multistore_id=' . $result['multistore_id'] . $url, true)
			);
		}

		$data['heading_title'] = $this->language->get('heading_listing_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_geo_all'] = $this->language->get('text_geo_all');
		$data['text_any'] = $this->language->get('text_any');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_type'] = $this->language->get('column_type');
		$data['column_geo_zone'] = $this->language->get('column_geo_zone');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_type'] = $this->language->get('entry_type');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_clear'] = $this->language->get('button_clear');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_setting'] = $this->language->get('button_setting');

		$data['token'] = $this->token_value;

		$this->load->model('localisation/geo_zone');
		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		$data['stock_types'] = array(
			'store' => $this->language->get('text_store'),
			'stock' => $this->language->get('text_stock'),
			'trade' => $this->language->get('text_trade')
		);

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_type'])) {
			$url .= '&filter_type=' . urlencode(html_entity_decode($this->request->get['filter_type'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_geo_zone_id'])) {
			$url .= '&filter_geo_zone_id=' . $this->request->get['filter_geo_zone_id'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('extension/module/multistore/listing', $this->token_name .'='. $this->token_value . '&sort=md.name' . $url, true);
		$data['sort_type'] = $this->url->link('extension/module/multistore/listing', $this->token_name .'='. $this->token_value . '&sort=m.type' . $url, true);
		$data['sort_status'] = $this->url->link('extension/module/multistore/listing', $this->token_name .'='. $this->token_value . '&sort=m.status' . $url, true);
		$data['sort_geo_zone'] = $this->url->link('extension/module/multistore/listing', $this->token_name .'='. $this->token_value . '&sort=m.geo_zone' . $url, true);

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_type'])) {
			$url .= '&filter_type=' . urlencode(html_entity_decode($this->request->get['filter_type'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_geo_zone_id'])) {
			$url .= '&filter_geo_zone_id=' . $this->request->get['filter_geo_zone_id'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $multistores_total;
		$pagination->page = $page;
		$pagination->limit = $this->multistore->getConfigValue('config_limit_admin');
		$pagination->url = $this->url->link('extension/module/multistore/listing', $this->token_name .'='. $this->token_value . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($multistores_total) ? (($page - 1) * $this->multistore->getConfigValue('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->multistore->getConfigValue('config_limit_admin')) > ($multistores_total - $this->multistore->getConfigValue('config_limit_admin'))) ? $multistores_total : ((($page - 1) * $this->multistore->getConfigValue('config_limit_admin')) + $this->multistore->getConfigValue('config_limit_admin')), $multistores_total, ceil($multistores_total / $this->multistore->getConfigValue('config_limit_admin')));

		$data['filter_name'] = $filter_name;
		$data['filter_type'] = $filter_type;
		$data['filter_status'] = $filter_status;
		$data['filter_geo_zone_id'] = $filter_geo_zone_id;

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/multistore_listing', $data));
	}

	protected function getForm(){
		$this->model_extension_module_multistore->ensureExtraColumns();

		$data['heading_title'] = $this->language->get('heading_form_title');

		$data['text_form'] = !isset($this->request->get['multistore_id']) ? $this->language->get('text_multistore_add') : $this->language->get('text_multistore_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_type'] = $this->language->get('entry_type');
		$data['entry_sort'] = $this->language->get('entry_sort');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_default'] = $this->language->get('entry_default');
		$data['entry_infinity'] = $this->language->get('entry_infinity');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_alias'] = $this->language->get('entry_alias');
		$data['help_alias'] = $this->language->get('help_alias');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['text_any'] = $this->language->get('text_any');
		$data['text_geo_all'] = $this->language->get('text_geo_all');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['alias'])) {
			$data['error_alias'] = $this->error['alias'];
		} else {
			$data['error_alias'] = '';
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_type'])) {
			$url .= '&filter_type=' . urlencode(html_entity_decode($this->request->get['filter_type'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filer_geo_zone'])) {
			$url .= '&filer_geo_zone=' . $this->request->get['filer_geo_zone'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', $this->token_name .'='. $this->token_value, true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_listing_title'),
			'href' => $this->url->link('extension/module/multistore/listing', $this->token_name .'='. $this->token_value . $url, true)
		);

		if (!isset($this->request->get['multistore_id'])) {
			$data['action'] = $this->url->link('extension/module/multistore/add', $this->token_name .'='. $this->token_value . $url, true);
		} else {
			$data['action'] = $this->url->link('extension/module/multistore/edit', $this->token_name .'='. $this->token_value . '&multistore_id=' . $this->request->get['multistore_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('extension/module/multistore', $this->token_name .'='. $this->token_value . $url, true);

		if (isset($this->request->get['multistore_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$multistore_info = $this->model_extension_module_multistore->getMultistore($this->request->get['multistore_id']);
		}

		$data['token'] = $this->token_value;

		$data['stock_types'] = array(
			'store' => $this->language->get('text_store'),
			'stock' => $this->language->get('text_stock'),
			'trade' => $this->language->get('text_trade')
		);

		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();

		$this->load->model('localisation/geo_zone');
		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['description'])) {
			$data['description'] = $this->request->post['description'];
		} elseif (isset($this->request->get['multistore_id'])) {
			$data['description'] = $this->model_extension_module_multistore->getMultistoreDescription($this->request->get['multistore_id']);
		} else {
			$data['description'] = array();
		}

		if (isset($this->request->post['multistore_id'])) {
			$data['multistore_id'] = $this->request->post['multistore_id'];
		} elseif (!empty($multistore_info)) {
			$data['multistore_id'] = $multistore_info['multistore_id'];
		} else {
			$data['multistore_id'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($multistore_info)) {
			$data['status'] = $multistore_info['status'];
		} else {
			$data['status'] = 0;
		}

		if (isset($this->request->post['type'])) {
			$data['type'] = $this->request->post['type'];
		} elseif (!empty($multistore_info)) {
			$data['type'] = $multistore_info['type'];
		} else {
			$data['type'] = 'store';
		}

		if (isset($this->request->post['infinity'])) {
			$data['infinity'] = $this->request->post['infinity'];
		} elseif (!empty($multistore_info)) {
			$data['infinity'] = $multistore_info['infinity'];
		} else {
			$data['infinity'] = 0;
		}

		if (isset($this->request->post['geo_zone_id'])) {
			$data['geo_zone_id'] = $this->request->post['geo_zone_id'];
		} elseif (!empty($multistore_info)) {
			$data['geo_zone_id'] = $multistore_info['geo_zone_id'];
		} else {
			$data['geo_zone_id'] = 0;
		}

		$this->load->model('setting/store');

		$data['stores'] = array();

		$data['stores'][] = array(
			'store_id' => 0,
			'name'     => $this->language->get('text_default')
		);

		foreach ($this->model_setting_store->getStores() as $store) {
			$data['stores'][] = array(
				'store_id' => $store['store_id'],
				'name'     => $store['name']
			);
		}

		if (isset($this->request->post['multistore_store'])) {
			$data['multistore_store'] = $this->request->post['multistore_store'];
		} elseif (isset($this->request->get['multistore_id'])) {
			$data['multistore_store'] = $this->model_extension_module_multistore->getMultistoreStores($this->request->get['multistore_id']);
		} else {
			$data['multistore_store'] = array(0);
		}

		if (isset($this->request->post['alias'])) {
			$data['alias'] = $this->request->post['alias'];
		} elseif (!empty($multistore_info)) {
			$data['alias'] = $multistore_info['alias'];
		} else {
			$data['alias'] = substr(sha1(time()), 0, 16);
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($multistore_info)) {
			$data['sort_order'] = $multistore_info['sort_order'];
		} else {
			$data['sort_order'] = 0;
		}

		if (isset($this->request->post['phones'])) {
			$data['phones'] = $this->request->post['phones'];
		} elseif (!empty($multistore_info) && !empty($multistore_info['phones'])) {
			$data['phones'] = json_decode($multistore_info['phones'], true);
		} else {
			$data['phones'] = array();
		}

		if (isset($this->request->post['map_data'])) {
			$data['map_data'] = $this->request->post['map_data'];
		} elseif (!empty($multistore_info) && !empty($multistore_info['map_data'])) {
			$data['map_data'] = json_decode($multistore_info['map_data'], true);
		} else {
			$data['map_data'] = array('lat' => '', 'lng' => '', 'zoom' => '14', 'marker_title' => '');
		}

		// Editor
		if ($this->multistore->getConfigValue('config_editor_default')) {
			$data['ckeditor'] = $this->multistore->getConfigValue('config_editor_default');
			$this->document->addScript('view/javascript/ckeditor/ckeditor.js');
			$this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
		} else {
			$this->document->addScript('view/javascript/summernote/summernote.js');
			$this->document->addScript('view/javascript/summernote/lang/summernote-' . $this->language->get('lang') . '.js');
			$this->document->addScript('view/javascript/summernote/opencart.js');
			$this->document->addStyle('view/javascript/summernote/summernote.css');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/multistore_form', $data));
	}

	// Validate
	protected function validate(){
		if (!$this->user->hasPermission('modify', 'extension/module/multistore')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (empty($this->request->post['multistore_stock_status_instore'])){
			$this->error['error_stock_status_instore'] = $this->language->get('error_stock_status_instore');
		}

		if (empty($this->request->post['multistore_stock_status_instock'])){
			$this->error['error_stock_status_instock'] = $this->language->get('error_stock_status_instock');
		}

		if (empty($this->request->post['multistore_stock_status_intrade'])){
			$this->error['error_stock_status_intrade'] = $this->language->get('error_stock_status_intrade');
		}

		if (empty($this->request->post['multistore_stock_status_out_of_stock'])){
			$this->error['error_stock_insterror_stock_status_out_of_stock'] = $this->language->get('error_stock_status_out_of_stock');
		}

		if ($this->request->post['multistore_matrix_status'] && (empty($this->request->post['multistore_matrix']) || !isset($this->request->post['multistore_matrix']))) {
			$this->error['matrix'] = $this->language->get('error_matrix');
		} elseif ($this->request->post['multistore_matrix_status'] && is_array($this->request->post['multistore_matrix'])) {
			foreach($this->request->post['multistore_matrix'] as $row) {
				foreach($row['title'] as $value) {
					if (empty($value)) {
						$this->error['matrix'] = $this->language->get('error_matrix_empty_value');
						break;
					}
				}
			}
		}

		return !$this->error;
	}

	protected function validateForm(){
		if (!$this->user->hasPermission('modify', 'extension/module/multistore')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (empty($this->request->post['alias'])) {
			$this->error['alias'] = $this->language->get('error_alias');
		}

		if (empty($this->request->post['description'])) {
			$this->error['name'] = $this->language->get('error_name');
		} else {
			foreach($this->request->post['description'] as $language_id => $description){
				if (empty($description['name'])){
					$this->error['name'] = $this->language->get('error_name');
				}
			}
		}

		return !$this->error;
	}

	protected function validateDelete(){
		if (!$this->user->hasPermission('modify', 'extension/module/multistore')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validateClear(){
		if (!$this->user->hasPermission('modify', 'extension/module/multistore')) {
			$this->error[] = $this->language->get('error_permission');
		}

		if (empty($this->request->post['checked_category'])) {
			$this->error[] = $this->language->get('error_checked_category');
		}

		if (empty($this->request->post['checked_manufacturer'])) {
			$this->error[] = $this->language->get('error_checked_manufacturer');
		}

		if (empty($this->request->post['checked_multistore'])) {
			$this->error[] = $this->language->get('error_checked_multistore');
		}

		return !$this->error;
	}

	// Ajax
	public function import(){

		$this->load->model('tool/upload');
		$this->load->model('catalog/product');
		$this->load->model('extension/module/multistore');
		$this->load->language('extension/module/multistore');

		$json = array();
		$success 	= 0;
		$failed 	= 0;

		// Get file code
		if ($this->request->server['REQUEST_METHOD'] == 'POST' && isset($this->request->post['code'])) {
			$file = $this->model_tool_upload->getUploadByCode($this->request->post['code']);
			if (empty($file['filename'])) {
				$json['error'] = $this->language->get('error_file_code');
			}

		} else {
			$json['error'] = $this->language->get('error_file_upload');
		}

		// Получаем адрес файла
		if (!$json) {
			$products = $this->model_extension_module_multistore->readFile($file['filename']);
			if (empty($products)) {
				$json['error'] = $this->language->get('error_file_empty');
			}
		}

		if (!$json) {
			foreach($products as $key => $product){

				$product_id = $this->model_extension_module_multistore->getProduct(array(
					'filter_name' => $product['name'],
					'filter_model' => $product['model']
				));

				if ($product_id){
					$products[$key]['product_id'] = $product_id;
					$success++;
				} else {
					unset($products[$key]);
					$failed++;
				}

			}

			if (empty($products)) {
				$json['error'] = $this->language->get('error_search_products');
			}

		}

		if (!$json) {

			foreach($products as $product){
				$product_id = $product['product_id'];
				foreach($product['multistores'] as $multistore_id => $quantity){
					$this->model_extension_module_multistore->setProductMultistore($product_id, $multistore_id, $quantity);
				}
			}

			$this->model_extension_module_multistore->updateQuantity();

			$json['products'] = $products;
			$json['success'] = $success;
			$json['failed'] = $failed;

		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}

	public function getTemplate(){

		$this->load->language('extension/module/multistore');
		$this->load->model('extension/module/multistore');

		$json = array();

		// Check method
		if ($this->request->server['REQUEST_METHOD'] != 'GET') {
			$json['error'] = $this->language->get('error_method');
		}

		// Get multistores
		if (!$json) {

			$multistores = $this->model_extension_module_multistore->getMultistores();
			if (empty($multistores)) {
				$json['error'] = $this->language->get('error_multistore_empty');
			}

		}

		// Получаем сам файл
		if (!$json) {

			$this->load->model('catalog/product');
			$products = $this->model_catalog_product->getProducts();

			$json['route'] = $this->model_extension_module_multistore->createTemplate($multistores, $products);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}

	public function migration(){
		$this->load->language('extension/module/multistore');
		$this->load->model('extension/module/multistore');

		$json = array();

		// Check method
		if ($this->request->server['REQUEST_METHOD'] != 'POST') {
			$json['error'] = $this->language->get('error_method');
		}

		if (!$json) {
			if ($this->model_extension_module_multistore->check2version()){
				// Получаем данные из старых колонок
				$old_multistores = $this->model_extension_module_multistore->getOldMultistores();

				// Создаем новые и заполняем их, удаляем не нужные колонки
				$this->model_extension_module_multistore->migration($old_multistores);

				// Все хорошо, может ли быть иначе?
				$json['success'] = true;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function changeOrderMultistore() {
		$this->load->model('extension/module/multistore');
		$this->load->language('extension/module/multistore');

		$json = array();

		// Check method
		if ($this->request->server['REQUEST_METHOD'] != 'POST') {
			$json['error'] = true;
		}

		if (!isset($this->request->post['multistore_id']) || empty($this->request->post['order_id'])) {
			$json['error'] = true;
		}

		if (!$json) {
			$this->model_extension_module_multistore->setOrderMultistore($this->request->post['order_id'], (int)$this->request->post['multistore_id']);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}

	// Help
	private function getPost($data){
		if (VERSION < 3) {
			return $data;
		} else {
			$new_data = array();
			foreach($data as $key => $param){
				$new_data['module_'.$key] = $param;
			}
			return $new_data;
		}
	}

	// Install
	public function install() {
		$this->load->model('extension/module/multistore');
		$this->model_extension_module_multistore->install();
	}

	public function uninstall() {
		$this->load->model('extension/module/multistore');
		$this->model_extension_module_multistore->uninstall();
	}

}