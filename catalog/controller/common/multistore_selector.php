<?php
class ControllerCommonMultistoreSelector extends Controller {

	public function index() {
		$this->load->library('multistore');

		if (!$this->multistore->getConfigValue('multistore_status')) {
			return '';
		}

		$language_id = (int)$this->config->get('config_language_id');

		$results = $this->multistore->getMultistoresStores();

		$data['multistores'] = array();
		foreach ($results as $result) {
			$phones = array();
			$map_data = array();
			$extra_query = $this->db->query("SELECT phones, map_data FROM " . DB_PREFIX . "multistore WHERE multistore_id = '" . (int)$result['multistore_id'] . "'");
			if ($extra_query->num_rows) {
				if (!empty($extra_query->row['phones'])) {
					$phones = json_decode($extra_query->row['phones'], true);
					if (!is_array($phones)) $phones = array();
				}
				if (!empty($extra_query->row['map_data'])) {
					$map_data = json_decode($extra_query->row['map_data'], true);
					if (!is_array($map_data)) $map_data = array();
				}
			}
			$data['multistores'][] = array(
				'multistore_id' => $result['multistore_id'],
				'name'          => $result['name'],
				'phones'        => $phones,
				'map_data'      => $map_data
			);
		}

		if (empty($data['multistores'])) {
			return '';
		}

		// If not selected, default to first store
		if (isset($this->session->data['multistore_id'])) {
			$data['selected'] = (int)$this->session->data['multistore_id'];
		} else {
			$data['selected'] = (int)$data['multistores'][0]['multistore_id'];
			$this->session->data['multistore_id'] = $data['selected'];
		}

		$selected_name = '';
		foreach ($data['multistores'] as $m) {
			if ($m['multistore_id'] == $data['selected']) {
				$selected_name = $m['name'];
				break;
			}
		}

		$data['selected_name'] = $selected_name;
		$data['action'] = $this->url->link('common/multistore_selector/set', '', true);
		$data['redirect'] = $this->url->link(isset($this->request->get['route']) ? $this->request->get['route'] : 'common/home', http_build_query(array_diff_key($this->request->get, array('route' => ''))), true);

		return $this->load->view('common/multistore_selector', $data);
	}

	public function set() {
		// The dropdown posts over AJAX and reloads the page itself, so it is
		// answered with JSON as before. A link can only ever be a GET — a QR on
		// a receipt, an address in a message — and the person following it must
		// land on the shop, not on a JSON body, so that case redirects instead.
		if (isset($this->request->post['multistore_id'])) {
			$json = array();

			$multistore_id = (int)$this->request->post['multistore_id'];
			if ($multistore_id > 0) {
				$this->session->data['multistore_id'] = $multistore_id;
			} else {
				unset($this->session->data['multistore_id']);
			}
			$json['success'] = true;

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));

			return;
		}

		// A link is public and can be edited by anyone who has it, so the id is
		// only taken when it names a store that actually exists and is on. An
		// unknown one would leave the session pointing at nothing, and the shop
		// would then show a catalogue with everything filtered out.
		if (isset($this->request->get['multistore_id'])) {
			$multistore_id = (int)$this->request->get['multistore_id'];

			$this->load->library('multistore');

			foreach ($this->multistore->getMultistores() as $store) {
				if ((int)$store['multistore_id'] === $multistore_id) {
					$this->session->data['multistore_id'] = $multistore_id;
					break;
				}
			}
		}

		// Fixed destination on purpose: a target read out of the query string
		// would turn this into an open redirect — any link on our domain could
		// then carry a customer off to someone else's site.
		$this->response->redirect($this->url->link('common/home', '', true));
	}
}
