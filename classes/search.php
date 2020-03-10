<?php
class search extends cars {
		 
	function check($id, $array){
		foreach($array as $key => $value)
			if($id == $value) return false;
				return TRUE;
	}
	
	function getContent() {

	  $searchArray = array();
	  $resultSearch = array();
		if(trim($_POST['searchtext'])!="")
		{  
		$_POST['searchtext'] = htmlspecialchars($_POST['searchtext']);
		$explod = explode(' ', trim($_POST['searchtext']));		
			for($i = 0; $i < count($explod); $i++)
			{
			$explod[$i] = trim($explod[$i]);
			$foolArrayTaxi = $this->db->selectInfo("SELECT id FROM tbl_taxi WHERE dr_name LIKE  '%$explod[$i]%' OR dr_surname LIKE  '%$explod[$i]%' OR direction LIKE  '%$explod[$i]%' OR place LIKE  '%$explod[$i]%' OR info LIKE  '%$explod[$i]%' OR tel LIKE  '%$explod[$i]%' OR taxi_number LIKE  '%$explod[$i]%'");			
			$foolArrayCar = $this->db->selectInfo("SELECT dr_name FROM tbl_car WHERE dr_name LIKE  '%$explod[$i]%' OR dr_surname LIKE  '%$explod[$i]%'  OR info LIKE  '%$explod[$i]%' OR tel LIKE  '%$explod[$i]%' OR car_number LIKE  '%$explod[$i]%'");
			 
			if(!empty($foolArrayTaxi))	
			foreach($foolArrayTaxi as $key => $value)
				if($this->check($value['id'], $searchArray))
					$searchArray[] = $value['id'];
					if(!empty($foolArrayCar))		 
			foreach($foolArrayCar as $key => $value)
				if($this->check($value['dr_name'], $searchArray))
					$searchArray[] = $value['dr_name'];	
			
			}
			//echo(count($foolArrayTaxi));
			for($i = 0; $i < $n = count($searchArray); $i++){
			$taxi = $this->db->selectInfo("SELECT *FROM tbl_taxi WHERE id = '".$searchArray[$i]."'");
				if(!empty($taxi)) 
				  $resultSearch[] = $taxi;
			$car = $this->db->selectInfo("SELECT *FROM tbl_car WHERE dr_name = '".$searchArray[$i]."'");
				if(!empty($car)) 
				  $resultSearch[] = $car;									 
			}
			
			unset($searchArray);			
	    }
	   
	 	// echo($resultSearch[0][0]['dr_surname']);
		require_once 'tpls/search.tpl';
	}

}
?>