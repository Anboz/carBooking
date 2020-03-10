<div class="site-section bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-6 mb-5">
            <form action="" class="p-5 bg-white" method="post">
              <div class="row form-group">
                <div class="col-md-6 mb-3 mb-md-0" id="userName">
                  <label class="text-black" for="fname">Имя</label>
                  <input type="text" id="fname" class="form-control" name="name" v-on:input="inputName">
                    <font color="red" size="2"><i> {{ uname }} </i></font>
                </div>
                <div class="col-md-6" id="surname">
                  <label class="text-black" for="lname">Фамилия</label>
                  <input type="text" id="lname" class="form-control" name="surname" v-on:input="inputSName">
                    <font color="red" size="2"><i> {{ sname }} </i></font>
                </div>
              </div>

              <div class="row form-group">
                
                <div class="col-md-12" id="adres">
                  <label class="text-black" for="email">Адрес</label> 
                  <input type="email" id="email" class="form-control" name="email"oninput="inputAdres">                  
                </div>
              </div>

              <div class="row form-group">
                
                <div class="col-md-12" id="pass">
                  <label class="text-black" for="pass1">Пароль</label> 
                  <input type="password" id="pass1" class="form-control" name="pass1" v-on:input="countcars">
                   <font color="red" size="2"><i> {{ password }}  </i></font>
                </div>
              </div>
              
              <div class="row form-group">
                
                <div class="col-md-12" id="secPass">
                  <label class="text-black" for="pass2">Подтверждение пароля</label> 
                  <input type="password" id="pass2" class="form-control" name="pass2">
                  
                </div>
              </div>
              

              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="Зарегистрировать" class="btn btn-primary btn-md text-white" name="send">
                </div>
              </div>

  
            </form>
          </div>
          
        </div>
      </div>
    </div>
    
      <script src="js/vue.min.js"></script>
    
    <script type="text/javascript">
    	new Vue({
	el: '#pass',
	data:{
	 password:"",	  
	},
	methods:{
		countcars:function(event){
	this.password = (event.target.value.length < 6 && event.target.value.length > 0) ? "пароль должен содержит не менее 6 символов" : "";			
		},
	   }
});
 new Vue({
	el: '#userName',
	data:{
	 uname:"",	  
	},
	methods:{
		inputName:function(event){
	   this.uname = (event.target.value.length < 5 ) ? "Имя должен содержит минимум 5 символов" : "";			
		},
	   }
});  
  new Vue({
	el: '#surname',
	data:{
	 sname:"",	  
	},
	methods:{
		inputSName:function(event){
	   this.sname = (event.target.value.length < 5 ) ? "Фамилия должен содержит минимум 5 символов" : "";			
		},
	   }
})

    </script>