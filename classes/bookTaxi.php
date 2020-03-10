<?php
class bookTaxi extends cars {
        private $error = "Введите";
        function processing(){
              
       		  $error = "Введите";
       	if(trim($_POST['name'])=="")
       		$this->error.=" имя, ";
       	$_POST['name']= htmlspecialchars($_POST['name']);
       	if(trim($_POST['surname'])=="")
       		$this->error.=" фамилия, ";
       		$_POST['surname']= htmlspecialchars($_POST['surname']);
       	if(trim($_POST['tel'])=="")
       		$this->error.=" номер телефона, ";
       	$_POST['tel']= htmlspecialchars($_POST['tel']);
       	if(trim($_POST['adres'])=="")
       		$this->error.=" свой адрес, "; 
       	$_POST['adres']= htmlspecialchars($_POST['adres']);      	                     
       	if(trim($_POST['message'])=="")
       		$_POST['message'] = "Нет сообщений";
       	if(trim($_POST['countClient'])=="")
       		$this->error.="количество";
        $_POST['message']= htmlspecialchars($_POST['message']);
		if($this->error == "Введите")
			{      
				$this->db->insertInfo("INSERT INTO `tbl_book_taxi` (`place`, `name`, `surname`, `tel`, `adres`, `fromdate`, `fromtime`, `info`, `idtaxi`) VALUES ('".$_POST['countClient']."', '".$_POST['name']."', '".$_POST['surname']."', '".$_POST['tel']."', '".$_POST['adres']."', '".date('Y-m-d')."', '".date('H:i:s')."', '".$_POST['message']."', '".$_POST['idTaxi']."')");
					 
		$this->db->insertInfo("INSERT INTO `tbl_amount_users` (`id`, `fromdate`, `isTaxi`) VALUES ('".$_POST['idTaxi']."', '".date('Y-m-d')."', '1')");					 
					    $this->error ='Ваш запрос принята';	
		   	} 
			  
			   
      }
	
	function getContent() {	
		$taxi = $this->db->selectInfo("SELECT *FROM `tbl_taxi` WHERE `id`='".$_GET['idTaxi']."'");		 
		$taxi[0][] = $taxi[0]['place'];
	     $isfree =  $this->db->selectInfo("SELECT SUM(place) as clients FROM tbl_book_taxi WHERE idtaxi='".$_GET['idTaxi']."'");
	    /// print_r($isfree);
	     	  $name = "send";   
	     if(!empty($isfree))
	     {	      	     	
	     	$taxi[0][0] -= $isfree[0]['clients'];	     	  
	        if($taxi[0]['place'] == $isfree[0]['clients'])         	 
	        	$name = "";
		 }   	 
		   $comments = $this->db->selectInfo("SELECT commentText, user_commented FROM tbl_comment WHERE id='".$_GET['idTaxi']."' AND isTaxi='1' ORDER BY comment_date DESC LIMIT 50");  
	 
		require_once 'tpls/bookTaxi.tpl';
	}

}
?>