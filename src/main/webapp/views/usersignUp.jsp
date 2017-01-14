<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf"  uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width"> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/newUser.css">
<title>Insert title here</title>
</head>
<body>

 <a href="backsignUp">back</a>
<a href="backhome">home page</a>
<h1>ALL ACCOUNT</h1>
<table>
	<thead>
		<tr>
			<th>UserName</th>
			<th>SurName</th>
			<th>Email</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${allUser}" var="user">
			<tr style="margin:5px">
				<td style="margin:5px"><h3 style="float:left"> ${user.name} </h3></td>
				<td><h3 style="float:left">${user.surname}   </h3></td>
				<td><h3 style="float:left ">${user.email}   </h3></td>
				<td><a href="deleteuser/${user.id}">delete</a></td>
			</tr>
		
		</c:forEach>
	</tbody>
</table>

<h1>NEW ACCOUNT</h1> 

 <sf:form action="saveUser" method="post" modelAttribute="user" >
 <input name="name" placeholder="name" id="name">
 <input name="surname" placeholder="surname" id="surname">
 <input name="email" type="email" placeholder="email" id="email">
 <input name="phoneNumber" placeholder="phoneNumber" id="phoneNumber">
	<button>sign up</button>


</sf:form> 

</body>
</html>