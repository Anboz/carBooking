    <div class="site-section bg-light">
      <div class="container">
        <div class="row">       
          <div class="col-lg-8">
               <?	foreach($isfree as $key=>$value){ ?>
            <div class="d-block d-md-flex listing-horizontal">            
              <a href="?option=bookTaxi&titlepage=Заказ&idTaxi=<?=$value['id'];?>" class="img d-block" style="background-image: url(data:image/jpeg;base64,<?=base64_encode($value['image'])?>); ">                
              </a>
              <div class="lh-content">                 
                <h3>Тел: <?=$value['tel'];?></h3>
                <p>Водитель: <?=($value['dr_name'].' '.$value['dr_surname']);?> </p>                                           
                          Место: <?=$value['place'];?><br>                                 	                                			                    Свободно: <?=$value[0]; ?><br/>
                   Направление:   <?=$value['direction']; ?> <br><a class="btn btn-primary" href="?option=bookTaxi&titlepage=Заказ&idTaxi=<?=$value['id'];?>" style="border-radius: 20px;">Подробнее</a>                   
              </div>
            </div>
<? } ?>
          </div>
          <div class="col-lg-4 ml-auto">
			 <div>
			 	<form class="p-5 bg-white">
			 	<p><label>Выберите направления</label></p>
			 	<a href="?option=region&titlepage=Такси&region=Сугд"> <input type="button" name="sugd" value="Сугд" class="btn btn-info form-control"/></a><br/><br/>
			 	<a href="?option=region&titlepage=Такси&region=ГБАО"><input type="button" name="gbao" value="Г Б А О" class="btn btn-info form-control"/></a><br/><br/>
			 	<a href="?option=region&titlepage=Такси&region=Хатлон"><input type="button" name="hatlon" value="Хатлон" class="btn btn-info form-control"/></a><br/><br/>
			 	<a href="?option=taxi&titlepage=Такси"> <input type="button" name="allregion" value="Все направлении" class="btn btn-info form-control"/></a><br/>			 	  
			 	</form>
			 </div>            
          </div>
        </div>
      </div>
    </div>

  