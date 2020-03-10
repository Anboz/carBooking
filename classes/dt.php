<?php
class dt extends cars {
	 function processing(){
	     	$user = $this->db->selectInfo("SELECT *FROM tbl_taxi WHERE password='".$_COOKIE['secId']."' AND email='".$_COOKIE['myEmail']."'");
//print_r($user);
	     	$_POST['carnumber'] = (trim($_POST['carnumber'])!='') ? trim($_POST['carnumber']) : $user[0]['car_number'];
	     	$_POST['tel'] = (trim($_POST['tel'])!='') ? trim($_POST['tel']) : $user[0]['tel'];
	     	$_POST['info'] = (trim($_POST['info'])!='') ? trim($_POST['info']) : $user[0]['info'];
	     	 //(file_get_contents($_FILES['image']['tmp_name']));
	     	 // print_r($_POST);
	     	
	     		if(!empty($_FILES['image']['tmp_name']))
	     			if(substr($_FILES['image']['type'], 0, 5)=="image")  	
	 $this->db->updateInfo("UPDATE `tbl_taxi` SET `image` = '".addslashes(file_get_contents($_FILES['image']['tmp_name']))."', `tel` = '".$_POST['tel']."', `info` = '".$_POST['info']."', `taxi_number` = '".$_POST['carnumber']."' WHERE `tbl_taxi`.`password` = '".$_COOKIE['secId']."' AND `email`='".$_COOKIE['myEmail']."'");
	     			else{
	     				echo("<script>alert('В место картинка вы загружали другой файл');</script>");
	     			}
	     	 else
	     		 $this->db->updateInfo("UPDATE `tbl_car` SET `tel` = '".$_POST['tel']."', `info` = '".$_POST['info']."', `taxi_number` = '".$_POST['carnumber']."' WHERE `tbl_taxi`.`password` = '".$_COOKIE['secId']."' AND email='".$_COOKIE['myEmail']."'");
	     	 
	     		 echo("<script>alert('Запрос выполнена');</script>");
	}
	
	function getContent() {			
	$user = $this->db->selectInfo("SELECT *FROM tbl_taxi WHERE password='".$_COOKIE['secId']."' AND email='".$_COOKIE['myEmail']."'");
	$client = $this->db->selectInfo("SELECT *FROM tbl_book_taxi WHERE idtaxi='".$user[0]['id']."'");

			 			 
		require_once 'tpls/dt.tpl';
	}

}
?>