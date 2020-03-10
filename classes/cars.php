<?php
require_once 'db.php';
abstract class cars {	
 	protected $db = null;	 
	
	function init() {
		$this->db = new DB("booking");
	}  
	
	function getHeader() {	   
		require 'blocks/header.html';
	}
	
	function getFooter() {
		require 'blocks/footer.html';         
		 require 'button/index.html';
	}
 
	function getBody() {	    
		$this->init();
		if($_POST['send'])		
		$this->processing();		 					 	
		$this->getHeader();		
		$this->getContent();		
		$this->getFooter();		
	}	
	
	
}
?>