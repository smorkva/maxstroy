<?php
class ControllerExtensionModuleCyberAgreePopup extends Controller {
	public function index() {
		$data['lang_id'] = $this->config->get('config_language_id');
		$data['agreedata'] = $this->config->get('agreedata');	
		$this->response->setOutput($this->load->view('extension/module/agree_popup', $data));		
		
	}
	public function saveAgreeCookie() {
		$agreedata = $this->config->get('agreedata');
		$cookie_day = $agreedata['cookie_day'] ? $agreedata['cookie_day'] : '1';
		if (isset($this->request->get['saveAgreeCookie'])) {
			setcookie('PopupAgree', 1, time() + (60*60*24*$cookie_day), "/");
		}
	}
}