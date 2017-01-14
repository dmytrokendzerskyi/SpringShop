 window.onload =function () {
	 load();
      };

 	$('#save').click(function () {
		
 		if(document.getElementById('subCategoryName').value == ""){
 			document.getElementById('subCategoryName').style.border = '2px solid red'; 
 		}else{
 			
 			document.getElementById('subCategoryName').style.border = '2px solid black'; 
 		
 		var subcategory ={
 				name : document.getElementById('subCategoryName').value
 		}
 		
 		document.getElementById('subCategoryName').value ="";
 		
 		$.ajax({
 			url: 'saveSubCategory?' + $('input[name = csrf_name]').val() + '=' + $('input[name = csrf_value]').val(),
 			contentType :'application/json',
 			dataType : 'json' ,
 			charset : 'UTF-8 ' ,
 			method : 'POST' ,
 			data: JSON.stringify(subcategory),
 			success:function() {
 				
				load();
			}
 			
 			
 		});
 		};
	});
 	document.getElementById('subCategoryName').oninput =(function(){
 		if(document.getElementById("subCategoryName").value != ""){
 			document.getElementById("subCategoryName").style.border = '2px solid black';
 		}
 		});
 		
 		function load() {
 			$.ajax({
 				url: 'loadSubCategory?' +$('input[name = csrf_name]').val() + '=' + $('input[name = csrf_value]').val() , 
 				contentType:'application/json ; charSet: UTF-8',
 				dataType : 'json' ,
 				method : "POST" ,
 				success: function (res) {
 					
 					 var allSubCategory = document.createElement('div');
 					 allSubCategory.id = 'all';
 					var all = '';
 						
 					for (var i = 0; i < res.length; i++) {
 						var idsub = res[i].id;
 						  all+='<div>' +'<span>'+res[i].name+'</span>' +'<a href="deleteSubCategory/' + idsub + '"> delete </a></div><br>';
					}
 					
 					document.getElementById('all').innerHTML = all;
 				}
 			});
			
		};
		function deleteSubCategory({id}) {

		    $.ajax({

		        url: 'deleteSubCategory?' + $('input[name=csrf_name]').val() + "=" + $('input[name=csrf_value]').val(),
		        method: 'GET',
		        contentType: 'application/json; charset=UTF-8',
		        data:{id},
		        success: function (res) {

		            var all = '';

		            for (var i = 0; i < res.length; i++) {
		                var index = res[i].id;
		                all+='<div>' +'<span>'+res[i].name+'</span>' +'<a href="deleteSubCategory/' + idsub + '"> delete </div><br>';
		            }
		            document.querySelector('.all').innerHTML = all;
		        }
		    })

}

 		