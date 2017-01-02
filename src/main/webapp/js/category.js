	window.onload = function() {
	 load();
	};
	



$('#save').click(function() {
	
	if( document.getElementById('nameCategory').value === ""){
		 document.getElementById('nameCategory').style.border= '2px solid red';
	}else{
		
		document.getElementById('nameCategory').style.border= '2px solid black';
	var category = {
			name : document.getElementById('nameCategory').value
	}
	document.getElementById('nameCategory').value = '';
	$.ajax({
		url: 'saveCategory?' + $('input[name =csrf_name]').val() + '=' + $('input[name = csrf_value]').val(),
		contentType : 'application/json' ,
		charset : 'UTF-8 ' ,
		dataType : 'json', 
		method: 'POST',
		data: JSON.stringify(category) ,
		success: function() {
			load();
		}
		
	});
	
	};
	
});

function load(){
	$.ajax({
		url: 'loadCategory?' + $('input[name =csrf_name]').val() + '=' + $('input[name = csrf_value]').val(),
		contentType : 'application/json; charset=UTF-8' ,
		dataType : 'json', 
		method: 'POST',
		success: function(res) {
		var	allCategory = document.createElement('div');
		allCategory.id = 'all';
		var all = '';
		
		for (var i = 0; i < res.length; i++) {
			all +='<div>' +res[i].name+' <a href="deleteCategory/'+res[i].id + '"> delete</a></div><br>';
		}
		
		
		document.getElementById('all').innerHTML = all;
			
		}
	});
	
	
}
