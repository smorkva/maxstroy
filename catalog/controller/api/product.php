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
			$exist['product_description'] = [
				2 => [
					'name' => $item['name'],
					'description' => $exist['description'],
					'tag' => '',
					'meta_title' => $exist['meta_title'],
					'meta_description' => $exist['meta_description'],
					'meta_keyword' => $exist['meta_keyword'],
				]
			];
			$exist['product_store'] = [0];
			$exist['product_category'] = [$item['group_id']];

			$exist['quantity'] = $item['count'];
			$exist['price'] = $item['price'];
			$exist['status'] = $item['active'];
				
			$exist['image'] = 'catalog/import/'.$item['id'].'.jpg';
			$exist['length_class_id'] = $dimensions[$item['dimension_id']];
			if (!isset($dimensions[$item['dimension_id']])) {
			    $this->log("Dim" . $item['dimension_id']);
			}
			

			if ($item['count'] > 0) {
				$exist['stock_status_id'] = 7;
			} else
			$exist['stock_status_id'] = 5;

			$this->model_catalog_importproduct->importProduct($item['id'], $exist);
			//$this->json['edit'][$item['id']] = $item['name'];
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
				'product_category' => [$item['group_id']],
				'keyword' => null,
			];

			$exist['product_store'] = [0];
			$exist['product_category'] = [];
			foreach($this->model_catalog_importproduct->getCategories($item['id']) as $row) {
				$exist['product_category'][] = $row['category_id'];
			}

			$exist['quantity'] = $item['count'];
			$exist['price'] = $item['price'];
			if(!$exist['image']) {
				$exist['image'] = 'catalog/import/'.$item['name'].'.jpg';
			}
			//$this->json['edit'][] = $item['name'];

			$this->model_catalog_importproduct->addProduct($exist);//*/
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
			
			$this->log->write($postData);
			
			if(isset($data['groups'])) {
				//print_r($data['groups']);
				foreach($data['groups'] as $group) {
					$this->syncGroup($group, 0);
				}
			}
			
			if(isset($data['items'])) {
				foreach($data['items'] as $item) {
					$this->syncItem($item);
				}
			}
			
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
