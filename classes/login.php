<?php
class login extends cars {
 
 	function haveAccount($email, $pass){
 		  return  $this->db->selectInfo("SELECT PASSWORD FROM tbl_reg WHERE PASSWORD='".$pass."' AND EMAIL='".$email."'");  			
 		}
     
     function processing(){
     	$error = "";	
     	if(strlen(trim($_POST['email'])) == 0)
     	   $error.="Введите адрес, ";
     	if(strlen(trim($_POST['pass'])) == 0)   		  
  	  	$error.="Введите пароль, ";
     		 
	  		    if($error != "")
	     	 	echo"<script>alert('$error')</script>";
	     	else{
	     	    if(count($this->haveAccount(trim($_POST['email']), md5(trim($_POST['pass'])))) > 0)
	     	    { 	     	     
	     	      $logDate = $this->db->selectInfo("SELECT id FROM tbl_reg WHERE email='".trim($_POST['email'])."'");
	     	      if(count($this->db->selectInfo("SELECT *FROM tbl_last_login WHERE logDate = CAST('".date('Y-m-d')."' AS DATE) AND id = '".$logDate[0]['id']."'")) == 0){
	     	     	$istaxi = 0;
	     	     	$ID = $this->db->selectInfo("SELECT id FROM tbl_taxi WHERE email = '".$_POST['email']."'");
	     	     	$haveCar = false;
	     	     	 if(count($ID) > 0){ 
     	    	 	     $istaxi = 1;
     	    	 	     $haveCar = true;
					}
	     	     	 if($istaxi == 0){
	     	     if(count($this->db->selectInfo("SELECT id FROM tbl_car WHERE email = '".$_POST['email']."'")) > 0)
	     	     	 $haveCar = false; 
					}   
     	    	     if($haveCar)
     	    	     	 $this->db->insertInfo("UPDATE tbl_last_login SET logDate = '".date('Y-m-d')."', isTaxi='".$istaxi."' WHERE id='".$ID[0]['id']."' AND isTaxi='". $istaxi."'"); 
	     	      } 	     	      
     	    	 setcookie('myId',md5(trim($_POST['pass'])));
     	    	 setcookie('secId',md5(md5(trim($_POST['pass']))));
     	    	 setcookie('myEmail',trim($_POST['email'])); 
     	    	
     	    	
     	    	  header("location:?option=user&titlepage=Добро пожаловать");   
				} 
     	    else{
     	    	echo"<script>alert('Пользователь не найден!')</script>";     	    	    	    	
     	        }	
     	     	 	
     	     }	 
  		
     }
	
	function getContent() {
  
		require_once 'tpls/login.tpl';
	}

}
?>