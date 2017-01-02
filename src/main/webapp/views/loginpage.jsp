<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/registration.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="form button group">
  <button type="button" id="one">Register</button>
  <button type="button" id="two">Login</button>
</div>
<!--registration-->
<form:form action = "registerUser" method="post" modelAttribute="user" id="registration">
<label for="name">${exception} </label>
  <p><form:input path="name"  name="username" id="name" placeholder="Enter your name"/></p>
  <p><form:input path="surname"  name="username" id="username" placeholder="Enter your surname"/></p>
  <p><form:input path="email" type="text" name="username" id="email" placeholder="Enter your email"/></p>
  <p><form:input path="phoneNumber" type="text" name="username" id="phoneNumber" placeholder="Enter your phone number"/></p>
  <p><form:input  path="password" type="password" name="password" id="password" placeholder="Enter your password"/></p>
  <%-- <p><form:input type="password" name="confirm_password" id="con_password" placeholder="Confirm your password"/></p> --%>
  <input type="submit" name="submit" id="submit" >
</form:form>
<!--login-->
<form:form action = "loginprocesing" method="post" id="login">
<label for="name">${exception} </label>
  <p><input type="text"  name="username" id="username" placeholder="Enter your username" /></p>
  <p><input type="password"  name="password" id="password" placeholder="Enter your password"/>
  </p>
  <input type="submit" name="log_in" id="log_in" value="Login">
</form:form>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>




<script  src="js/registration.js"></script>
</body>
</html>