<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/tiles/header.css">
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="wrap" style="height:200px;">
<div style="float:right;">
<sec:authorize access="isAuthenticated()">
<form:form action="logout" method="post" style="float:right; margin-left:15px; margin-right:10px; margin-top:5px;">
<button>logout</button>
</form:form>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN')" >
<a href="new">admin page</a>
</sec:authorize>
</div>
<div class="logotipe" style="margin:0px;"><span>TechnoMan</span></div>
<div id='menu-nav'>
  <div id='navigation-bar'>
    <ul>
      <li class='menu-sub-nav current-item'><a href='home'><i class='fa fa-home'></i><span>Home</span></a></li>
      <li class='menu-sub-nav'><a href='#'><i class='fa fa-cogs'></i><span>About</span></a></li>
      <sec:authorize access="hasRole('ROLE_USER')"><li class='menu-sub-nav'><a href='myProfile'><i class='fa fa-user'></i><span>Profile</span></a></li></sec:authorize>
      <li class='menu-sub-nav'><a href='userSign'><i class='fa fa-book'></i><span>Sign In | Sign Up</span></a></li>
      <li class='menu-sub-nav' id='searchbox'><a href='#'><i class='fa fa-search'></i><span>Search</span></a></li>
    </ul>
  </div>
  <div id='search-bar'>
    <form action='nothing'>
      <input type='text' name='search' id='searchfld' placeholder='Enter your query and hit enter'/>
    </form>
  </div>
</div>
</div>
<script type="text/javascript" src="js/tiles/header.js"></script>
</body>
</html>