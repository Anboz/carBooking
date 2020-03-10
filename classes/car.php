<?php
class car extends cars {
	 	function getContent() {  
	 	
	 	 $car = $this->db->selectInfo("SELECT *FROM tbl_car");						
	 	  $busi = $this->db->selectInfo("SELECT *FROM tbl_order_car");
	 	  if(!empty($busi))
	 	  for($i = 0; $i < $n = count($car); $i++)
	 	  {
		 	  	for($j = 0; $j < $k = count($busi); $j++)
		 	  	{
		 	  		if($car[$i]['id'] == $busi[$j]['idcar'])
		 	  		{
		 	  			$car[$i][] = $busi[$j]['fromdate'];
		 	  			$car[$i][] = $busi[$j]['fromtime'];
		 	  			$car[$i][] = $busi[$j]['totime'];		 	  			
		 	  		}
		 	  				 	  		
		 	  	}	 	  	
	 	  }
	 	  						
	 	     
		require_once 'tpls/car.tpl';
	}

}
?>