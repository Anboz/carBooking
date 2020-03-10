 <!-- Content  -->
  
  
     <div class="site-section" data-aos="fade">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center border-primary">
            <h2 class="font-weight-light text-primary">Новые объявление</h2>
          <!-- <p class="color-black-opacity-5">Здесь указан те шофёры который у них ест много клиентов</p>---> 
          </div>
        </div>

        <div class="row">
        <?if(!empty($threeCars)){ ?>
        <? for($i = 0; $i < 3; $i++){ ?>
          <div class="col-md-6 mb-4 mb-lg-4 col-lg-4">
            
            <div class="listing-item">
              <div class="listing-image">
                <img src="data:image/jpeg;base64,<?=base64_encode($threeCars[$i]['image']); ?>"style="height: 350px;" alt="" class="img-fluid">
              </div>
              <div class="listing-item-content">
                <h2 class="mb-1">Тел: <?=$threeCars[$i]['tel'];?></h2>
                <span class="address">Водитель: <?=($threeCars[$i]['dr_name'].' '.$threeCars[$i]['dr_surname']);?> </span>
                <a class="px-3 mb-3 category" href="?option=bookCar&titlepage=Заказ свадебние машина&idCar=<?=$threeCars[$i]['id'];?>">Подробнее</a>
               
              </div>
            </div>

          </div>
          
          <? } } ?>
          
          
            <?if(!empty($threeTaxis)){ ?>
        <? for($j = 0; $j < 3; $j++){ ?>
         
          <div class="col-md-6 mb-4 mb-lg-4 col-lg-4">
            
            <div class="listing-item">
              <div class="listing-image">
                <img src="data:image/jpeg;base64,<?=base64_encode($threeTaxis[$j]['image']); ?>"style="height: 350px;" alt="" class="img-fluid">
              </div>
              <div class="listing-item-content">
               <h2 class="mb-1">Тел:<?=$threeTaxis[$j]['tel'];?></h2>
                <span class="address">Водитель: <?=($threeTaxis[$j]['dr_name'].' '.$threeTaxis[$j]['dr_surname']);?> </span>
                <a class="px-3 mb-3 category" href="?option=bookTaxi&titlepage=Заказ такси&idTaxi=<?=$threeTaxis[$j]['id'];?>">Подробнее</a>
                
              </div>
            </div>

          </div>
         
          <? } } ?>
          
      </div>
    </div>
     

    
    
 
       <?   unset($threeCars); unset($threeTaxis);    ?>
	   
 
 
 
    <div class="site-section">
      <div class="container">
         <h2 class="text-primary mb-3">Отзыв</h2>
          <div class="row" >
          
          <div class="col-md-6" id="leftRow">
           
            <? for($i = 0; $i < (count($comments) / 2)-1; $i++){ ?>
            <font color="#00aa00"> <?=$comments[$i]['user_commented'];?> </font>
           <div class="row mb-4">              
              <div class="col-11 border p-3 rounded mb-2" style="background-color: white;">                                          
                      <p class="mb-0"><?=$comments[$i]['commentText']; ?></p>                     
              </div>              
            </div>
            
            
            
            <? } ?>
          </div>
         
          <? if(count($comments) > 1){ ?>
           <div class="col-md-6" id="rightRow">
           
            <? for($i = (count($comments) / 2)+1; $i < count($comments); $i++){ ?>
            <font color="#00aa00"> <?=$comments[$i]['user_commented'];?> </font>
            <div class="row mb-4">
              
              <div class="col-11 border p-3 rounded mb-2" style="background-color: white;">                                          
                      <p class="mb-0"><?=$comments[$i]['commentText']; ?></p>                     
              </div>              
            </div>
            <? } ?>
          </div>
          <? } ?>
        </div>
            
            
            </div>
    </div> 
 
    
     
 

 