<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/newSubCategory.css">
<script type="text/javascript" src="js/jquery-3.1.1.js" ></script>
<title>Insert title here</title>
</head>
<body>
<a href="backsignUp">back</a>
<a href="backhome">home page</a>
	<h1>ALL SUBCATEGORY</h1>
	<div id="all"></div>
	
	<h1>NEW SUBCATEGORY</h1>
	<input name= "name" id="subCategoryName" placeholder="name">
	<button type="submit" id="save" >Save</button>
	
	<input type="hidden" name ="csrf_name" value="${_csrf.parameterName}">
	<input type="hidden" name ="csrf_value" value="${_csrf.token}">
	
<script type="text/javascript" src="js/subCategory.js"></script>

</body>
</html>