<?php
class ModelExtensionModuleMultistore extends Model {

	public function ensureExtraColumns() {
		$query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "multistore` LIKE 'phones'");
		if (!$query->num_rows) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "multistore` ADD COLUMN `phones` TEXT DEFAULT NULL");
		}
		$query2 = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "multistore` LIKE 'map_data'");
		if (!$query2->num_rows) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "multistore` ADD COLUMN `map_data` TEXT DEFAULT NULL");
		}
	}

	public function getMultistores($data = array()) {
		$sql = "
			SELECT
				m.multistore_id,
				md.name,
				m.name AS 'alias',
				m.type,
				m.geo_zone_id,
				m.sort_order,
				m.status,
				m.infinity,
				gz.name AS 'geo_zone',
				m.status AS 'status'
			FROM
				" . DB_PREFIX . "multistore m
			LEFT JOIN
				" . DB_PREFIX . "multistore_description md ON (m.multistore_id = md.multistore_id)
			LEFT JOIN
				" . DB_PREFIX . "geo_zone gz ON (gz.geo_zone_id = m.geo_zone_id)
			WHERE
				md.language_id = '" . (int)$this->config->get('config_language_id') . "'
		";

		if (!empty($data['filter_name'])) {
			$sql .= " AND md.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_type'])) {
			$sql .= " AND m.type = '" . $this->db->escape($data['filter_type']) . "'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND m.status = '" . (int)$data['filter_status'] . "'";
		}

		if (!empty($data['filter_geo_zone_id'])) {
			$sql .= " AND m.geo_zone_id = '" . (int)$data['filter_geo_zone_id'] . "'";
		}

		$sort_data = array(
			'md.name',
			'm.type',
			'm.geo_zone_id',
			'm.status',
			'm.sort_order',
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY m.sort_order";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalMultistores($data = array()){
		$sql = "
			SELECT
				COUNT(*) AS total
			FROM
				" . DB_PREFIX . "multistore m
			LEFT JOIN
				" . DB_PREFIX . "multistore_description md ON (m.multistore_id = md.multistore_id)
			LEFT JOIN
				" . DB_PREFIX . "geo_zone gz ON (gz.geo_zone_id = m.geo_zone_id)
			WHERE
				md.language_id = '" . (int)$this->config->get('config_language_id') . "'
		";

		if (!empty($data['filter_name'])) {
			$sql .= " AND md.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_type'])) {
			$sql .= " AND m.type = '" . $this->db->escape($data['filter_type']) . "'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND m.status = '" . (int)$data['filter_status'] . "'";
		}

		if (!empty($data['filter_geo_zone_id'])) {
			$sql .= " AND m.geo_zone_id = '" . (int)$data['filter_geo_zone_id'] . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getMultistore($multistore_id) {
		$query = $this->db->query("
			SELECT
				m.multistore_id,
				md.name,
				md.description,
				m.type,
				m.name AS 'alias',
				m.geo_zone_id,
				m.sort_order,
				m.infinity,
				m.status,
				gz.name AS 'geo_zone',
				m.status AS 'status',
				m.phones,
				m.map_data
			FROM
				" . DB_PREFIX . "multistore m
			LEFT JOIN
				" . DB_PREFIX . "multistore_description md ON (m.multistore_id = md.multistore_id)
			LEFT JOIN
				" . DB_PREFIX . "geo_zone gz ON (gz.geo_zone_id = m.geo_zone_id)
			WHERE
				md.language_id = '" . (int)$this->config->get('config_language_id') . "' AND
				m.multistore_id = '" . $multistore_id . "'
		");

		return $query->row;
	}

	public function getMultistoreDescription($multistore_id) {
		$multistore_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "multistore_description WHERE multistore_id = '" . (int)$multistore_id . "'");

		foreach ($query->rows as $result) {
			$multistore_data[$result['language_id']] = array(
				'name' 				=> $result['name'],
				'description' => $result['description']
			);
		}

		return $multistore_data;
	}

	public function getMultistoreStores($multistore_id){
		$multistore_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "multistore_to_store WHERE multistore_id = '" . (int)$multistore_id . "'");

		foreach ($query->rows as $result) {
			$multistore_store_data[] = $result['store_id'];
		}

		return $multistore_store_data;
	}

	public function addMultistore($data){

		$this->db->query("
			INSERT INTO
				`" . DB_PREFIX . "multistore`
			SET
				type 							= '" . $this->db->escape($data['type']) . "',
				name 							= '" . $this->db->escape($data['alias']) . "',
				geo_zone_id 			= '" . (int)$data['geo_zone_id'] . "',
				status 						= '" . (int)$data['status'] . "',
				infinity 					= '" . (int)$data['infinity']."',
				phones 						= '" . $this->db->escape(isset($data['phones']) ? json_encode($data['phones']) : '') . "',
				map_data 					= '" . $this->db->escape(isset($data['map_data']) ? json_encode($data['map_data']) : '') . "',
				sort_order 				= '" . (int)$data['sort_order'] . "'
		");

		$multistore_id = $this->db->getLastId();

		foreach ($data['description'] as $language_id => $value) {
			$this->db->query("
				INSERT
					INTO " . DB_PREFIX . "multistore_description
				SET
					multistore_id 	= '" . (int)$multistore_id . "',
					language_id 		= '" . (int)$language_id . "',
					name 						= '" . $this->db->escape($value['name']) . "',
					description 		= '" . $this->db->escape($value['description']) . "'
			");
		}

		if (isset($data['multistore_store'])) {
			foreach ($data['multistore_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "multistore_to_store SET multistore_id = '" . (int)$multistore_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if ($data['infinity']){
			$quantity = 99999;
		} else {
			$quantity = 0;
		}

		$this->db->query("INSERT INTO `" . DB_PREFIX . "product_to_multistore` SELECT product_id, '".(int)$multistore_id."', '".(int)$quantity."' FROM `" . DB_PREFIX . "product`");

		$this->db->query("INSERT INTO `" . DB_PREFIX . "product_option_value_to_multistore` SELECT product_option_value_id, product_id, '".(int)$multistore_id."', '".(int)$quantity."' FROM `" . DB_PREFIX . "product_option_value`");

		if ($data['infinity']){
			$this->updateQuantity();
			$this->updateQuantityOption();
		}

	}

	public function editMultistore($multistore_id, $data){

		$this->db->query("
			UPDATE
				`" . DB_PREFIX . "multistore` 
			SET
				type 					= '" . $this->db->escape($data['type']) . "',
				name 					= '" . $this->db->escape($data['alias']) . "',
				geo_zone_id 	= '" . (int)$data['geo_zone_id'] . "',
				infinity 			= '" . (bool)$data['infinity']."',
				status 				= '" . (bool)$data['status']."',
				phones 				= '" . $this->db->escape(isset($data['phones']) ? json_encode($data['phones']) : '') . "',
				map_data 			= '" . $this->db->escape(isset($data['map_data']) ? json_encode($data['map_data']) : '') . "',
				sort_order 		= '" . (int)$data['sort_order'] . "'
			WHERE
				multistore_id = '".(int)$multistore_id."'
		");

		$this->db->query("DELETE FROM " . DB_PREFIX . "multistore_description WHERE multistore_id = '" . (int)$multistore_id . "'");

		foreach ($data['description'] as $language_id => $value) {
			$this->db->query("
				INSERT
					INTO " . DB_PREFIX . "multistore_description
				SET
					multistore_id = '" . (int)$multistore_id . "',
					language_id 	= '" . (int)$language_id . "',
					name 					= '" . $this->db->escape($value['name']) . "',
					description 	= '" . $this->db->escape($value['description']) . "'
			");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "multistore_to_store WHERE multistore_id = '" . (int)$multistore_id . "'");

		if (isset($data['multistore_store'])) {
			foreach ($data['multistore_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "multistore_to_store SET multistore_id = '" . (int)$multistore_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if ($data['infinity']){

			$quantity = 99999;

			$this->db->query("INSERT INTO `" . DB_PREFIX . "product_to_multistore` SELECT product_id, '".(int)$multistore_id."', '".(int)$quantity."' FROM `" . DB_PREFIX . "product`");
			$this->updateQuantity();

			$this->db->query("INSERT INTO `" . DB_PREFIX . "product_option_value_to_multistore` SELECT product_option_value_id, product_id, '".(int)$multistore_id."', '".(int)$quantity."' FROM `" . DB_PREFIX . "product_option_value`");
			$this->updateQuantityOption();
		}

	}

	public function deleteMultistore($multistore_id){
		$this->db->query("DELETE FROM " . DB_PREFIX . "multistore WHERE multistore_id = '" . (int)$multistore_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "multistore_description WHERE multistore_id = '" . (int)$multistore_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "multistore_to_store WHERE multistore_id = '" . (int)$multistore_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_multistore WHERE multistore_id = '" . (int)$multistore_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value_to_multistore WHERE multistore_id = '" . (int)$multistore_id . "'");
		$this->updateQuantity();
		$this->updateQuantityOption();
	}

	public function clearQuantity($data){
		$sql = "UPDATE `" . DB_PREFIX . "product_to_multistore` p2m
						LEFT JOIN `oc_product_to_category` p2c ON (p2m.product_id = p2c.product_id)
						LEFT JOIN `oc_product` p ON (p2m.product_id = p.product_id)
						SET p2m.`quantity` = 0 WHERE";

		$sql .= " (";
		foreach($data['checked_category'] as $key => $category_id){
			if ($key == 0) {
				$sql .= " p2c.category_id = ".(int)$category_id;
			} else {
				$sql .= " OR p2c.category_id = ".(int)$category_id;
			}
		}
		$sql .= " ) AND (";
		foreach($data['checked_manufacturer'] as $key => $manufacturer_id){
			if ($key == 0) {
				$sql .= " p.manufacturer_id = ".(int)$manufacturer_id;
			} else {
				$sql .= " OR p.manufacturer_id = ".(int)$manufacturer_id;
			}
		}
		$sql .= " ) AND (";
		foreach($data['checked_multistore'] as $key => $multistore_id){
			if ($key == 0) {
				$sql .= " p2m.multistore_id = ".(int)$multistore_id;
			} else {
				$sql .= " OR p2m.multistore_id = ".(int)$multistore_id;
			}
		}
		$sql .= " )";

		$this->db->query($sql);

		$this->updateQuantity();
	}

	public function clearQuantityOption($data){
		$sql = "UPDATE `" . DB_PREFIX . "product_option_value_to_multistore` p2m
						LEFT JOIN `oc_product_to_category` p2c ON (p2m.product_id = p2c.product_id)
						LEFT JOIN `oc_product` p ON (p2m.product_id = p.product_id)
						SET p2m.`quantity` = 0 WHERE";

		$sql .= " (";
		foreach($data['checked_category'] as $key => $category_id){
			if ($key == 0) {
				$sql .= " p2c.category_id = ".(int)$category_id;
			} else {
				$sql .= " OR p2c.category_id = ".(int)$category_id;
			}
		}
		$sql .= " ) AND (";
		foreach($data['checked_manufacturer'] as $key => $manufacturer_id){
			if ($key == 0) {
				$sql .= " p.manufacturer_id = ".(int)$manufacturer_id;
			} else {
				$sql .= " OR p.manufacturer_id = ".(int)$manufacturer_id;
			}
		}
		$sql .= " ) AND (";
		foreach($data['checked_multistore'] as $key => $multistore_id){
			if ($key == 0) {
				$sql .= " p2m.multistore_id = ".(int)$multistore_id;
			} else {
				$sql .= " OR p2m.multistore_id = ".(int)$multistore_id;
			}
		}
		$sql .= " )";

		$this->db->query($sql);

		$this->updateQuantityOption();
	}

	public function updateQuantity(){
		$this->db->query("UPDATE `" . DB_PREFIX . "product` p SET quantity =( SELECT SUM(quantity)a FROM `" . DB_PREFIX . "product_to_multistore` ptm WHERE ptm.product_id = p.product_id )");
	}

	public function updateQuantityOption(){
		$this->db->query("UPDATE " . DB_PREFIX . "product_option_value pov SET quantity = (SELECT SUM(quantity) as quantity FROM `" . DB_PREFIX . "product_option_value_to_multistore` pov2m WHERE pov2m.product_option_value_id = pov.product_option_value_id)");
	}

	public function getProductMultistores($product_id) {

		$query = $this->db->query("
			SELECT
				m.multistore_id,
				md.name,
				md.description,
				m.infinity,
				p2m.quantity
			FROM
				" . DB_PREFIX . "multistore m
			LEFT JOIN
				" . DB_PREFIX . "multistore_description md ON (m.multistore_id = md.multistore_id)
			LEFT JOIN
				" . DB_PREFIX . "product_to_multistore p2m ON (m.multistore_id = p2m.multistore_id)
			WHERE
				md.language_id = '" . (int)$this->config->get('config_language_id') . "' AND
				product_id = '" . (int)$product_id . "'");

		return $query->rows;
	}

	public function getProductOptionValueMultistores($product_option_value_id) {

		$query = $this->db->query("
			SELECT
				m.multistore_id,
				md.name,
				md.description,
				m.infinity,
				pov2m.quantity
			FROM
				" . DB_PREFIX . "multistore m
			LEFT JOIN
				" . DB_PREFIX . "multistore_description md ON (m.multistore_id = md.multistore_id)
			LEFT JOIN
				" . DB_PREFIX . "product_option_value_to_multistore pov2m ON (m.multistore_id = pov2m.multistore_id)
			WHERE
				md.language_id = '" . (int)$this->config->get('config_language_id') . "' AND
				pov2m.product_option_value_id = '" . (int)$product_option_value_id . "'");

		return $query->rows;
	}

	public function getProduct($data){
		$sql = "
			SELECT p.product_id, p.model, p.sku, pd.name
			FROM `" . DB_PREFIX . "product` p
			LEFT JOIN `" . DB_PREFIX . "product_description` pd ON (p.product_id = pd.product_id)
			WHERE
		";

		if (!empty($data['filter_name'])){
			$sql .= " pd.name LIKE '".$this->db->escape($data['filter_name'])."'";
		}

		if (!empty($data['filter_name']) && !empty($data['filter_model'])){
			$sql .= " AND";
		}

		if (!empty($data['filter_model'])){
			$sql .= " (p.model = '".$this->db->escape($data['filter_model'])."' OR p.sku = '".$this->db->escape($data['filter_model'])."')";
		}

		$query = $this->db->query($sql);

		if ($query->num_rows > 0){
			return $query->row['product_id'];
		}

		return false;
	}

	public function getProductsMultistores() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_multistore");
		return $query->rows;
	}

	public function setProductMultistore($product_id, $multistore_id, $quantity) {
		$this->db->query("
			UPDATE
				`" . DB_PREFIX . "product_to_multistore`
			SET
				quantity 				= '" . (int)$quantity . "'
			WHERE
				product_id			= '" . (int)$product_id . "' AND
				multistore_id 	= '" . (int)$multistore_id . "'
		");
	}

	public function setOrderMultistore($order_id, $multistore_id) {
		$this->db->query("
			UPDATE
				`" . DB_PREFIX . "order`
			SET
				multistore_id 	= '" . (int)$multistore_id . "'
			WHERE
			order_id					= '" . (int)$order_id . "'
		");
	}

	public function getStockId() {
		$multistores = $this->db->query("SELECT * FROM " . DB_PREFIX . "multistore WHERE `type` = 'stock'");
		return $multistores->row['multistore_id'];
	}

	public function readFile($route){

		include_once(DIR_SYSTEM.'library/PHPExcel.php');

		$products = array();

		$multistores = $this->getMultistores();

		// Подгружаем саму библиотеку
		$excel = PHPExcel_IOFactory::load(DIR_UPLOAD.$route);

		// Читаем файл
		foreach($excel->getWorksheetIterator() as $worksheet) {
			$lists[] = $worksheet->toArray();
		}

		// Разбираем файл
		foreach($lists as $key_list => $list){
			foreach($list as $key_row => $row){

				// Пропускаем первую строку
				if ($key_row == 0) continue;

				// Если первые обе ячейки не заполнены - заканчиваем
				if (empty($row[0]) && empty($row[1])) continue;

				$cell_key = 2;

				$quantity = array();
				foreach($multistores as $multistore){
					$multistore_id = $multistore['multistore_id'];

					// Если ячейка не пустая, то запоминаем количество согласно складу из шаблона
					if (is_numeric($row[$cell_key])) {
						$quantity[$multistore_id] = $row[$cell_key];
					} else {
						$quantity[$multistore_id] = 0;
					}

					$cell_key++;
				}

				$product = array(
					'name' => !empty($row[0]) ? $row[0] : '',
					'model' => !empty($row[1]) ? $row[1] : '',
					'multistores' => $quantity
				);

				$products[$key_row] = $product;
			}
		}

		return $products;

	}

	public function createTemplate($multistores, $products = array()){

		include_once(DIR_SYSTEM.'library/PHPExcel.php');

		$this->load->language('extension/module/multistore');

		$alfabet = array(	
			'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 
			'AA', 'AB', 'AC', 'AD', 'AE', 'AF', 'AG', 'AH', 'AI', 'AJ', 'AK', 'AL', 'AM', 'AN', 'AO', 'AP', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AV', 'AW', 'AX', 'AY', 'AZ',
			'BA', 'BB', 'BC', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BK', 'BL', 'BM', 'BN', 'BO', 'BP', 'BQ', 'BR', 'BS', 'BT', 'BU', 'BV', 'BW', 'BX', 'BY', 'BZ',
			'CA', 'CB', 'CC', 'CD', 'CE', 'CF', 'CG', 'CH', 'CI', 'CJ', 'CK', 'CL', 'CM', 'CN', 'CO', 'CP', 'CQ', 'CR', 'CS', 'CT', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ'
		);

		$obj = new PHPExcel();

		// Шапка
		$obj->getActiveSheet()->setCellValue('A1', $this->language->get('file_column_name'));
		$obj->getActiveSheet()->setCellValue('B1', $this->language->get('file_column_model'));

		$column_id = 2;
		foreach($multistores as $multistore){
			$obj->getActiveSheet()->setCellValue($alfabet[$column_id].'1', $multistore['name']);
			$column_id++;
		}

		// Товар
		$obj->getActiveSheet()->setCellValue('A2', $this->language->get('file_example_name'));
		$obj->getActiveSheet()->setCellValue('B2', $this->language->get('file_example_model'));

		$column_id = 2;
		foreach($multistores as $multistore){
			$obj->getActiveSheet()->setCellValue($alfabet[$column_id].'2', rand(0, 20));
			$column_id++;
		}

		// создаем файл с данными
		$file =  PHPExcel_IOFactory::createWriter($obj, 'Excel2007');

		$filename = 'catalog/multistore/multistore_example'.date("d-m-Y_H-i-s").'.xlsx';

		// Сохраняем файл
		$file->save(DIR_IMAGE.$filename);

		// Возвращаем сссылку
		return HTTP_CATALOG.'image/'.$filename;
		
	}

	public function check1version(){
		$query = $this->db->query("SHOW TABLES FROM ".DB_DATABASE." LIKE '".DB_PREFIX."multistore_description'");
		return $query->num_rows;
	}

	public function getOldMultistores(){
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "multistore");
		return $query->rows;
	}

	public function migration($old_multistores){
		$this->db->query("
			ALTER TABLE `".DB_PREFIX."multistore`
				ADD PRIMARY KEY (`multistore_id`);
		");
		$this->db->query("
			ALTER TABLE `" . DB_PREFIX . "multistore`
				MODIFY `multistore_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
		");
		$this->db->query("
			DROP TABLE IF EXISTS `".DB_PREFIX."multistore_description`;
		");
		$this->db->query("
			CREATE TABLE `".DB_PREFIX."multistore_description` (
				`multistore_id` int(11) NOT NULL,
				`name` varchar(255) NOT NULL,
				`description` text NOT NULL,
				`language_id` int(11) NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		");
		$this->db->query("
			CREATE TABLE `".DB_PREFIX."product_option_value_to_multistore` (
				`product_option_value_id` int(11) NOT NULL,
				`product_id` int(11) NOT NULL,
				`multistore_id` int(11) NOT NULL,
				`quantity` int(11) NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		");
		foreach($old_multistores as $multistore){
			// Перекидываем описание
			$this->db->query("
				INSERT
					INTO " . DB_PREFIX . "multistore_description
				SET
					multistore_id 	= '" . (int)$multistore['multistore_id'] . "',
					language_id 		= '" . (int)$this->config->get('config_language_id') . "',
					name 						= '" . $this->db->escape($multistore['name']) . "',
					description 		= '" . $this->db->escape($multistore['description']) . "'
			");

			// Добавляем пустые остатки для опций
			$this->db->query("INSERT INTO `" . DB_PREFIX . "product_option_value_to_multistore` SELECT product_option_value_id, product_id, '".(int)$multistore['multistore_id']."', '0' FROM `" . DB_PREFIX . "product_option_value`");
		}

		$this->db->query("ALTER TABLE `".DB_PREFIX."order` ADD `multistore_id` INT(11) NOT NULL AFTER `store_id`;");

		// Очищаем ненужные столбцы
		$this->db->query("ALTER TABLE `oc_multistore` DROP `name`, DROP `description`;");
	}

	public function install() {
		$this->db->query("
			DROP TABLE IF EXISTS `".DB_PREFIX."multistore`;
		");
		$this->db->query("
			CREATE TABLE `".DB_PREFIX."multistore` (
				`multistore_id` int(11) NOT NULL,
				`name` varchar(50) NOT NULL,
				`type` varchar(10) NOT NULL,
				`geo_zone_id` int(11) NOT NULL,
				`infinity` int(1) NOT NULL,
				`status` int(1) NOT NULL,
				`sort_order` int(11) NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		");
		$this->db->query("
			ALTER TABLE `".DB_PREFIX."multistore`
				ADD PRIMARY KEY (`multistore_id`);
		");
		$this->db->query("
			ALTER TABLE `" . DB_PREFIX . "multistore`
				MODIFY `multistore_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
		");
		$this->db->query("
			DROP TABLE IF EXISTS `".DB_PREFIX."multistore_description`;
		");
		$this->db->query("
			CREATE TABLE `".DB_PREFIX."multistore_description` (
				`multistore_id` int(11) NOT NULL,
				`name` varchar(255) NOT NULL,
				`description` text NOT NULL,
				`language_id` int(11) NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		");
		$this->db->query("
			DROP TABLE IF EXISTS `".DB_PREFIX."product_to_multistore`;
		");
		$this->db->query("
			CREATE TABLE `".DB_PREFIX."product_to_multistore` (
				`product_id` int(11) NOT NULL,
				`multistore_id` int(11) NOT NULL,
				`quantity` int(11) NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		");
		$this->db->query("
			DROP TABLE IF EXISTS `".DB_PREFIX."multistore_to_store`;
		");
		$this->db->query("
			CREATE TABLE `".DB_PREFIX."multistore_to_store` (
				`multistore_id` int(11) NOT NULL,
				`store_id` int(11) NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		");
		$this->db->query("
			DROP TABLE IF EXISTS `".DB_PREFIX."product_option_value_to_multistore`;
		");
		$this->db->query("
			CREATE TABLE `".DB_PREFIX."product_option_value_to_multistore` (
				`product_option_value_id` int(11) NOT NULL,
				`product_id` int(11) NOT NULL,
				`multistore_id` int(11) NOT NULL,
				`quantity` int(11) NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		");
		$this->db->query("ALTER TABLE `".DB_PREFIX."order` ADD `multistore_id` INT(11) NOT NULL AFTER `store_id`;");
	}

	public function uninstall() {
		$this->db->query("
			DROP TABLE IF EXISTS `" . DB_PREFIX . "multistore`;
		");
		$this->db->query("
			DROP TABLE IF EXISTS `".DB_PREFIX."multistore_description`;
		");
		$this->db->query("
			DROP TABLE IF EXISTS `".DB_PREFIX."multistore_to_store`;
		");
		$this->db->query("
			DROP TABLE IF EXISTS `" . DB_PREFIX . "product_to_multistore`;
		");
		$this->db->query("
			DROP TABLE IF EXISTS `".DB_PREFIX."product_option_value_to_multistore`;
		");
		$this->db->query("
			ALTER TABLE `".DB_PREFIX."order` DROP `multistore_id`;
		");
	}
}