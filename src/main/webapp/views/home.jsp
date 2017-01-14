<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/SpringShop/css/home.css">
<link rel="stylesheet" href="/SpringShop/css/bootstrap.css">
 <!-- <link rel="stylesheet" href="sass_compiled/home.css"> -->
 <link rel="stylesheet" src="/SpringShop/css/yerslider.css">
 <script type="text/javascript" src="/SpringShop/js/demo.yearslider.js"></script>
<script type="text/javascript" src="/SpringShop/js/imagesloaded.js"></script>
<script type="text/javascript" src="/SpringShop/js/modernizr.js"></script>
<script type="text/javascript" src="/SpringShop/js/jquery.touchSwipe.js"></script>
<script type="text/javascript" src="/SpringShop/js/yerslider.min.js"></script>
<script type="text/javascript" src="/SpringShop/js/yersslider.js"></script>
<script type="text/javascript" src="/SpringShop/js/jquery.js"></script>
<meta http-equiv="Content-Type" content="/SpringShop/text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div class="yerslider yerslider-wrap mysliderclass">
	<div class="yerslider-viewport">
    <div class="yerslider-mask">

		  <ul class="yerslider-slider">
			   <a href="categoryCommodity/1"> 
			  <li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Laptops" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
			  <img alt="" src="/SpringShop/images/yerslider/laptop.jpg" class="img_slyder">
				  <div class="yerslider-slide-inner demo-typo">
  				</div>
           <span class="detach"> </span>
  			</li>
			   </a> 
            <a href="categoryCommodity/2"> 
  			<li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Smartphones" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
  			<img alt="" src="/SpringShop/images/yerslider/smartphone.jpg">
	  			<div class="yerslider-slide-inner demo-typo">
		  			
			  	</div>
           <span class="detach">2</span>
  			</li>
        	 </a> 
        	 <a href="categoryCommodity/15"> 
  			<li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Tablets" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
  			<img alt="" src="/SpringShop/images/yerslider/tablet.png" class="img_slyder">
  				<div class="yerslider-slide-inner demo-typo">
  				</div>
           <span class="detach">3</span>
  			</li>
        	</a>
        	<a href="categoryCommodity/3"> 
	  		<li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Flash Memory" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
	  			<img alt="" src="/SpringShop/images/yerslider/Flash memory.jpg" class="img_slyder">
	  			<div class="yerslider-slide-inner demo-typo">
	  			</div>
           <span class="detach">4</span>
	  		</li>
        	</a>
        	<a href="categoryCommodity/19"> 
	  		<li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Headphones" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
  				<img alt="" src="/SpringShop/images/yerslider/headphone.jpg" class="img_slyder">
  				<div class="yerslider-slide-inner demo-typo">
	  			</div>
           <span class="detach">5</span>
	  		</li>
	  		</a>
        
	  		<li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Keyboards and Mouses" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
	  			<img alt="" src="/SpringShop/images/yerslider/keybord and mouse.jpg" class="img_slyder">
	  			<div class="yerslider-slide-inner demo-typo">
	  			</div>
           <span class="detach">6</span>
	  		</li>
        
	  		<li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Cameras" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
	  			<img alt="" src="/SpringShop/images/yerslider/camera.png" class="img_slyder">
	  			<div class="yerslider-slide-inner demo-typo">
	  			</div>
           <span class="detach">7</span>
  			</li>
        
	  		<li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Smart Watches" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
	  			<img alt="" src="/SpringShop/images/yerslider/smartwatch.jpg" class="img_slyder">
	  			<div class="yerslider-slide-inner demo-typo">
	  			</div>
           <span class="detach">8</span>
	  		</li>
        
	  		<li class="yerslider-slide" data-thumb-template-key="1" data-thumb-text="Charges" style="box-sizing:content-box; overflow: hidden; height:0px; background-color: white;">
	  			<img alt="" src="/SpringShop/images/yerslider/charge.jpg" class="img_slyder">
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
<c:forEach items="${commodities.content}" var="commodity">
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
<div style="float:left; width:100%; margin-left:200px;margin-top:50px;">
<c:set var="currentPage" value="${commodities.number}"></c:set>
<c:set var="totalPage" value="${totalPages -1}"></c:set>

<c:if test="${currentPage != 0}">
<a href="/SpringShop/pageable/${commodities.number-1}/15">previous</a>
</c:if>

<c:forTokens var="page" items="${pages }" delims="-">
<a href="/SpringShop/pageable/${page}/15">${page}</a>
</c:forTokens>

<c:if test="${currentPage < totalPage}">
<a href="/SpringShop/pageable/${commodities.number+1}/15">next</a>
</c:if>
</div>

	<sec:authorize access="hasAnyRole('ROLE_USER')">
	 </sec:authorize><br/>

<div class="div"  style="width:200px;height:200px;"></div>

<script type="text/javascript" src="/SpringShop/js/yerslider.min.js"></script>
<script type="text/javascript" src="/SpringShop/js/yersslider.js"></script>
<script type="text/javascript" src="/SpringShop/js/demo.yearslider.js"></script>
<script  src="/SpringShop/js/home.js"></script>
</body>
</html>