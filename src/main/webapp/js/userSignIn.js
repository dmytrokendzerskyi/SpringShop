$(function() {
	$(".btn").click(function() {
		$(".form-signin").toggleClass("form-signin-left");
    $(".form-signup").toggleClass("form-signup-left");
    $(".frame").toggleClass("frame-long");
    $(".signup-inactive").toggleClass("signup-active");
    $(".signin-active").toggleClass("signin-inactive");
    $(".forgot").toggleClass("forgot-left");   
    $(this).removeClass("idle").addClass("active");
	});
});

	$('#save').click(function() {		
		
		 var user ={
				name: $('#username').val() ,
				surname: $('#usersurname').val() ,
				email: document.getElementById('useremail').value ,
				password: $('#userpassword').val()
				
		}
		 
		 if($('#useremail').val() == "" || $('userpassword').val() == ""){
				document.getElementById('useremail').style.border = '2px solid red';
				document.getElementById('userpassword').style.border = '2px solid red';
			}else if($('#useremail').val() == "" && $('#userpassword').val() !== ""){
				document.getElementById('useremail').style.border = '2px solid red';
				document.getElementById('userpassword').style.border = 'none';
			}else if($('#userpassword').val() == ""){
				document.getElementById('userpassword').style.border = '2px solid red';
			}else {
		/* if(validatoremail(document.getElementById('useremail').value)){*/
		$.ajax({
			url: 'saveuseremail?' + $('input[name = csrf_name]').val() + '=' + $('input[name = csrf_value]').val(),
				contentType :'application/json ; charSet : UTF-8',
				dataType : 'json',
				method : 'POST',
				data: JSON.stringify(user),
				success : function() {
					$(".nav").toggleClass("nav-up");
					$(".form-signup-left").toggleClass("form-signup-down");
					$(".success").toggleClass("success-left"); 
					$(".frame").toggleClass("frame-short");
				}
		})
			}
		 /*} else{
			 var exs = document.createElement('span');
			 exs.id = 'ex';
			 var exsep = 'this email already exists';
				 
				 document.getElementById('ex').innerHTML = exsep;
		 }*/
	});

$(function() {
  $(".btn-signin").click(function() {
  $(".btn-animate").toggleClass("btn-animate-grow");
  $(".welcome").toggleClass("welcome-left");
  $(".cover-photo").toggleClass("cover-photo-down");
  $(".frame").toggleClass("frame-short");
  $(".profile-photo").toggleClass("profile-photo-down");
  $(".btn-goback").toggleClass("btn-goback-up");
  $(".forgot").toggleClass("forgot-fade");
/*				}
	});*/
});
});

/*$(function validatorEmail(email){
	console.log(email);
	$.ajax({
		url: 'validatoremail?' + $('input[name = csrf_name]').val() + '=' + $('input[name = csrf_value]').val(),
		contentType :'application/json ; charset=UTF-8',
		dataType : 'json',
		method : 'POST',
		data:JSON.stringify(email),
		success: function(bool) {
			if(bool=== true){
				return true;
			}
		}
		
		
	});
});
*/
