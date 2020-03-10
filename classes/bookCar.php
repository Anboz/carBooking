<?php
class bookCar extends cars {
	    
	    private $error = "Введите";
	    
	    function processing(){
	    
       	if(trim($_POST['name'])=="")
       		$this->error.=" имя, ";
       	if(trim($_POST['surname'])=="")
       		$this->error.=" фамилия, ";
       	if(trim($_POST['tel'])=="")
       		$this->error.=" номер телефона, ";
       	if(trim($_POST['adres'])=="")
       		$this->error.=" свой адрес, ";
       	if(trim($_POST['fromdate'])=="")
       		$this->error.=" дату, ";
       	if(trim($_POST['fromtime'])=="") 
       		$this->error.="время, ";	           
       	if(trim($_POST['totime'])=="")
       		$this->error.="время, "; 
       	if(trim($_POST['message'])=="")
       		$_POST['message'] = "Нет сообщений";
       	
       	if($this->error == "Введите")
		{          
 	     if((strtotime(date($_POST['fromdate'],strtotime($_POST['fromtime'])))-strtotime(date('Y-m-d',time()))) >= 0)
 	     { 	     
        	 if(strtotime($_POST['fromtime']) < strtotime($_POST['totime']))
        	 {
	        	 $isBusi =  ($this->db->selectInfo("SELECT *FROM tbl_order_car WHERE `idcar`='".$_POST['idCar']."' AND fromdate='".$_POST['fromdate']."'"));
	         	   if(count($isBusi) == 0){
					       	
					 $this->db->insertInfo("INSERT INTO `tbl_order_car`(`idcar`,`client_name`,`client_surname`,`client_tel`,`client_addres`,`client_message`,`fromdate`,`fromtime`,`totime`)VALUES('".$_POST['idCar']."','".$_POST['name']."','".trim($_POST['surname'])."','".trim($_POST['tel'])."','".$_POST['adres']."','".trim($_POST['message'])."','".$_POST['fromdate']."','".$_POST['fromtime']."','".$_POST['totime']."')");
					 
		$this->db->insertInfo("INSERT INTO `tbl_amount_users` (`id`, `fromdate`, `isTaxi`) VALUES ('".$_POST['idCar']."', '".date('Y-m-d')."', '0')");		
							$this->error = "Ваш запрос принята";	 					    
					    	
					}else
					{
					$this->error = "Данная машина занята на дату который вы определили. Пожалуйста измените дату!";
					}	 
			    	 
			}else $this->error = 'Время установленно неправильно!';	   
	      }else $this->error = 'Дата установленно неправильно!';
	     }
			
	
	}
	
	
	function getContent() {

        $car = $this->db->selectInfo("SELECT *FROM tbl_car WHERE id='".$_GET['idCar']."'");
        	 		 
	     $busi = $this->db->selectInfo("SELECT fromdate FROM tbl_order_car WHERE idcar='".$_GET['idCar']."'");
	 	   
	     
	     $comments = $this->db->selectInfo("SELECT commentText, user_commented FROM tbl_comment WHERE id='".$_GET['idCar']."' AND isTaxi='0' ORDER BY comment_date DESC LIMIT 50");
	    
		require_once 'tpls/bookCar.tpl';
	}

}
?>