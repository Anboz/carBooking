  var leftOrRight = 0; 
$('#send').on('click', function(){
	var commented = $('#commented').val().trim();   
	var commentText = $('#commentText').val().trim();
	var commentId = $('#id').val().trim();
	var isTaxi = $('#isTaxi').val().trim();
		//alert(commented+"  "+commentText+"  "+commentId+"  "+ isTaxi);
	if(commentText!='' && commented!=""){
		$.ajax({
			url:'classes/form.php',
			type:'POST',
			cache: false,
			data:{'commented': commented, 'commentText':commentText, 'commentId':commentId, 'isTaxi':isTaxi },				dataType: 'html',
			beforeSend: function(){
			    var appendToBlock = '#rightRow';
				$('#send').prop('disabled', true);
				if(leftOrRight % 2 == 0){
					appendToBlock = '#leftRow';					 
				}				
				
				var $fnt = $("<font color='#00aa00'>"+ commented +"</font>").appendTo(appendToBlock);
				var $CommentText = $("<div class='row mb-4'> <div class='col-11 border p-3 rounded mb-2' style='background-color: white;'><p class='mb-0'>" + commentText + "     </p>    </div> </div> ").appendTo(appendToBlock);				
				 leftOrRight++; 
			},
			success: function(param){
			    $("#commentForm").trigger("reset"); 
				$('#send').prop('disabled', false);	
			}
		});
		
		
	}
	else 
		alert("Вы не ввели имя или коментарии");
	
	
});