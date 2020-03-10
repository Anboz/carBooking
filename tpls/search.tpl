
			 


    <div class="site-section bg-light">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">

				 <?	for($i = 0; $i < $n = count($resultSearch); $i++){ ?>
				 				
            <div class="d-block d-md-flex listing-horizontal">
             <? if(isset($resultSearch[$i][0]['taxi_number'])){ ?>
              <a href="?option=bookTaxi&titlepage=Заказ&idTaxi=<?=$resultSearch[$i][0]['id'];?>" class="img d-block" style="background-image: url(data:image/jpeg;base64,<?=base64_encode($resultSearch[$i][0]['image'])?>);"> </a>                     
            <? } ?>
        
         <? if(isset($resultSearch[$i][0]['car_number'])){ ?>
              <a href="?option=bookCar&titlepage=Заказ&idCar=<?=$resultSearch[$i][0]['id'];?>" class="img d-block" style="background-image: url(data:image/jpeg;base64,<?=base64_encode($resultSearch[$i][0]['image'])?>);"> </a>                     
         <? } ?>
              <div class="lh-content">                 
                <h3>Тел: <?=$resultSearch[$i][0]['tel'];?></h3>
                Водитель: <?=($resultSearch[$i][0]['dr_name'].' '.$resultSearch[$i][0]['dr_surname']);?><br/>
                <? if(isset($resultSearch[$i][0]['car_number'])){ ?>                 
                 Номер машина: <b><?=$resultSearch[$i][0]['car_number']?></b><br />
                  <a class="btn btn-primary" href="?option=bookCar&titlepage=Заказ&idCar=<?=$resultSearch[$i][0]['id'];?>" style="border-radius: 20px;">Подробнее</a> <br/>
                  <? } ?>
                 
                  <? if(isset($resultSearch[$i][0]['taxi_number'])){ ?>
                     Номер машина: <b><?=$resultSearch[$i][0]['taxi_number']?></b><br />
                     Направление: <b><?=$resultSearch[$i][0]['direction']?></b><br/>
                     Место: <b><?=$resultSearch[$i][0]['place']?></b><br/>
                  <a class="btn btn-primary" href="?option=bookTaxi&titlepage=Заказ&idTaxi=<?=$resultSearch[$i][0]['id'];?>" style="border-radius: 20px;">Подробнее</a>                  
                   <? } ?>
                  
              </div>                                
            </div>                        
<? } ?>
  <?if(count($resultSearch)==0) { ?>
  
  <h1>Ничего не найден</h1>
       <? } ?>
          </div>
          <div class="col-lg-3 ml-auto">

            
            
           

          </div>

        </div>
      </div>
    </div>