<?php
header("Content-Type: text/html; charset='utf-8'");
 require_once 'classes/cars.php';
 date_default_timezone_set("Asia/Dushanbe"); 
$option = "main"; 
if(strlen($_GET['option']) > 0)  
	$option = $_GET['option'];
    if(file_exists('classes/' . $option . '.php')) 
{
	require_once 'classes/' . $option . '.php';
	if(class_exists($option)) 
	{
		$obj = new $option;
		$obj->getBody();
	} else  
		require_once 'blocks/500.php';	 
} else  
	require_once 'blocks/404.php'; 
?>