<?php
class signup extends cars {
  
      
  function processing(){
 	 $error = false;
 	 $name="";
 	 $surname="";
 	 $email="";
 	 $pass1="";
  	  if(strlen(trim($_POST['name'])) > 2)
  	  	$name = htmlspecialchars(trim($_POST['name']));
  	  	else 
  	  	$error=true;
  	  	   	  	
  	  if(strlen(trim($_POST['surname'])) > 2)
  	  	 $surname = htmlspecialchars( trim($_POST['surname']));
  	     else
  	  	 $error=true;
  	    
  	  if(strlen(trim($_POST['email'])) > 0)
  	  	$email = trim($_POST['email']);
  	    else{
  	  	 $error=true;
		 echo"<script>alert('Введите адрес электорнной почте');</script>";
		}		 
  		if(strlen(trim($_POST['pass1'])) > 5) 
  		  $pass1 = trim($_POST['pass1']);
           else
  	  	 $error=true;
  		
  		  if(!$error)
  			{
  	     	if($pass1 !=  trim($_POST['pass2']))
  	     		echo"<script>alert('Пароли не совпадають');</script>";
  	     	else{
  	     	$pass1 = md5($pass1);
  	     	if(!empty(($this->db->selectInfo("SELECT `email`FROM `tbl_reg` WHERE EMAIL='".$email."'"))))
  	     		echo"<script>alert('Адрес уже существует');</script>";
  	     	else{  	     		  	     		  	     		
  	     	$this->db->insertInfo("INSERT INTO `tbl_reg`(`_name`, `surname`, `email`, `password`) VALUES('".$name."', '".$surname."','".$email."','".$pass1."')");
     	     	        	      	     	
  	     	setcookie('myId',md5 (trim($_POST['pass1'])));
     	    setcookie('secId',md5(md5(trim($_POST['pass1']))));    	     	
     	    setcookie('myEmail',trim($_POST['email']));
  	     	   header("location:?option=user&user=".$name."&titlepage=Добро пожаловать");
     	    	} 	     		  	     		  	     		
  	  	     }
  	     	
  	     } 
  	
	}

	
	function getContent() {

		require_once 'tpls/signup.tpl';
	}

}
?>