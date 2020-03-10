<?php
class main extends cars {	
	
	function searching()
	{
	  $searchArray = array();
		if(trim($_POST['searchtext'])!="")
		{  
		$explod = explode(' ', trim($_POST['searchtext']));
		//-----------, dr_name, dr_surname, direction, info, place, tel, taxi_number-------------//Car
		//SELECT * FROM `tbl_car` WHERE `dr_surname` LIKE '%ism%'
			for($i = 0; $i < count($explod); $i++)
			{
			$explod[$i] = trim($explod[$i]);
			$foolArrayTaxi = $this->db->selectInfo("SELECT id FROM tbl_taxi WHERE dr_name LIKE  '%$explod[$i]%' OR dr_surname LIKE  '%$explod[$i]%' OR direction LIKE  '%$explod[$i]%' OR place LIKE  '%$explod[$i]%' OR info LIKE  '%$explod[$i]%' OR tel LIKE  '%$explod[$i]%' OR taxi_number LIKE  '%$explod[$i]%'");
			
			$foolArrayCar = $this->db->selectInfo("SELECT id FROM tbl_car WHERE dr_name LIKE  '%$explod[$i]%' OR dr_surname LIKE  '%$explod[$i]%'  OR info LIKE  '%$explod[$i]%' OR tel LIKE  '%$explod[$i]%' OR car_number LIKE  '%$explod[$i]%'");		     		   	
		    }
				
	    }
	}
	
	
	function getContent() {	
	  $taxi = $this->db->selectInfo("SELECT *FROM tbl_taxi");
	  $car = $this->db->selectInfo("SELECT *FROM tbl_car");
	   $firstTaxi = 0;
	   $firstCar = 0;
	  $threeTaxis = $this->db->selectInfo("SELECT *FROM tbl_taxi ORDER BY regDate DESC LIMIT 3");
	  $threeCars = $this->db->selectInfo("SELECT *FROM tbl_car ORDER BY regDate DESC LIMIT 3");
      $comments = $this->db->selectInfo("SELECT commentText, user_commented FROM tbl_comment ORDER BY comment_date DESC LIMIT 12");
	  	//$this->db->deleteInfo("DELETE FROM tbl_comment WHERE id > '0'");
		require_once 'tpls/main.tpl';
	}

}
?>