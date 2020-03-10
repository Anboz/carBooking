<div class="site-section">
      <div class="container">
      <? if(count($user) != 0){ ?>
        <div class="row">

          <div class="col-md-10">
               <div class="d-block d-md-flex listing-horizontal">
            
              <a class="img d-block" style="background-image: url(data:image/jpeg;base64,<?=base64_encode($user[0]['image'])?>);">
                
              </a>

              <div class="lh-content">                 
                <h3>Тел: <?=$user[0]['tel'];?></h3>
              <b>  Водитель: <?=($user[0]['dr_name'].' '.$user[0]['dr_surname']);?><br/>
                Номер машина: <?=($user[0]['car_number']) ?><br/>
                <?=($user[0]['info']) ?><br/></b>
                
              </div>                                
            </div>   
 <a href="?option=dc&titlepage=Мой кабинет&change=change">Изменить</a>
         <? if($_GET['change']=='change'){ ?>
         <div class="row">
          <div class="col-md-6 mb-5">
             
            <form action="" class="p-5 bg-white" method="post" enctype="multipart/form-data" style="border-style: solid; border-color:#dddddd; border-width: 1px; border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;">             
              
              <div class="row form-group">
                
                <div class="col-md-6">
                  <label class="text-black" for="carnumber">Номар машина</label> 
                  <input type="text" id="carnumber" class="form-control" name="carnumber">
                </div>
                <div class="col-md-6">
                  <label class="text-black" for="tel">Телефон</label> 
                  <input type="text" id="tel" class="form-control" name="tel">
                </div>
              </div>
		<div class="row form-group">
  	      <div class="col-md-12">
                <label class="text-black" for="message">О себе</label> 
                  <textarea class="form-control" id="message" name="info"></textarea>
                </div>
              </div>
              <div class="row form-group">
                
                <div class="col-md-12">
                  <label class="text-black" for="file">Рисунок машина</label> 
                  <input type="file" id="file" class="form-control btn  text-white" name="image" >
                </div>
              </div>
                             
              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="Изменить" class="btn btn-primary btn-md text-white" name="send">
                </div>
              </div>

  
            </form>
          
          
           
             
           
           </div>
           
          
        </div>
        <? } ?>

                 <font size="8"> <p align="center"> Клиенты   </p></font>
            <div class="row mb-3 align-items-stretch"> 
                              
            <? for($i = 0; $i < count($client); $i++) { ?>
              <div class="col-md-6 col-lg-6 mb-4 mb-lg-4">
                <div class="h-entry">                  
                  <div class="h-entry-inner">                    
                       Клиент: <b> <?=($client[$i]['client_name'].' '.$client[$i]['client_surname']); ?></b><br/>
                        Адрес:<b> <?=$client[$i]['client_addres']; ?></b><br/>
                    <p>  Номер телефон: <b><?=$client[$i]['client_tel']; ?> </b> <br/> 
                   	    От: <b> <?=$client[$i]['fromdate']; ?> / <?=$client[$i]['fromtime']; ?> </b> <br/>
                        До: <b> <?=$client[$i]['totime']; ?> </b> <br/>
                        Сообщений: <b> <?=$client[$i]['client_message']; ?> </b> <br/>
                    
                    </p>
                  </div>
                </div> 
              </div>
              
              
              <? } ?>
            </div>
             
          </div>

          
          
        </div>
        
       <? } ?>
        
      </div>
    </div>
