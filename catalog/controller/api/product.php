<?php
class ControllerApiProduct extends Controller {
	protected $json;
	
	private function syncItem($item) {
		$exist = $this->model_catalog_importproduct->getProduct($item['id']);
		$dimensions = [
			0 => 1,
			1 => 1, // sht
			2 => 7, // kg
			3 => 2, // meshok
			4 => 4, // complect
			5 => 5, // m
			6 => 6, // m^2
			7 => 3, // upack
			8 => 9,//para
			9 => 8,//litr
			10 =>10,//kub,
			11 =>11,//gram
			12 => 12,//tonna
		];
		
		// length_class_id

		if($exist){
			$stock_status_id = ($item['count'] > 0) ? 7 : 5;

			$this->db->query("UPDATE " . DB_PREFIX . "product SET quantity = '" . (int)$item['count'] . "', price = '" . (float)$item['price'] . "', price_zak = '" . (float)$item['price'] . "', status = '" . (int)$item['active'] . "', stock_status_id = '" . (int)$stock_status_id . "', length_class_id = '" . (int)$dimensions[$item['dimension_id']] . "', date_modified = NOW() WHERE product_id = '" . (int)$item['id'] . "'");

			$this->db->query("UPDATE " . DB_PREFIX . "product_description SET name = '" . $this->db->escape($item['name']) . "' WHERE product_id = '" . (int)$item['id'] . "' AND language_id = '2'");

			// Update category from group_id
			if (!empty($item['group_id'])) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$item['id'] . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$item['id'] . "', category_id = '" . (int)$item['group_id'] . "'");
			}
		} else {
			$exist = [
				'product_id' => $item['id'],
				'model' => 'FA-'.$item['id'],
				'sku' => $item['barcode'],
				'upc' => '',
				'ean' => '',
				'jan' => '',
				'isbn' => '',
				'mpn' => '',
				'location' => '',
				'quantity' => 1,
				'stock_status_id' => 6,
				'image' => 'catalog/import/'.$item['id'].'.jpg',
				'manufacturer_id' => 0,
				'shipping' => 0,
				'price' => $item['price'],
				'points' => 0,
				'tax_class_id' => 0,
				'date_available' => '2017-07-14',
				'weight' => 0,
				'weight_class_id' => 0,
				'length' => 0,
				'width' => 0,
				'height' => 0,
				'length_class_id' => $dimensions[$item['dimension_id']],
				'subtract' => 1,
				'minimum' => 1,
				'sort_order' => 1,
				'status' => 1,
				'viewed' => 0			,
				'product_store' => [0],
				'product_description' => [
					2 => [
						'name' => $item['name'],
						'description' => $item['description'],
						'tag' => '',
						'meta_title' => $item['name'],
						'meta_description' => $item['description'],
						'meta_keyword' => '',
					]
				],
				'product_category' => !empty($item['group_id']) ? [$item['group_id']] : [],
				'keyword' => null,
			];

			$exist['quantity'] = $item['count'];
			$exist['price'] = $item['price'];
			if(!$exist['image']) {
				$exist['image'] = 'catalog/import/'.$item['name'].'.jpg';
			}
			//$this->json['edit'][] = $item['name'];

			$this->model_catalog_importproduct->addProduct($exist);
		}
		//print_r($item);
	}
	
	private function syncGroup($group, $parent_id) {
		$exist = $this->model_catalog_importcategory->getCategory($group['id']);
		$image = 'catalog/catalog/'. $group["id"] .'.jpg';

        $pos = strpos(__DIR__, "/www/");
        $path = substr(__DIR__, 0, $pos) . "/www/image/";
	   
	    if (!file_exists($path.$image)) {
	        $image = $exist["image"] ?? "";
	    }

		if($exist) {
		  //  print_r($exist);
		  //  exit;
			$this->model_catalog_importcategory->editCategory($group['id'], [
				'parent_id' => $parent_id,
				'top' => $exist['top'],
				'column' => $exist['column'],
				'sort_order' => $exist['sort_order'],
				'status' => $group['active'],
				'category_store' => [$exist['store_id']],
				'image' => $image,
				'category_description' => [
					2 => [
						'name' => $group['name'],
						'description' => $exist['description'],
						'meta_title' => $group['name'],
						'meta_description' => $exist['meta_description'],
						'meta_keyword' => $exist['meta_keyword'],
					]
				],
				'keyword' => $exist["keyword"],
			]);
		} else {			
			$this->model_catalog_importcategory->addCategory([
				'category_id' => $group['id'],
				'parent_id' => $parent_id,
				'top' => 1,
				'column' => 1,
				'sort_order' => 0,
				'category_store' => [0],
				'status' => $group['active'],
				'image' => $image,
				'category_description' => [
					2 => [
						'name' => $group['name'],
						'description' => '',
						'meta_title' => $group['name'],
						'meta_description' => '',
						'meta_keyword' => '',
					]
				]
			]);//*/
		}
		
		if(isset($group['child'])) {
			foreach($group['child'] as $child) {
				$this->syncGroup($child, $group['id']);
			}
		}
		

	}
	
	public function index() {
		$this->load->language('api/product');

		$this->json = array(
			'edit' => array(),
			'create' => array(),
		);

		if (false){// !isset($this->session->data['api_id'])) {
			$this->json['error'] = $this->language->get('error_permission');
		} else {
			$this->load->model('catalog/importcategory');
			$this->load->model('catalog/importproduct');

			$postData = file_get_contents('php://input');
			$data = json_decode($postData, true);

			file_put_contents(DIR_LOGS . 'multistore_api.log', date('Y-m-d H:i:s') . ' raw_len=' . strlen($postData) . ' raw_start=' . substr($postData, 0, 200) . ' POST=' . print_r($this->request->post, true) . PHP_EOL, FILE_APPEND);
			
			$this->log->write($postData);
			
			if(isset($data['groups'])) {
				//print_r($data['groups']);
				foreach($data['groups'] as $group) {
					$this->syncGroup($group, 0);
				}
			}
			
			if (!isset($data['store_id']) || !$data['store_id']) {
				$this->json['error'] = 'store_id is required';
				$this->response->addHeader('Content-Type: application/json');
				$this->response->setOutput(json_encode($this->json));
				return;
			}

			$multistore_id = (int)$data['store_id'];

			$this->db->query("SET AUTOCOMMIT=0");
			$this->db->query("START TRANSACTION");

			if(isset($data['items']) && $multistore_id) {
				// Delete all existing quantities for this multistore in one query
				$product_ids = array();
				foreach($data['items'] as $item) {
					$product_ids[] = (int)$item['id'];
				}

				if ($product_ids) {
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_multistore WHERE multistore_id = '" . (int)$multistore_id . "' AND product_id IN (" . implode(',', $product_ids) . ")");
				}

				// Insert all multistore quantities and sync products
				$insert_values = array();
				foreach($data['items'] as $item) {
					$this->syncItem($item);
					$insert_values[] = "('" . (int)$item['id'] . "', '" . (int)$multistore_id . "', '" . (int)$item['count'] . "')";
				}

				if ($insert_values) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_multistore (product_id, multistore_id, quantity) VALUES " . implode(',', $insert_values));

					// Batch update product.quantity as sum of all multistores
					$this->db->query("UPDATE " . DB_PREFIX . "product p SET quantity = COALESCE((SELECT SUM(quantity) FROM " . DB_PREFIX . "product_to_multistore WHERE product_id = p.product_id), 0) WHERE p.product_id IN (" . implode(',', $product_ids) . ")");
				}
			} elseif (isset($data['items'])) {
				foreach($data['items'] as $item) {
					$this->syncItem($item);
				}
			}

			$this->db->query("COMMIT");
			$this->db->query("SET AUTOCOMMIT=1");
		}

		if (isset($this->request->server['HTTP_ORIGIN'])) {
			$this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
			$this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
			$this->response->addHeader('Access-Control-Max-Age: 1000');
			$this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($this->json));
	}
	
	public function export(){
		$this->load->model('catalog/export');
		
		$items = $this->model_catalog_export->getList();
		echo 'export';
	}
}
