<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-ng-app="app">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/categoryCommodity.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.1/angular.min.js"></script>
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
<title>Insert title here</title>
</head>
<body  data-ng-controller="homeCtrl">

<a href="backsignUp">back</a>
<a href="backhome">home page</a>
<h1>All Category</h1>
<div id="all"></div>

<h1>NEW Category</h1>
<%-- <form:form action="saveCategory" method="post" modelAttribute="category">
	<form:input path="name"  placeholder="name"/>
	<form:button>save</form:button>
</form:form> --%>
<form data-ng-submit="submit()">
<input id="nameCategory" placeholder="name" data-ng-model="text" >
<input id="submit" type="submit" value="Submit"> 
	<input type="hidden" name ="csrf_name" value="${_csrf.parameterName}">
	<input type="hidden" name ="csrf_value" value="${_csrf.token}">
<%-- <input type="hidden" name="csrf_name"  value="${_csrf.parameterName}">
<input  type="hidden" name="csrf_value" value="${_csrf.token}"> --%>
</form>
<script type="text/javascript" src="js/category.js"></script>
</body>
</html>