<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/SpringShop/css/profile.css">
<link rel="stylesheet" href="/SpringShop/css/userSignIn.css">
<spring:url value="/SpringShop/js/angular.min.js" var="angular.js" />
<title>Insert title here</title>
<style>
div{
font-family:Palatino Linotype;
}
</style>	
</head>
<body ng-app="app">
<div>
<a href="backhome" >Back on Home Page</a>
</div>
<h2 style="margin:0 39%; font-family:Palatino Linotype;">Hello ${use.name } ${use.surname} !</h2>

<img src="${use.pathImage }"  alt="add image" height="300px" width="300px">

<br/>

<form:form action="./saveImage?${_csrf.parameterName}=${_csrf.token}"
   method="post" enctype="multipart/form-data" 
   onsubmit="if(!this.image.value) return false" style="">
   <input type="file" name="image" >
   <button style=" background-color:#2020c8; color:white; width:100px; height:30px; border-radius:15%;">save image</button>
</form:form>
  
  <div class="preloader" ng-if="false">
    <div class="fetching">
      <div class="fetchContainer">
        <div class="loaderWrap">
          <div class="circleSide"></div>
        </div>
        <span class="initLoadMsg">Loading...</span>
      </div>
    </div>
  </div>

<br/>
<a href="getOrder/${commodity.id}">Get Order</a>
    <h2>Your Basket!</h2>
  <c:forEach  items="${user}" var="commodity">
    <div class="row">

      <div class="col-md-4">
      ${commodity.name } ${commodity.model } 
        <img width="256"  src="${commodity.pathImage}" class="attachment-900x900 size-900x900" 
          sizes="(max-width: 256px) 100vw, 256px">

        <div class="row">
          <div class="col-xs-6"><strong>USD ${commodity.price}</strong></div>
          <div class="col-xs-6"><a href="deleteOrder/${commodity.id}"><button type="submit"  class="btn btn-primary" ng-click="vm.newOrder()" style="margin-left:250px; background-color:#2020c8; color:white; width:100px; height:30px; border-radius:15%;">Delete Order</button></div></a> 
          <div class="col-xs-6"><a href="getOrder/${commodity.id}"><button type="submit"  class="btn btn-primary" ng-click="vm.newOrder()" style="margin-left:70%; background-color:#2020c8; color:white; width:170px; height:45px; border-radius:15%; font-size:20px;">Prepare Order</button></a></div> 
</c:forEach>
        </div>
      </div>
      <div class="col-md-8">
        <div class="well">
        
      </div>
    </div>
  </div>

<script type="text/javascript" src="/SpringShop/js/angular.min.js"></script>
<script type="text/javascript" src="/SpringShop/js/profile.js"></script>
</body>
</html>