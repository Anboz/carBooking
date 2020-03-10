<div class="site-section bg-light">
      <div class="container">
      <? if($this->error!="Введите" && $this->error!="Ваш запрос принята") { ?>
       <font color="red"><?=$this->error?></font>
       <? } else if($this->error=="Ваш запрос принята"){  ?>
         <center> <font color="green" size="7"><?=$this->error?></font></center>
       <? } ?>
        <div class="row">
          <div class="col-md-7 mb-5"  data-aos="fade" id="app">

            <? if($name!="") { ?>

            <form action="" class="p-5 bg-white" action="" method="post">
             

              <div class="row form-group">
                <div class="col-md-6 mb-3 mb-md-0">
                  <label class="text-black" for="fname">Имя</label>
                  <input type="text" id="fname" class="form-control" name="name" value="<?=$_POST['name']?>">
                </div>
                <div class="col-md-6">
                  <label class="text-black" for="lname">Фамилия</label>
                  <input type="text" id="lname" class="form-control" name="surname" value="<?=$_POST['surname']?>">
                </div>
              </div>

              <div class="row form-group">                
                <div class="col-md-12">
                  <label class="text-black" for="tel">Телефон</label> 
                  <input type="tel" id="tel" class="form-control" name="tel" value="<?=$_POST['tel']?>">
                </div>
              </div>
			 <div class="row form-group">                
                <div class="col-md-12">
                  <label class="text-black" for="adres">Адрес</label> 
                  <input type="text" id="adres" class="form-control" name="adres" placeholder="Район / Улица / Дом №" value="<?=$_POST['adres']?>">
                </div>
              </div>
              <div class="row form-group">                                
                <div class="col-md-6">
                    <label class="text-black" for="countClient">Количество: </label> 
                    <select id="countClient" name="countClient" class="form-control">
                      <option><?=$_POST['countClient']?></option>
                    	<? for($i = 1; $i <= $taxi[0][0]; $i++){ ?>
                    	<option><?=$i;?></option>
                    	<? } ?>
                    </select>
                </div>
              </div>   

              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="message">Сообщений</label> 
                  <textarea name="message" id="message" cols="30" rows="7" class="form-control" placeholder="Сообщений"><?=$_POST['message']?></textarea>
                </div>
              </div>
				<input type="hidden" name="place" value="<?=$taxi[0]['place'];?>"/>
				<input type="hidden" name="freeplace" value="<?=$taxi[0][0];?>"/>
				<input type="hidden" name="idTaxi" value="<?=$taxi[0]['id'];?>"/>
				
              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="Заказать" class="btn btn-primary btn-md text-white" name="<?=$name;?>">
                </div>
              </div>

  
            </form>
             <? } ?>
          </div>
          <div class="col-md-5"  data-aos="fade" data-aos-delay="100">
            
            <div class="p-4 mb-3 bg-white">
	            <div class="row">
	            <div class="col-md-5">
	               <img src="data:image/jpeg;base64,<?=base64_encode($taxi[0]['image'])?>" style="width: 100%;"> 
	            </div>
	            <div class="col-md-7">
	               Номер такси: <b><?=$taxi[0]['taxi_number'];?></b><br>
	               Тел: <b><?=$taxi[0]['tel'];?></b><br>
	               Водитель: <b><?=($taxi[0]['dr_name'].' '.$taxi[0]['dr_surname']);?></b>
	            </div>
	            <div class="col-md-12">
	            Направлений: <?=$taxi[0]['direction'];?><br>
	                 Место: <?=$taxi[0]['place'];?> <br>
                                				                    
                    Свободно: <?=$taxi[0][0];?>   
	              <hr>
	              <?=$taxi[0]['info'];?>
							              
	            </div>
				</div>
            </div>
            	<script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A4dbdbbfb3c2be331b2c60ad878d646edd7c2a8fc66c043cb3be512e155ac2fef&amp;width=100%&amp;height=383&amp;lang=ru_RU&amp;scroll=true"> </script> 
         
        </div>
      </div>
        <div class="container">
         <h2 class="text-primary mb-3">Отзыв</h2>
          <div class="row" >
          
          <div class="col-md-6" id="leftRow">
           
            <? for($i = 0; $i < count($comments) / 2; $i++){ ?>
            <font color="#00aa00"> <?=$comments[$i]['user_commented'];?> </font>
           <div class="row mb-4">              
              <div class="col-11 border p-3 rounded mb-2" style="background-color: white;">                                          
                      <p class="mb-0"><?=$comments[$i]['commentText']; ?></p>                     
              </div>              
            </div>
            
            
            
            <? } ?>
          </div>
          <div class="col-md-6" id="rightRow">
          <? if(count($comments) > 1){ ?>
          
           
            <? for($i = (count($comments) / 2) + 1; $i < count($comments); $i++){ ?>
            <font color="#00aa00"> <?=$comments[$i]['user_commented'];?> </font>
            <div class="row mb-4">
              
              <div class="col-11 border p-3 rounded mb-2" style="background-color: white;">                                          
                      <p class="mb-0"><?=$comments[$i]['commentText']; ?></p>                     
              </div>              
            </div>
            <? } ?>
          
          <? } ?>
          	
          </div>
        </div>
            
            
            </div>
        
        <div class="row">
          <div class="col-md-6">
		         <div id="cmt" style="background-color: white; border-style: none; border-width: 1px; border-radius: 5px;">
		           <form id="commentForm">  
		           <input type="text" calss="form-control commented" placeholder="Имя" name="comented" id="commented" style="width: 50%; margin: 6px; padding: 8px; border-style:solid; border-width:1px; border-color:#2a2828;" /> <br> 
		           <input type="text" calss="form-control commentText" id="commentText" placeholder="Коментария" name="commentText" style="width: 95%; margin: 6px; padding: 8px;border-style:solid; border-width:1px; border-color:#2a2828;" />            <br>
		           <input type="hidden" value="<?=$taxi[0]['id']?>" name="commentId" id="id">
		           <input type="hidden" value="1" name="isTaxi" id="isTaxi">
		            <input type="button" class="btn btn-info" id="send" style="margin: 5px;" value="Коментировать"> 
		           <label id="out"></label>
		</form>
			 </div>
          </div>
        </div>  
          
        
    </div>