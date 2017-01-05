<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/SpringShop/js/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="/SpringShop/css/userSignIn.css">
 <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.1.5/angular.js"></script>
<spring:url value="/SpringShop/js/angular.min.js" var="angular.js" />
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
<title>Insert title here</title>
</head >
<body >

<div class="container" ng-app="myapp">
  <div class="frame">
    <div class="nav">
      <ul class ="links">
        <li class="signin-active"><a class="btn">Sign in</a></li>
        <li class="signup-inactive"><a class="btn">Sign up </a></li>
      </ul>
    </div>
    <div ng-app ng-init="checked = false">
				      <form class="form-signin" action="loginprocesing?${_csrf.parameterName}=${_csrf.token}" method="post" name="form" novalidate>
				        <label for="name" class="exception" style="color:red;";>${error} </label>
          <label for="username">Email</label>
          <input  class="form-styling" type="email" name="username" id="loginemail" placeholder=""  required/>
           <span ng-show=" frm.loginemail.$error.required" style="color:red; font-size:10px;">Required!!!</span>
          <span ng-show=" frm.loginemail.$error.email" style="color:red; font-size:10px;" >Email is not valid!!!</span>
          <label for="password">Password</label>
          <input class="form-styling"  name="password" type="password" placeholder="" ng-model="loginpassword" required/>
          <input type="checkbox" id="checkbox"/>
          <label for="checkbox" ><span class="ui"></span>Keep me signed in</label>
          <div class="btn-animate">
            <button class="btn-signin" ng-disabled="form.$invalid">Sign in</button>
          </div>
				        </form>
   
				        <form class="form-signup" name="frm"  novalidate>
				        <label for="name" class="exception">${exception} </label>
				        <span id="ex"></span>
         <label for="fullname">Name</label>
          <input class="form-styling" type="text" name="name" placeholder="" id="username" ng-model="name"   ng-minlength="2"  ng-requared />
           <label for="fullname">SurName</label>
          <input class="form-styling" type="text" name="surname" placeholder="" id="usersurname" ng-model="surname" ng-requared ng-pattern="example.word" ng-minlength="2"/>
          <label for="name" class="exception">${emailerror}</label>
          <label for="email">Email</label>
          <span ng-show=" frm.email.$error.email" style="color:red; font-size:12px;" >Email is not valid!!!</span> 
          <input class="form-styling" type="email" name="email" placeholder="" id="useremail" ng-model="email" ng-touched="true"  requared />
          <!--  <label for="fullname">Phone</label>
          <input class="form-styling" type="text" name="phone" placeholder="" id="userphone"/> -->
           <label for="password">Password</label>
          <input class="form-styling"  name="password" type="password" placeholder="" id="userpassword" ng-model="password"  requared ng-minlength="5" />
          <!-- <label for="confirmpassword">Confirm password</label> -->
         <!--  <input class="form-styling" type="text" name="confirmpassword" placeholder=""/> -->
          <button ng-click="!checked" class="btn-signup" id ="save" ng-disabled="frm.$invalid">Sign Up</button>
      	<input type="hidden" name ="csrf_name" value="${_csrf.parameterName}">
		<input type="hidden" name ="csrf_value" value="${_csrf.token}">
				        </form>
    
      
      		<script>
      		
      		
      		
      		document.getElementById('useremail').oninput =(function(){
      			
      		var email = $('#useremail').val()
      			
      			$.ajax({
			url: 'validatoremail?' + $('input[name = csrf_name]').val() + '=' + $('input[name = csrf_value]').val(),
				contentType :'application/json ; charSet=UTF-8',
				method : 'POST',
				dataType : 'json',
				data: email ,
				 success : function(res) {
				  if(res == true){
					  
				 document.getElementById('useremail').style.border = '2px solid red';
				 }
				  if(res == false ){
					  document.getElementById('useremail').style.border = 'none';
				  }
				  
				 }
      			});
      		});
      		
      		
      		document.getElementById('loginemail').oninput =(function(){
      			
          		var email = $('#loginemail').val()
          			
          			$.ajax({
    			url: 'validatoremail?' + $('input[name = csrf_name]').val() + '=' + $('input[name = csrf_value]').val(),
    				contentType :'application/json ; charSet=UTF-8',
    				method : 'POST',
    				dataType : 'json',
    				data: email ,
    				 success : function(res) {
    				  console.log(res);
    				  if(res == false){
    					  document.getElementById('loginemail').style.border = '2px solid red';
    					  document.getElementById("loginemail").innerHTML = "This email is not sign up , please sign up )!";
    				  }
    				  if(res == true){
    					  document.getElementById('loginemail').style.border = 'none';
    				  }
    				 }
          			});
          		});
      		
      		/* 
      		(function(){
      			var app = angular.module('myapp', ['ngRoute']);
      			var controller = angular.controller('controllervalidator');
      		app.controller('controller' , function validation($http) {
      		var user = {
      				name : $scope.name,
      				surname : $scope.surname,
      				email : $scope.email,
      				password : $scope.password
      		}
      		console.log(user);
			$scope.load = function () {
				$http({
					url: 'http://localhost:8080/SpringShop/userSign/validatoremail',
					method:'POST',
					headers: {'Content-Type': 'application/json'},
					data:JSON.stringify(user),
				}).then(function successCallback(response) {
                    console.log(response.data);
                }, function errorCallback() {
                    alert("Ошибка");
                });
			}	
      			
      			
      			
			});
      		}); */
   	
      		
      		</script>
      
            <div  class="success">
              <svg width="270" height="270" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
       viewBox="0 0 60 60" id="check" ng-class="checked ? 'checked' : ''">
                 <path fill="#ffffff" d="M40.61,23.03L26.67,36.97L13.495,23.788c-1.146-1.147-1.359-2.936-0.504-4.314
                  c3.894-6.28,11.169-10.243,19.283-9.348c9.258,1.021,16.694,8.542,17.622,17.81c1.232,12.295-8.683,22.607-20.849,22.042
                  c-9.9-0.46-18.128-8.344-18.972-18.218c-0.292-3.416,0.276-6.673,1.51-9.578" />
                <div class="successtext">
                   <p> Thanks for signing up! Check your email for confirmation.</p>
                </div>
             </div>
      </div>
      
      <div class="forgot">
        <a href="#">Forgot your password?</a>
      </div>
      
      <div>
        <div class="cover-photo"></div>
        <div class="profile-photo"></div>
        <h1 class="welcome">Welcome, Chris</h1>
         <a class="btn-goback" value="Refresh" onClick="history.go()">Go back</a> 
      </div>
  </div>
    
  <a id="refresh" value="Refresh" onClick="history.go()">
    <svg class="refreshicon"   version="1.1" id="Capa_1"  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
         width="25px" height="25px" viewBox="0 0 322.447 322.447" style="enable-background:new 0 0 322.447 322.447;"
         xml:space="preserve">
         <path  d="M321.832,230.327c-2.133-6.565-9.184-10.154-15.75-8.025l-16.254,5.281C299.785,206.991,305,184.347,305,161.224
                c0-84.089-68.41-152.5-152.5-152.5C68.411,8.724,0,77.135,0,161.224s68.411,152.5,152.5,152.5c6.903,0,12.5-5.597,12.5-12.5
                c0-6.902-5.597-12.5-12.5-12.5c-70.304,0-127.5-57.195-127.5-127.5c0-70.304,57.196-127.5,127.5-127.5
                c70.305,0,127.5,57.196,127.5,127.5c0,19.372-4.371,38.337-12.723,55.568l-5.553-17.096c-2.133-6.564-9.186-10.156-15.75-8.025
                c-6.566,2.134-10.16,9.186-8.027,15.751l14.74,45.368c1.715,5.283,6.615,8.642,11.885,8.642c1.279,0,2.582-0.198,3.865-0.614
                l45.369-14.738C320.371,243.946,323.965,236.895,321.832,230.327z"/>
    </svg>
  </a>
</div>
<script type="text/javascript" src="/SpringShop/js/angular.min.js"></script>
<script type="text/javascript" src="/SpringShop/js/userSignIn.js"></script>
</body>
</html>