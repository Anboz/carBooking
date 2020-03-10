<div class="site-section bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-6 mb-5">
             
             <? if(isset($_COOKIE['myId']) && isset($_COOKIE['secId']) && md5($_COOKIE['myId']) == $_COOKIE['secId']){ ?>
             <? if(count($drive) > 0){ ?>
               <h1>У вас нет разрешения для добавления больше один машина на одно аккаунта</h1>
          <? } else { ?>
            <form action="" class="p-5 bg-white" method="post" enctype="multipart/form-data">
             
              <div class="row form-group">
                <div class="col-md-6 mb-3 mb-md-0">
                  <label class="text-black" for="fname">Имя</label>
                  <input type="text" id="fname" class="form-control" name="name" value="<?=$drive[0][_name]?>">
                </div>
                <div class="col-md-6">
                  <label class="text-black" for="lname">Фамилия</label>
                  <input type="text" id="lname" class="form-control" name="surname" value="<?=$drive[0][surname]?>">
                </div>
              </div>

               

              <div class="row form-group">
                
                <div class="col-md-12">
                  <label class="text-black" for="pass1">Номер машина</label> 
                  <input type="text" id="carnumber" class="form-control" name="carnumber">
                </div>
              </div>
              
              <div class="row form-group">                
                <div class="col-md-6">
                  <label class="text-black" for="pass1">Номер телефон</label> 
					<input type="text" id="tel" class="form-control" name="tel">
                </div>
                 <div class="col-md-6">
                  <label class="text-black" for="direction">Направление</label> 
                  <select class ="form-control"name="direction">
                  	<option></option>
                  	<option>Сугд</option>
                  	<option>Хатлон</option>
                  	<option>ГБАО</option>
                  </select>
                </div>
              </div>
                           
              <div class="row form-group">
                <div class="col-md-6">
                <label class="text-black" for="fail">Рисунок машина</label> 
                  <input type="file" id="file" class="text-white" name="file">
                </div>
                <div class="col-md-6">
                <label class="text-black" for="plase">Количество место</label> 
                  <input type="text"  class="form-control" name="place">
                </div>
              </div>
			<div class="row form-group">
  	      <div class="col-md-12">
                <label class="text-black" for="plase">О себе</label> 
                  <textarea class="form-control" name="info"></textarea>
                </div>
              </div>
			
		
              <div class="row form-group">
                <div class="col-md-6">
                  <input type="submit" value="Сохранить" class="btn btn-primary btn-md text-white" name="send">
                </div>
              </div>
            </form>
            
            <? } } ?>
             <? if(!isset($_COOKIE['secId'])){ ?>             
            <h1>Вы не авторизовали</h1>
             <p>Если хотите авторизовать <a href="?option=login&titlepage=Вход">нажмите здесь</a></p>
             <p>Если у вас нет аккаунта то вам надо <a href="?option=signup&titlepage=Регистрация">зарегистрировать</a></p>
             <? } ?>
            
          </div>
          
        </div>
      </div>
    </div>