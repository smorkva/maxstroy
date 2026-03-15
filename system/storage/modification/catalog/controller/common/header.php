<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}


		$data['site_screen_width'] = $this->config->get('site_screen_width'); 
		$data['cs_type_btn'] = $this->config->get('cs_type_btn'); 
		$data['item_setting'] = $this->config->get('item_setting'); 
		$data['setting_module'] = $this->config->get('setting_module'); 
		$megamenu_setting = $this->config->get('megamenu_setting');
		if($megamenu_setting['status']=='1'){
			$data['megamenu_status']=true;
			$data['menuvh'] = $this->load->controller('common/cyber_menuvh');
		} else { 
			$data['megamenu_status']=false;
		}
		$data['main_menu_fix_mobile'] = $megamenu_setting['main_menu_fix_mobile'];
		$data['type_mobile_menu'] = $megamenu_setting['type_mobile_menu'];
		$data['first_name'] = ($this->customer->isLogged()) ? $this->customer->getFirstName() : '';
		$data['last_name'] = ($this->customer->isLogged()) ? $this->customer->getLastName() : '';
		$data['nst_data'] = $this->config->get('nst_data');
		$data['status_border_radius'] = (!empty($this->config->get('status_border_radius')) ? 1 : 0);
		$data['show_h_compare'] = $this->config->get('show_h_compare');
		$data['show_h_wishlist'] = $this->config->get('show_h_wishlist');
		$data['config_fixed_panel_top'] = $this->config->get('config_fixed_panel_top');
		$data['config_main_menu_selection'] = $megamenu_setting['main_menu_selection'];		
		$data['config_change_color_icon_sticker_popular'] = $this->config->get('config_change_color_icon_sticker_popular');
		$data['config_change_background_sticker_popular'] = $this->config->get('config_change_background_sticker_popular');
		$data['config_change_color_text_sticker_popular'] = $this->config->get('config_change_color_text_sticker_popular');
		$data['config_change_color_icon_sticker_special'] = $this->config->get('config_change_color_icon_sticker_special');
		$data['config_change_background_sticker_special'] = $this->config->get('config_change_background_sticker_special');
		$data['config_change_color_text_sticker_special'] = $this->config->get('config_change_color_text_sticker_special');
		$data['config_change_color_icon_sticker_topbestseller'] = $this->config->get('config_change_color_icon_sticker_topbestseller');
		$data['config_change_background_sticker_topbestseller'] = $this->config->get('config_change_background_sticker_topbestseller');
		$data['config_change_color_text_sticker_topbestseller'] = $this->config->get('config_change_color_text_sticker_topbestseller');
		$data['config_change_color_icon_sticker_newproduct'] = $this->config->get('config_change_color_icon_sticker_newproduct');
		$data['config_change_background_sticker_newproduct'] = $this->config->get('config_change_background_sticker_newproduct');
		$data['config_change_color_text_sticker_newproduct'] = $this->config->get('config_change_color_text_sticker_newproduct');	
		$data['config_ns_themes_custom_bg_mode'] = $this->config->get('config_ns_themes_custom_bg_mode');
		$data['config_themes_custom_bg_img_preview'] = $this->config->get('config_themes_custom_bg_img_preview');
		$data['config_themes_custom_bg_repeat'] = $this->config->get('config_themes_custom_bg_repeat');
		$data['config_themes_custom_bg_attachment'] = $this->config->get('config_themes_custom_bg_attachment');
		$data['config_ns_themes_custom_bg_mode_color'] = $this->config->get('config_ns_themes_custom_bg_mode_color');
		$data['config_themes_custom_bg_attachment'] = $this->config->get('config_themes_custom_bg_attachment');
		$data['config_themes_custom_bg_position'] = $this->config->get('config_themes_custom_bg_position');
		$data['config_on_off_shopping_cart_hover'] = (!empty($this->config->get('config_on_off_shopping_cart_hover')) ? 1 : 0);
		$data['custom_style'] = $this->config->get('config_custom_style_newstore');
		$data['color_schem'] = $this->config->get('config_design_template_color_theme');
		$design_fastorder = $this->config->get('config_select_design_fastorder');
		$callbackpro = $this->config->get('callbackpro');
		$design_callback = $callbackpro['select_design_theme_callback'];
		$design_special_timer = $this->config->get('config_design_special_timer');
		$minify_css = (!empty($this->config->get('config_minify_css')) ? 1 : 0);
		$minify_js = (!empty($this->config->get('config_minify_js')) ? 1 : 0);
		
		if(isset($minify_css) && ($minify_css == 1) || (isset($minify_js) && ($minify_js == 1))){
		$developer_mode = 0;
		} else {
		$developer_mode = 1;
		}
		require_once(DIR_SYSTEM . 'minifyns/startup.php');
		$cyberstore2 = new Cyberstore();
		$this->registry->set('cyberstore', $cyberstore2);
		$cyberstore2->utils = new CyberstoreUtils($this->registry);
		$cyberstore2->cache = new CyberstoreCache($this->registry);
		$cyberstore2->minifier = new CyberstoreMinifier($cyberstore2->cache);
		$cyberstore2->cache->setDeveloperMode($developer_mode);
		$cyberstore2->minifier->setMinifyCss($this->config->get('config_minify_css'));	
		$cyberstore2->minifier->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
		$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/js/owl-carousel/owl.carousel.css');
		$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/js/owl-carousel/owl.transitions.css');
		$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/font-awesome/css/font-awesome.min.css');
		$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/stylesheet/stylesheet.css');
		if($data['config_main_menu_selection'] =='0') {
			$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/stylesheet/menu_h.css');
		} else { 
			$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/stylesheet/menu_v.css');
		}
		
		$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/stylesheet/stickers.css');
		$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/stylesheet/tabs.css');
		$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/stylesheet/quickview.css');
		if($data['color_schem'] !=1){
			$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/stylesheet/theme_scheme/theme_'. $data['color_schem'] .'.css');
		}
		$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/stylesheet/csseditor.css');
		$cyberstore2->minifier->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
		if($design_special_timer){ 
			$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/js/productany/js/countdown/jquery.countdown_'. $design_special_timer .'.css');
		} else { 
			$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/js/productany/js/countdown/jquery.countdown_1.css');
		}
		if($design_fastorder){ 
			$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/stylesheet/popup-fastorder/fastorder'. $design_fastorder .'.css');
		} else { 
			$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/stylesheet/popup-fastorder/fastorder1.css');
		}
		if($design_callback=='1'){ 
			$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/stylesheet/popup-callback/callback.css');
		} else { 
			$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/stylesheet/popup-callback/callback2.css');
		}
		$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/stylesheet/csscallback.css');
		if ($data['custom_style'] !='') { 
			$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/stylesheet/'. $data['custom_style'] .'.css');
		}
		$agreedata = $this->config->get('agreedata');
		if (isset($agreedata) && $agreedata['status'] != 0) {
			$cyberstore2->minifier->addStyle('catalog/view/theme/cyberstore/stylesheet/agree_popup/style_agree.css');
		}
		if(isset($minify_css) && ($minify_css == 1)){
			$data['minifycss'] = false;
			foreach ($data['styles'] as $style) {
				$cyberstore2->minifier->addStyle($style['href']);
			}
		} else {
			$data['minifycss'] = true;
		}
		$data['csscyberstore'] = $cyberstore2->minifier->css();
		
		$cyberstore2->minifier->setMinifyJs($this->config->get('config_minify_js'));
		$cyberstore2->minifier->addScript('catalog/view/javascript/jquery/jquery-2.1.1.min.js', 'header'); 
		$cyberstore2->minifier->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js', 'header'); 
		$cyberstore2->minifier->addScript('catalog/view/theme/cyberstore/js/owl-carousel/owl.carousel.js', 'header'); 
		$cyberstore2->minifier->addScript('catalog/view/javascript/bootstrap/js/bootstrap.min.js', 'header'); 
		$cyberstore2->minifier->addScript('catalog/view/theme/cyberstore/js/jquery.menu-aim.js', 'header'); 
		$cyberstore2->minifier->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js', 'header'); 
		$cyberstore2->minifier->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js', 'header'); 
		$cyberstore2->minifier->addScript('catalog/view/theme/cyberstore/js/showmore.js', 'header'); 
		$cyberstore2->minifier->addScript('catalog/view/theme/cyberstore/js/common.js', 'header'); 
		$cyberstore2->minifier->addScript('catalog/view/theme/cyberstore/js/maskedinput.js', 'header'); 
		$cyberstore2->minifier->addScript('catalog/view/theme/cyberstore/js/newfastorder.js', 'header'); 
		$cyberstore2->minifier->addScript('catalog/view/theme/cyberstore/js/callback_send.js', 'header'); 
		$cyberstore2->minifier->addScript('catalog/view/theme/cyberstore/js/popup.js', 'header'); 
		$cyberstore2->minifier->addScript('catalog/view/theme/cyberstore/js/productany/js/countdown/jquery.countdown.js', 'header'); 
		$cyberstore2->minifier->addScript('catalog/view/theme/cyberstore/js/jquery_lazyload/lazyload.min.js', 'header'); 
		if(isset($minify_js) && ($minify_js == 1)){
			$data['minifyjs'] = false;
			foreach ($data['scripts'] as $script) {
				$cyberstore2->minifier->addScript($script, 'header'); 
			}
		} else {
			$data['minifyjs'] = true;
		}
		$data['jscyberstore'] = $cyberstore2->minifier->js('header');
		
		
		$header_nav_menu_link_array = $this->config->get('header_nav_menu_link');
		if(isset($header_nav_menu_link_array)) {
			$header_nav_menu_link = $this->config->get('header_nav_menu_link');
		} else {
			$header_nav_menu_link = array();
		}
		$data['header_nav_menu_links'] = array();
		
		foreach ($header_nav_menu_link as $result) {				
			$data['header_nav_menu_links'][] = array(
				'icon_image' 	=> $result['icon_image'],
				'title' 		=> $result['title'],
				'link'  		=> $result['link'][$this->config->get('config_language_id')],
				'popup'  		=> $result['popup'],		
			);	
		}
		$data['home_page'] = (isset($this->request->server['HTTPS']) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
			$this->load->language('cyberstore/lang');
			$data['text_info_mob'] = $this->language->get('text_info_mob');	
			$data['text_search'] = $this->language->get('text_search');	
			$data['days'] = $this->language->get('days');	
			$data['hours'] = $this->language->get('hours');	
			$data['minutes'] = $this->language->get('minutes');	
			$data['sec'] = $this->language->get('sec');	
			$data['text_showmore'] = $this->language->get('text_showmore');
			$data['text_callback_header'] = $this->language->get('text_callback_header');
			$data['button_shopping'] = $this->language->get('button_shopping');
			$data['button_checkout'] = $this->language->get('button_checkout');
			$data['onepcheckout'] = $this->url->link('checkout/onepcheckout', '', true);
			$data['general_menu_on_off'] = $this->config->get('config_menu_always_open_on_the_left');
			$this->load->language('product/category');
			$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$data['total_compare'] = isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0;
			$data['total_wishlist'] = isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0;
			$data['compare'] = $this->url->link('product/compare');
			$data['main_phone'] = $this->config->get('config_main_phone'); 
			$data['header_phones'] = $this->config->get('config_phones_header');
			$header_phones = $this->config->get('config_phones_header');
			$data['lang_id'] = $this->config->get('config_language_id');
			$this->load->model('tool/image');	
			$data['arbitrary_text'] = $this->config->get('arbitrary_text');
			$text_after_phone = $this->config->get('text_after_phone');
			$data['text_after_phone'] = $text_after_phone[$data['lang_id']]['text'];	
			$data['config_phones_array'] = array();
			$data['header_phones_dropdown'] = array();
			if(!empty($header_phones)){
				foreach ($header_phones as $phone_header) {
					if (isset($phone_header['image']) && is_file(DIR_IMAGE . $phone_header['image'])) {
							$data['icon_phone'] = $this->model_tool_image->resize($phone_header['image'], 25, 25);
						} else {
							$data['icon_phone'] = '';
					}		
					if($phone_header['dropdown'] == '1'){
						$data['config_phones_array'][] = array(
							'icon_phone' => $data['icon_phone'],
							'phone'      => $phone_header['phone'],
							'icon'       => (isset($phone_header['icon']) ? $phone_header['icon'] : ''),	
							'type'      =>  (isset($phone_header['type']) ? $phone_header['type'] : ''),
						);	
					} else {
						$data['header_phones_dropdown'][] = array(
							'icon_phone' => $data['icon_phone'],
							'phone'      => $phone_header['phone'],
							'icon'       => (isset($phone_header['icon']) ? $phone_header['icon'] : ''),
							'type'      =>  (isset($phone_header['type']) ? $phone_header['type'] : ''),
						);	
					}		
				}
			}
			$data['swap_header_blocks'] = (!empty($this->config->get('swap_header_blocks')) ? 1 : 0);
		
		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');

			$data['lang_id'] = $this->config->get('config_language_id');
			$data['callbackpro'] = $this->config->get('callbackpro');	
			
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		
		$categories = array();
		

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		return $this->load->view('common/header', $data);
	}
}
