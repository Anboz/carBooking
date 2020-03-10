<?php
class dc extends cars {
	     
	     function processing(){
	     	$user = $this->db->selectInfo("SELECT *FROM tbl_car WHERE password='".$_COOKIE['secId']."' AND email='".$_COOKIE['myEmail']."'");
//print_r($user);
	     	$_POST['carnumber'] = (trim($_POST['carnumber'])!='') ? trim($_POST['carnumber']) : $user[0]['car_number'];
	     	$_POST['tel'] = (trim($_POST['tel'])!='') ? trim($_POST['tel']) : $user[0]['tel'];
	     	$_POST['info'] = (trim($_POST['info'])!='') ? trim($_POST['info']) : $user[0]['info'];
	     	 //(file_get_contents($_FILES['image']['tmp_name']));
	     	 // print_r($_POST);
	     	
	     		if(!empty($_FILES['image']['tmp_name']))  	
	 $this->db->updateInfo("UPDATE `tbl_car` SET `image` = '".addslashes(file_get_contents($_FILES['image']['tmp_name']))."', `tel` = '".$_POST['tel']."', `info` = '".$_POST['info']."', `car_number` = '".$_POST['carnumber']."' WHERE `tbl_car`.`email` = '".$_COOKIE['myEmail']."'");
	     	 else
	     		 $this->db->updateInfo("UPDATE `tbl_car` SET `tel` = '".$_POST['tel']."', `info` = '".$_POST['info']."', `car_number` = '".$_POST['carnumber']."' WHERE `tbl_car`.`email` = '".$_COOKIE['myEmail']."'");
	     	 
	     		 echo("<script>alert('Запрос выполнена');</script>"); 
	     }	 
	
	
	function getContent() {
			
			 
			 $user = $this->db->selectInfo("SELECT *FROM `tbl_car` WHERE `email` = '".$_COOKIE['myEmail']."'");
			 $client = $this->db->selectInfo("SELECT *FROM `tbl_order_car` WHERE `idcar`='".$user[0]['id']."'");
			
			 
		require_once 'tpls/dc.tpl';
	}

}
?>