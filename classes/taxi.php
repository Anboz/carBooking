<?php
class taxi extends cars {
		 
	
	function getContent() {
						
			 $isfree = $this->db->selectInfo("SELECT *FROM tbl_taxi");
			   for($i = 0; $i < count($isfree); $i++){
			  	   $isfree[$i][] = $isfree[$i]['place'] - ($this->db->selectInfo("SELECT SUM(place) AS plase FROM tbl_book_taxi WHERE idtaxi ='".$isfree[$i]['id']."'")[0]['plase']);			  	
			  }	 
		require_once 'tpls/taxi.tpl';
	}

}
?>