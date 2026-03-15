<?php
class ModelCatalogExport extends Model {
	public function getList() {
		$qstring = "SELECT product_id, quantity, price from oc_product";
		$query = $this->db->query($qstring);
		
		//echo "0\r\n0.123\r\n0\r\n";
		$i = 0;
		foreach($query->rows as $item) {
			echo $item['product_id']."\r\n".$item['quantity']."\r\n".$item['price']."\r\n";
			$i++;
			/*
			if($i > 1000)
				exit;//*/
		}
	}
}