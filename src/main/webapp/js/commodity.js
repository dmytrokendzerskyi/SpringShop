

$('#save').click(function() {
	var b = false;
	if(document.getElementById('idName').value === ''){
		b=true;
		document.getElementById('idName').style.border='2px solid red';
	}	
	if(document.getElementById('idModel').value === ''){
		b=true;
		document.getElementById('idModel').style.border='2px solid red';
	}	
	if(document.getElementById('idPrice').value === ''){
		b=true;
		document.getElementById('idPrice').style.border='2px solid red';
	}	
	if(b == true){
		
	}else{
		
	var commodityDTO ={
			name : document.getElementById('idName').value,
		model : document.getElementById('idModel').value,
		price : document.getElementById('idPrice').value,
		
		maker : document.getElementById('idMaker').value,
		
		
		categories :[ document.getElementById('idCategories').value]
	}
	console.log(commodityDTO);
	
	$.ajax({
		url:'saveCommodity?'+$('input[name=csrf_name]').val()+"="+ $('input[name=csrf_value]').val(),
		contentType :'application/json; charset=UTF-8',
			dataType : 'json' ,
			method : "POST" ,
			data: JSON.stringify(commodityDTO),
			success:function() {
				
			console.log('1');
		}
	});
	};
});