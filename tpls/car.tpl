
		<? /* ?>		 <div class="site-section bg-light">
      <div class="container">

       
        <div class="slide-one-item home-slider owl-carousel">
                    
          <div>
            <div class="testimonial">            
           <div class="listing-item">
              <div class="listing-image">
              <img src="images/im3.jpg">
             </div>
          </div>
            </div>
          </div>
          <div>
            <div class="testimonial">
             <div class="listing-item">
              <div class="listing-image">
               <img src="images/im2.jpg">
               </div>
          </div>
            </div>
          </div>
          
           
             
          <div>
            <div class="testimonial">
              <div class="listing-item">
	              <div class="listing-image">
	             <img src="images/im1.jpg">
	             </div>
            </div>
            </div>
          </div>

          

        </div>
      </div>
    </div>     <? */ ?>


    <div class="site-section bg-light">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">

				 <?	foreach($car as $key => $value){ ?>				
            <div class="d-block d-md-flex listing-horizontal">
            
              <a href="?option=bookCar&titlepage=Заказ&idCar=<?=$value['id'];?>" class="img d-block" style="background-image: url(data:image/jpeg;base64,<?=base64_encode($value['image'])?>);">
                
              </a>

              <div class="lh-content">                 
                <h3>Тел: <?=$value['tel'];?></h3>
                Водитель: <?=($value['dr_name'].' '.$value['dr_surname']);?><br/>
                <?if(isset($value[0])){ ?>
                   <div class="row">
                     <div class="col-md-3">Занято то: </div>
                   <div class="col-md-9"> <b><?=$value[0]; ?>  / <i><?=$value[1]; ?></i></b></div>   
                   </div>
                    <div class="row">
                     <div class="col-md-3">до: </div>
                   <div class="col-md-9"> <b><?=$value[2]; ?></b></div>
                 
                   </div>
                <? } ?> <a class="btn btn-primary" href="?option=bookCar&titlepage=Заказ&idCar=<?=$value['id'];?>" style="border-radius: 20px;">Подробнее</a>
              </div>                                
            </div>                        
<? } ?>



     <!--      <div class="col-12 mt-5 text-center">
              <div class="custom-pagination">
                <span>1</span>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">6</a>
                <span class="more-page">...</span>
                <a href="#">10</a>
              </div>
            </div>--->  

          </div>
          <div class="col-lg-3 ml-auto">

            
            
           

          </div>

        </div>
      </div>
    </div>