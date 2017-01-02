<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/newCommodity.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="backsignUp">back</a>
<a href="backhome">home page</a>
<h1>NEW COMMODITY</h1>


<input name ="name" type="text" id="idName">
<input name = "model" type="text" id ="idModel">
<input name = "price" type="number"  step="0.01" id ="idPrice">
  <select  id="idMaker">
<c:forEach items="${makers}" var="maker">
	<option value="${maker.id}"> ${maker.name}<option>
</c:forEach>
</select> 
  <select  id="idCategories">
	<c:forEach items="${categories}" var="category">
		<option value="${category.id}"> ${category.name } </option>
	</c:forEach>
</select>  

<button   id="save"> Save </button>


<input type="hidden" name="csrf_name" value="${_csrf.parameterName}">
<input type="hidden" name="csrf_value" value="${_csrf.token}">				
<h1>ALL COMMODITY</h1>
	<table>
		<thead>
		  <tr>
		  	<th><h3>Name  </h3></th>
		  	<th><h3>Model  </h3></th>
		  	<th><h3>Price  </h3></th>
		  	
		  </tr>
		</thead>
		<tbody style="margin:0px;padding: 0px">
	<c:forEach var="commodity" items="${commodities}">
			<tr style="margin:5px">
				<td style="margin:5px"><h3 style="float:left"> ${commodity.name}  </h3></td>
				<td><h3 style="float:left">${commodity.model}   </h3></td>
				<td><h3 style="float:left">${commodity.price}   </h3></td>
				<td><a href="deletecommodity/${commodity.id}">delete</a></td>
			</tr>
	</c:forEach>

		</tbody>
	</table>


<script src="js/commodity.js"></script>


</body>
</html>