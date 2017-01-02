<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/bootstrap.css">
 <!-- <link rel="stylesheet" href="sass_compiled/home.css"> -->
 <link rel="stylesheet" src="css/yerslider.css">
 <script type="text/javascript" src="js/demo.yearslider.js"></script>
<script type="text/javascript" src="js/imagesloaded.js"></script>
<script type="text/javascript" src="js/modernizr.js"></script>
<script type="text/javascript" src="js/jquery.touchSwipe.js"></script>
<script type="text/javascript" src="js/yerslider.min.js"></script>
<script type="text/javascript" src="js/yersslider.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<div class="yerslider yerslider-wrap mysliderclass">
	<div class="yerslider-viewport">
    <div class="yerslider-mask">

		  <ul class="yerslider-slider">
			   <a href="categoryCommodity/1"> 
			  <li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Laptops" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
			  <img alt="" src="images/yerslider/laptop.jpg" class="img_slyder">
				  <div class="yerslider-slide-inner demo-typo">
  				</div>
           <span class="detach"> </span>
  			</li>
			   </a> 
            <a href="categoryCommodity/2"> 
  			<li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Smartphones" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
  			<img alt="" src="images/yerslider/smartphone.jpg">
	  			<div class="yerslider-slide-inner demo-typo">
		  			
			  	</div>
           <span class="detach">2</span>
  			</li>
        	 </a> 
        	 <a href="categoryCommodity/15"> 
  			<li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Tablets" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
  			<img alt="" src="images/yerslider/tablet.png" class="img_slyder">
  				<div class="yerslider-slide-inner demo-typo">
  				</div>
           <span class="detach">3</span>
  			</li>
        	</a>
        	<a href="categoryCommodity/3"> 
	  		<li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Flash Memory" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
	  			<img alt="" src="images/yerslider/Flash memory.jpg" class="img_slyder">
	  			<div class="yerslider-slide-inner demo-typo">
	  			</div>
           <span class="detach">4</span>
	  		</li>
        	</a>
        	<a href="categoryCommodity/19"> 
	  		<li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Headphones" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
  				<img alt="" src="images/yerslider/headphone.jpg" class="img_slyder">
  				<div class="yerslider-slide-inner demo-typo">
	  			</div>
           <span class="detach">5</span>
	  		</li>
	  		</a>
        
	  		<li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Keyboards and Mouses" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
	  			<img alt="" src="images/yerslider/keybord and mouse.jpg" class="img_slyder">
	  			<div class="yerslider-slide-inner demo-typo">
	  			</div>
           <span class="detach">6</span>
	  		</li>
        
	  		<li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Cameras" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
	  			<img alt="" src="images/yerslider/camera.png" class="img_slyder">
	  			<div class="yerslider-slide-inner demo-typo">
	  			</div>
           <span class="detach">7</span>
  			</li>
        
	  		<li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Smart Watches" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
	  			<img alt="" src="images/yerslider/smartwatch.jpg" class="img_slyder">
	  			<div class="yerslider-slide-inner demo-typo">
	  			</div>
           <span class="detach">8</span>
	  		</li>
        
	  		<li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Charges" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
	  			<img alt="" src="images/yerslider/charge.jpg" class="img_slyder">
	  			<div class="yerslider-slide-inner demo-typo">
	  				
	  			</div>
           <span class="detach">9</span>
	  		</li>
        
  		</ul>
      
    </div>
	</div>
</div>

<code class="code" style="height:0px;">
</code>

<div class="container_commodity" style="padding:3%;">
<c:forEach items="${commodities}" var="commodity">
<figure class="snip1492" style="float:left; box-sizing: content-box; width:315px; height:500px;">
  <img src="${commodity.pathImage}" alt="sample85" />
  <figcaption>
    <h3>${commodity.name}</h3>
    <p>${commodity.model }</p>
    <%-- <p>${commodity.pathImage }</p> --%>
    <div class="price">
      $ ${commodity.price} 
<a href="buyCommodity/${commodity.id}" style="color:black;">Buy</a>
    </div>
  </figcaption><i class="ion-plus-round"></i>
  <a href="buyCommodity/${commodity.id}" style="color:black;"></a>
</figure>
</c:forEach>
</div>


	<sec:authorize access="hasAnyRole('ROLE_USER')">
	 </sec:authorize><br/>
<%-- <h1>History Shopping</h1>
 <c:forEach items="${user}" var="user">
	${user.name } ${user.surname } 
	<a href="deleteuser/${user.id}">delete</a> 
	<c:forEach items="${user.commodities}" var="commodity">
	
	${commodity.name }	${commodity.model}
 	<a href="deletefromuser/${commodity.id }/${user.id}">delete shopping</a> 
	</c:forEach>
	<br>
</c:forEach> --%>
<%-- <sec:authorize access="isAuthenticated()">
<c:forEach items="${historyShoping }" var="commodity">
${commodity.name } ${commodity.model } ${commodity.price }<br/>
</c:forEach>
</sec:authorize> --%>


<%-- <table>
	<thead>
		<tr>
			<th>ID</th>
			<th>model</th>
			<th>count</th>
			<th>maker</th>
		</tr>
	
	</thead>
	<tbody>
		<c:forEach items="${commodities}" var="commodity">
			<td>
				<tr>${commodity.id}</tr>
				<tr>${commodity.model}</tr>
				<tr>${commodity.count}</tr>
				<tr>${commodity.id}</tr>
			</td>		
		
		</c:forEach>
	
	</tbody>

</table> --%>

<div class="div"  style="width:200px;height:200px;"></div>

<!--OAuth 2.  ,  pack4j  -->
<script type="text/javascript" src="js/yerslider.min.js"></script>
<script type="text/javascript" src="js/yersslider.js"></script>
<script type="text/javascript" src="js/demo.yearslider.js"></script>
<script  src="js/home.js"></script>
</body>
</html>