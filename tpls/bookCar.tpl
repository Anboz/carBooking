  <div class="site-section bg-light">
      <div class="container">
       <? if($this->error!="Введите" && $this->error!="Ваш запрос принята") { ?>
       <font color="red"><?=$this->error?></font>
       <? } else if($this->error=="Ваш запрос принята"){  ?>
         <center> <font color="green" size="7"><?=$this->error?></font></center>
       <? } ?>
        <div class="row">
          <div class="col-md-7 mb-5"  data-aos="fade">

            <form action="" class="p-5 bg-white" action="" method="post">
             <input type="hidden" name="idCar" value="<?=$car[0]['id'];?>"/>

              <div class="row form-group">
                <div class="col-md-6 mb-3 mb-md-0">
                  <label class="text-black" for="fname">Имя</label>
                  <input type="text" id="fname" class="form-control" name="name" value="<?=$_POST['name']?>">
                </div>
                <div class="col-md-6">
                  <label class="text-black" for="lname">Фамилия</label>
                  <input type="text" id="lname" class="form-control"name="surname" value="<?=$_POST['surname']?>">
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
                  <input type="text" id="adres" class="form-control" name="adres" placeholder="Район/ Улица/ Дом №" value="<?=$_POST['adres']?>">
                </div>
              </div>



              <div class="row form-group">
                
                <div class="col-md-6">
                    <label class="text-black" for="fromdate">От <input type="date" class="form-control" id="fromdate" name="fromdate" value="<?=$_POST['fromdate']?>"> </label> 
                   
                   
                </div>
                <div class="col-md-5">
                    <label class="text-white" for="fromtime">Time<input type="time" class="form-control" id="fromtime" name="fromtime" value="<?=$_POST['fromtime']?>"> </label> 
                     
                </div>
              </div>
					
					<div class="row form-group">
                
                <div class="col-md-4">
                    <label class="text-black" for="todate">До  <input type="time" class="form-control" id="totime" name="totime" value="<?=$_POST['totime']?>"> </label> 
                     
                </div>
                <div class="col-md-6">
                   
                    
                </div>
              </div>
					
					
              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="message">Сообщений</label> 
                  <textarea name="message" id="message" cols="30" rows="7" class="form-control" placeholder="Сообщений"> <?=$_POST['message']?> </textarea>
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="Заказать" class="btn btn-primary btn-md text-white"name="send">
                </div>
              </div>

  
            </form>
          </div>
          <div class="col-md-5"  data-aos="fade" data-aos-delay="100">
            
            <div class="p-4 mb-3 bg-white">
	            <div class="row">
	            <div class="col-md-5">
	               <img src="data:image/jpeg;base64,<?=base64_encode($car[0]['image'])?>" style="width: 100%;"> 
	            </div>
	            <div class="col-md-7">
	               Номер такси: <b><?=$car[0]['car_number'];?></b><br>
	               Тел: <b><?=$car[0]['tel'];?></b><br/>
	               Водитель: <b><?=($car[0]['dr_name'].' '.$car[0]['dr_surname']);?></b>
	            </div>
	            <div class="col-md-12">	              
	              <hr/>
	              <?=$car[0]['info'];?><hr/>
	              <font color="#ff0000">
	              		<?if (count($busi) > 0) { ?>		 	 
				 	<b><h5>Занято</h5></b>
	                    <?=$busi[0]['fromdate']?>	
	                    <? } ?>
	                                   
	                	</font>              
	            </div>
				</div>
            </div>
            
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
          
           
            <? for($i = count($comments) / 2; $i < count($comments); $i++){ ?>
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
            <input type="text" calss="form-control commented" placeholder="Имя" name="commented" id="commented" style="width: 50%; margin: 6px; padding: 8px;" /> <br>
           <input type="text" calss="form-control commentText" id="commentText" placeholder="Коментария" name="commentText" style="width: 95%; margin: 6px; padding: 8px;" />            <br>
           <input type="hidden" value="<?=$car[0]['id']?>" name="commentId" id="id">
           <input type="hidden" value="0" name="isTaxi" id="isTaxi">
           <input type="button" class="btn btn-info" id="send" style="margin: 5px;" value="Коментировать"> 
          <label id="out"></label>
           
</form>
          </div>
</div>
</div>
      </div>
    </div>