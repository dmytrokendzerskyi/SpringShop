<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/newMaker.css">
<title>Insert title here</title>
</head>
<body>
<a href="backsignUp">back</a>
<a href="backhome">home page</a>
<h1>ALL MAKER</h1>
<c:forEach items="${makers }" var="maker">
	${maker.name} ${maker.adress } 
	<a href="deletemaker/${maker.id}">delete</a><br>
	
</c:forEach>
<h1>NEW MAKER</h1>
<form:form modelAttribute="maker" action="savenewMaker" method="post">
<form:input path="name" type="text" placeholder="name"/>
<form:input path="adress" type="text" placeholder="adress"/>
<form:button>save</form:button>
</form:form>

</form>

</body>
</html>