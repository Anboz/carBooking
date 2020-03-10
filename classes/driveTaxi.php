<?php
class driveTaxi extends cars {
	
	
	function processing(){	 
	 		 
	 		 
	 		 $date = time();
	 	 $error = "Введите";
		$info = (trim($_POST['info'])=='')? "Нет информация":trim($_POST['info']);
		$image = "";
		if(trim($_POST['name'])=='')
			$error.=" имя, ";
		if(trim($_POST['surname'])=='')
			$error.=" фамилия, ";
		if(trim($_POST['carnumber'])=='' || trim(strlen($_POST['carnumber'])) < 4 || trim(strlen($_POST['carnumber'])) > 8)
			$error.=" номер машина, ";
		if(trim($_POST['tel'])=='')
			$error.=" номер телефона, ";
		if(trim($_POST['direction'])=='')
			$error.=" направления, ";		 
		if(trim($_POST['place'])=='')
			$error.=" количество сидений,";
		if(empty($_FILES['file']['tmp_name']))
			$error.=" картинку!";			  
		 if($error=='Введите'){	
		 	if(!empty($this->db->selectInfo("SELECT id FROM tbl_taxi WHERE email='".$_COOKIE['myEmail']."'")) || !empty($this->db->selectInfo("SELECT id FROM tbl_car WHERE email='".$_COOKIE['myEmail']."'"))  )
		 	  echo("<script>alert(У вас нет разрешения для добавления больше один машина на одно аккаунта');</script>"); 
		 	  else{ 
		 	  		if(substr($_FILES['file']['type'], 0, 5)=="image"){
				 $image = addslashes(file_get_contents($_FILES['file']['tmp_name']));		
				 $this->db->insertInfo("INSERT INTO `tbl_taxi`(`dr_name`,`taxi_number`,`dr_surname`,`image`,`tel`,`place`,`info`,`direction`,`password`,`email`,`regDate`)VALUES('".trim($_POST['name'])."','".trim($_POST['carnumber'])."','".trim($_POST['surname'])."','".$image."','".trim($_POST['tel'])."','".trim($_POST['place'])."','".$info."','".trim($_POST['direction'])."','".$_COOKIE['secId']."','".$_COOKIE['myEmail']."','".$date."')");				 
				 $logId = $this->db->selectInfo("SELECT id FROM tbl_taxi WHERE email='".$_COOKIE['myEmail']."'");
     	    	       $this->db->insertInfo("INSERT INTO tbl_last_login (id, logDate, isTaxi)VALUES('".$logId[0]['id']."', '".date('Y-m-d')."','1')");
     	    	        
     	    	       
				//echo("<script>alert('Ваша объявление сохранено');</script>");
				}
				else{
					echo("<script>alert('В место картинка вы загружали другой файл');</script>");
				  } 
			 } 
		} 
		else echo("<script>alert('".$error."');</script>"); 
		  
	}
	
	
	function getContent() {
	$drive = NULL;
	if(empty($this->db->selectInfo("SELECT id FROM tbl_taxi WHERE email='".$_COOKIE['myEmail']."'")) && empty($this->db->selectInfo("SELECT id FROM tbl_car WHERE email='".$_COOKIE['myEmail']."'")))
        $drive = $this->db->selectInfo("SELECT _name, surname FROM `tbl_reg` WHERE email='".$_COOKIE['myEmail']."'");
        
		require_once 'tpls/driveTaxi.tpl';//print_r($drive);
	}

}
?>