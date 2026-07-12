<?php
class Multistore {

  private $registry;

  public function __construct($registry){
    $this->registry = $registry;
  }

  public function __get($name) {
    if ($this->registry->has($name)) {
      return $this->registry->get($name);
    } else {
      return null;
    }
	}

  // Helpers
  public function getConfigValue($param, $type = 'module'){
    if (VERSION < 3 || substr($param, 0, 6) == 'config') {
			return $this->config->get($param);
		} else {
			return $this->config->get($type.'_'.$param);
		}
	}

	public function dumper($value){
		echo '<pre>';
		var_dump($value);
		echo '</pre>';
	}

	// Data
	public function getMultistores(){
		$sql 	= "SELECT * FROM `" . DB_PREFIX . "multistore` m";
		$sql .= " LEFT JOIN `" . DB_PREFIX . "multistore_description` md ON (m.multistore_id = md.multistore_id)";
		$sql .= " WHERE m.status = 1 AND md.language_id = ".(int)$this->config->get('config_language_id');
		$sql .= " GROUP BY m.multistore_id ORDER BY m.sort_order ASC";

		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getMultistoresStores($type = 'store'){
		$sql 	= "SELECT * FROM `" . DB_PREFIX . "multistore` m";
		$sql .= " LEFT JOIN `" . DB_PREFIX . "multistore_description` md ON (m.multistore_id = md.multistore_id)";
		$sql .= " WHERE m.status = 1 AND md.language_id = ".(int)$this->config->get('config_language_id');
		$sql .= " AND (SELECT COUNT(*) FROM " . DB_PREFIX . "multistore_to_store m2s WHERE m.multistore_id = m2s.multistore_id AND m2s.store_id = ".(int)$this->config->get('config_store_id').") > 0";

    // Отображение по типу склада
		$sql .= " AND m.type = 'store'";

		// Геозона
		$zone_id = $this->getZoneId();
		if (!empty($zone_id)) {
			$sql .= " AND ((SELECT COUNT(*) FROM `" . DB_PREFIX . "zone_to_geo_zone` ztgz WHERE ztgz.zone_id = ".(int)$zone_id." AND ztgz.geo_zone_id = m.geo_zone_id) > 0 OR m.geo_zone_id = 0)";
		}

		$sql .= " GROUP BY m.multistore_id ORDER BY m.sort_order ASC";

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getCountMultistore($type = 'store'){
		$sql = "SELECT COUNT(*) as 'count'";
		$sql .= " FROM " . DB_PREFIX . "multistore m";
		$sql .= " WHERE m.status = 1 AND m.type = '".$this->db->escape($type)."'";

    // Геозона
		$zone_id = $this->getZoneId();
		if (!empty($zone_id)) {
			$sql .= " AND ((SELECT COUNT(*) FROM `" . DB_PREFIX . "zone_to_geo_zone` WHERE zone_id = ".(int)$zone_id." AND geo_zone_id = m.geo_zone_id) > 0 OR m.geo_zone_id = 0)";
		}

    $query = $this->db->query($sql);

    return $query->row['count'];
	}

  public function getMultistoresForProduct($product_id, $options_id = array()){
		$sql 	= "SELECT *, MIN(ptm.quantity) as 'minimum' FROM `" . DB_PREFIX . "multistore` m";

		$sql .= " LEFT JOIN `" . DB_PREFIX . "multistore_to_store` m2s ON (m.multistore_id = m2s.multistore_id)";

		$sql .= " LEFT JOIN `" . DB_PREFIX . "multistore_description` md ON (m.multistore_id = md.multistore_id)";

		if (!empty($options_id)){
			$sql .= " LEFT JOIN `" . DB_PREFIX . "product_option_value_to_multistore` ptm ON (m.multistore_id = ptm.multistore_id)";
		} else {
			$sql .= " LEFT JOIN `" . DB_PREFIX . "product_to_multistore` ptm ON (m.multistore_id = ptm.multistore_id)";
		}

		$sql .= " WHERE m.status = 1 AND md.language_id = ".(int)$this->config->get('config_language_id')." AND ptm.product_id = ".(int)$product_id;

		$sql .= " AND m2s.store_id = ".(int)$this->config->get('config_store_id');

		if (!empty($options_id)) {
      $sql .= " AND (";
			foreach($options_id as $key => $option_value_id){

        if ($this->multistore->getConfigValue('multistore_option_with_quantity_status') && stripos($option_value_id, '|')) {

          $result = explode('|', $option_value_id);
          $option_value_id = $result[0];
          $option_quantity = $result[1];

          if ($key > 0){
            $sql .= " OR (ptm.product_option_value_id = ".(int)$option_value_id." AND ptm.quantity >= ".(int)$option_quantity.")";
          } else {
            $sql .= " (ptm.product_option_value_id = ".(int)$option_value_id." AND ptm.quantity >= ".(int)$option_quantity.")";
          }

        } elseif ($this->multistore->getConfigValue('multistore_option_with_quantity_status') && stripos($option_value_id, '/')) {

          $result = explode('/', $option_value_id);
          $option_value_id = $result[0];
          $option_quantity = $result[1];

          if ($key > 0){
            $sql .= " OR (ptm.product_option_value_id = ".(int)$option_value_id." AND ptm.quantity >= ".(int)$option_quantity.")";
          } else {
            $sql .= " (ptm.product_option_value_id = ".(int)$option_value_id." AND ptm.quantity >= ".(int)$option_quantity.")";
          }

        } elseif ($key > 0) {
          $sql .= " OR ptm.product_option_value_id = ".(int)$option_value_id;
        } else {
          $sql .= " ptm.product_option_value_id = ".(int)$option_value_id;
        }

			}
			$sql .= " )";
		}

		// Фильтр по выбранному складу
		$selected_multistore_id = $this->getSelectedMultistoreId();
		if ($selected_multistore_id) {
			$sql .= " AND m.multistore_id = " . (int)$selected_multistore_id;
		}

		// Геозона
		$zone_id = $this->getZoneId();

		if (!empty($zone_id)) {
			$sql .= " AND ((SELECT COUNT(*) FROM `" . DB_PREFIX . "zone_to_geo_zone` ztgz WHERE ztgz.zone_id = ".(int)$zone_id." AND ztgz.geo_zone_id = m.geo_zone_id) > 0 OR m.geo_zone_id = 0)";
		}

		$sql .= " GROUP BY m.multistore_id ORDER BY m.sort_order ASC";

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getQuantityForProduct($product_id, $options_id = array()){
		$sql 	= "SELECT *, MIN(ptm.quantity) as 'minimum' FROM `" . DB_PREFIX . "multistore` m";

		$sql .= " LEFT JOIN `" . DB_PREFIX . "multistore_to_store` m2s ON (m.multistore_id = m2s.multistore_id)";

		if (!empty($options_id)){
			$sql .= " LEFT JOIN `" . DB_PREFIX . "product_option_value_to_multistore` ptm ON (m.multistore_id = ptm.multistore_id)";
		} else {
			$sql .= " LEFT JOIN `" . DB_PREFIX . "product_to_multistore` ptm ON (m.multistore_id = ptm.multistore_id)";
		}

		$sql .= " WHERE m.status = 1 AND ptm.product_id = ".(int)$product_id;

		$sql .= " AND m2s.store_id = ".(int)$this->config->get('config_store_id');

		if (!empty($options_id)) {
      $sql .= " AND (";
			foreach($options_id as $key => $option_value){
				if (is_array($option_value)){
					foreach($option_value as $option_key => $value_id){
						if ($option_key == 0) {
							$sql .= " ptm.product_option_value_id = ".(int)$value_id;
						} else {
							$sql .= " OR ptm.product_option_value_id = ".(int)$value_id;
						}
					}
				} else {
					if ($key == 0) {
						$sql .= " ptm.product_option_value_id = ".(int)$option_value;
					} else {
						$sql .= " OR ptm.product_option_value_id = ".(int)$option_value;
					}
				}
			}
			$sql .= " )";
		}

    // Отображение по типу склада
		$sql .= " AND m.type = 'store'";

		// Фильтр по выбранному складу
		$selected_multistore_id = $this->getSelectedMultistoreId();
		if ($selected_multistore_id) {
			$sql .= " AND m.multistore_id = " . (int)$selected_multistore_id;
		}

		// Геозона
		$zone_id = $this->getZoneId();

		if (!empty($zone_id)) {
			$sql .= " AND ((SELECT COUNT(*) FROM `" . DB_PREFIX . "zone_to_geo_zone` ztgz WHERE ztgz.zone_id = ".(int)$zone_id." AND ztgz.geo_zone_id = m.geo_zone_id) > 0 OR m.geo_zone_id = 0)";
		}

		$sql .= " GROUP BY m.multistore_id ORDER BY m.sort_order ASC";

		$query = $this->db->query($sql);

		return $query->rows;
  }

  public function getTotalForProducts($product_id, $quantity, $type = '', $options_id = array()){

		$sql = "SELECT SUM(quantity) as quantity";

		$sql .= " FROM " . DB_PREFIX . "multistore m";

		$sql .= " LEFT JOIN `" . DB_PREFIX . "multistore_to_store` m2s ON (m.multistore_id = m2s.multistore_id)";

		if (empty($options_id)){
			$sql .= " LEFT JOIN " . DB_PREFIX . "product_to_multistore ptm ON (m.multistore_id = ptm.multistore_id)";
		} else {
			$sql .= " LEFT JOIN " . DB_PREFIX . "product_option_value_to_multistore ptm ON (m.multistore_id = ptm.multistore_id)";
		}

		$sql .= "	WHERE m.status = 1 AND m.type = '".$this->db->escape($type)."' AND ptm.quantity >= ".(int)$quantity;

		$sql .= " AND m2s.store_id = ".(int)$this->config->get('config_store_id');

		if (!empty($options_id)){
			$sql .= " AND (";
			foreach($options_id as $key => $option_value_id){
				if ($key == 0) {
					$sql .= " ptm.product_option_value_id = ".(int)$option_value_id;
				} else {
					$sql .= " OR ptm.product_option_value_id = ".(int)$option_value_id;
				}
			}
			$sql .= " )";
    } else {
			$sql .= " AND ptm.product_id = ".(int)$product_id;
		}

    // Фильтр по выбранному складу
		$selected_multistore_id = $this->getSelectedMultistoreId();
		if ($selected_multistore_id) {
			$sql .= " AND m.multistore_id = " . (int)$selected_multistore_id;
		}

    // Геозона
		$zone_id = $this->getZoneId();

		if (!empty($zone_id)) {
			$sql .= " AND ((SELECT COUNT(*) FROM `" . DB_PREFIX . "zone_to_geo_zone` WHERE zone_id = ".(int)$zone_id." AND geo_zone_id = m.geo_zone_id) > 0 OR m.geo_zone_id = 0)";
		}

    $sql .= " ORDER BY m.`sort_order` ASC";

    $query = $this->db->query($sql);

    return (int)$query->row['quantity'];
	}

	public function getStockStatuses(){
    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "stock_status WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

    $stock_statuses = array();
    foreach($query->rows as $row){
      $stock_status_id = $row['stock_status_id'];
      $stock_statuses[$stock_status_id] = $row['name'];
    }

    return $stock_statuses;
  }

  public function getSelectedMultistoreId(){
    if (!empty($this->session->data['multistore_id'])) {
      return (int)$this->session->data['multistore_id'];
    }
    return 0;
  }

  public function getZoneId(){
    if (!empty($this->session->data['shipping_address']['zone_id'])) {
			return $this->session->data['shipping_address']['zone_id'];
		} elseif (!empty($this->session->data['prmn.city_manager']['zone_id'])){
			return $this->session->data['prmn.city_manager']['zone_id'];
		} else {
			return 0;
		}
	}
}
