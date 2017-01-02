<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<link rel="stylesheet" href="${request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="/SpringShop/js/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
@import url(http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
@import url(https://fonts.googleapis.com/css?family=Oswald:300,400);
.snip1492 {
  font-family: 'Oswald', Arial, sans-serif;
  position: relative;
  float: left;
  margin: 10px 1%;
  min-width: 230px;
  max-width: 315px;
  width: 100%;
  background: #ffffff;
  text-align: center;
  color: #000000;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
  font-size: 16px;
}

.snip1492 * {
  -webkit-box-sizing: border-box;
  box-sizing: padding-box;
  -webkit-transition: all 0.2s ease-out;
  transition: all 0.2s ease-out;
}

.snip1492 img {
  max-width: 100%;
  vertical-align: top;
  position: relative;
  background-color: #666666;
  padding-top: 40px;
}

.snip1492 figcaption {
  padding: 20px;
}

.snip1492 h3,
.snip1492 p {
  margin: 0;
}

.snip1492 h3 {
  font-size: 1.3em;
  font-weight: 400;
  margin-bottom: 5px;
  text-transform: uppercase;
}

.snip1492 p {
  font-size: 0.9em;
  letter-spacing: 1px;
  font-weight: 300;
}

.snip1492 .price {
  font-weight: 500;
  font-size: 1.4em;
  line-height: 48px;
  letter-spacing: 1px;
}

.snip1492 .price s {
  margin-right: 5px;
  opacity: 0.5;
  font-size: 0.9em;
}

.snip1492 i {
  position: absolute;
  top: 0;
  left: 50%;
  -webkit-transform: translate(-50%, 0%);
  transform: translate(-50%, 0%);
  width: 56px;
  line-height: 56px;
  text-align: center;
  border-radius: 50%;
  background-color: #666666;
  color: #ffffff;
  font-size: 36px;
}

.snip1492 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1;
}

.snip1492:hover i,
.snip1492.hover i,
.snip1492:hover img,
.snip1492.hover img {
  background-color: #2980b9;
}

.snip1492:hover i,
.snip1492.hover i {
  -webkit-transform: translate(-50%, 5px);
  transform: translate(-50%, 5px);
}


/* Demo purposes only */


/* filter */
.sidebar {
  float: left;
  text-transform: capitalize;
}
.sidebar h3 {
  margin-bottom: 0px;
}
.sidebar ul {
  margin-top: 3px;
  margin-bottom: 0;
}
.sidebar .sortoptions {
  list-style: none;
  padding-left: 0px;
}

.product {
  max-width: 110px;
  height: 70px;
  margin: 20px;
  padding: 20px;
  text-align: center;
  background-color: #eee;
}

/* filter */

/* this declares a better box model */
* { -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box; }



.list-wrap label {
  float:left;
  color:#00BDE8;
}
.search-box {
  float:left;
  clear:left;
  width:70%;
  padding:0.4em;
  font-size:1em;
  color:#555;
}

.list-count {
  float:left;
  text-align:center;
  width:30%;
  padding:0.5em;
  color:#ddd;
}



li {
  transition-property: margin, background-color, border-color;
  transition-duration: .4s, .2s, .2s;
  transition-timing-function: ease-in-out, ease, ease;
}

.empty-item {
  transition-property: opacity;
  transition-duration: 0s;
  transition-delay: 0s;
  transition-timing-function: ease;
}

.empty .empty-item {
  transition-property: opacity;
  transition-duration: .2s;
  transition-delay: .3s;
  transition-timing-function: ease;
}

.hiding {
  margin-left:-100%;
  opacity:0.5;
}

.hidden {
  display:none;
}

ul {
  float:left;
  width:100%;
  margin:2em 0;
  padding:0;
  position:relative;
}

ul:before {
  content:'desserts';
  position:absolute;
  left:-2.8em;
  font-size:3em;
  text-align:right;
  top:1.5em;
  color:#ededed;
  font-weight:bold;
  font-family: 'Maven Pro', sans-serif;
  transform:rotate(-90deg);
}


.empty-item {
  background:#fff;
  color:#ddd;
  margin:0.2em 0;
  padding:0.5em 0.8em;
  font-style:italic;
  border:none;
  text-align:center;
  visibility:hidden;
  opacity:0;
  float:left;
  clear:left;
  width:100%;
}

.empty .empty-item {
  opacity:1;
  visibility:visible;
}
li{
list-style: none;
}


/*
The following are styles purely for the surroundings
*/
/*header  */
body {
  background:#34495e;
  font-family:'Roboto', sans-serif;
}
.logotipe{
	
	margin:0px;
	height:40px;
	width: 170px;
	color:white;
	box-shadow: 0 0 5px rgba(0,0,0,1);
	background-color: black;
	background: linear-gradient(45deg,#1E69FF,#B9D7FF);
	text-align: center;
	border-box: content-box;
	font-size: 20px;
	padding:5xp;
	clear:left ;
	float:left;
}
#menu-nav {
	background:#34495e;
  float:left;
  width:100%; height:auto;
  margin:0;
  background-color:#ecf0f1;
  border-radius:4px;
  overflow:hidden;
  box-shadow:0 0 5px rgba(0,0,0,0.3);
}

/* navigation bar */
#navigation-bar {
  background:#34495e;
  width:100%;
}
  
#navigation-bar ul {
    margin:0; padding:0;
    list-style:none;
    width:100%;
    border-radius:4px;
    overflow:hidden;
}
  
#navigation-bar li {
    float:left;
    padding:0; margin:0;
    width:20%;
}
  
#navigation-bar a {
    color:#848484;
    font-size:20px; 
    text-decoration:none; text-align:center;
    width:100%;
    padding:20px 0;
    display:block; position:relative;
    transition: all 0.3s ease;
}

#navigation-bar a:hover {color:#e74c3c;}
/*  #navigation-bar li:first-child a {border-radius:4px 0 0 4px;}
#navigation-bar li:last-child a {border-radius:0 4px 4px 0;}  */
#navigation-bar a:before {
  content:'';
  transition:all .4s ease-in-out;
  position:absolute; right:50%; left:50%; bottom:0;
  display:block;
  height:2px;
  background-color:#e74c3c;
} 
#navigation-bar li:hover a:before, #navigation-bar a:hover:before {right:0; left:0;}
#navigation-bar span {display:block;}

/* search bar */
#search-bar {display:none; width:100%; border-bottom:3px solid #e74c3c; border-radius:4px;}
form {width:90%; margin:10px auto;}
input#search-text {
  width:90%; padding:10px 5%; margin:0;
  text-align:center; outline:none;
  border-radius:4px; border:1px solid #e74c3c;
  font:normal 300 18px 'Roboto',sans-serif; color:#888;
  transition:box-shadow 0.5s ease;
}
input#search-text:focus, input#searchfld:active {
  box-shadow:0 0 10px #e74c3c;
}

/* header */
a { 
    text-decoration: none; 
   }
</style>
</head>
<body>
<link href='http://fonts.googleapis.com/css?family=Open+Sans|Maven+Pro:500' rel='stylesheet' type='text/css'>
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
      <li class='menu-sub-nav'><a href='userSign'><i class='fa fa-book'></i><span>Contact</span></a></li>
      <li class='menu-sub-nav' id='searchbox'><a href='#'><i class='fa fa-search'></i><span>Search</span></a></li>
    </ul>
  </div>
  <div id='search-bar'>
    <form action='nothing'>
      <input type='text' name='search' placeholder='Enter your query and hit enter' id="search-text" placeholder="search" class="search-box"/>
    </form>
  </div>
</div>
</div>
<div class="deco topdeco">

 <section class="list-wrap">

  <!-- <input type="text" id="search-text" placeholder="search" class="search-box"> -->
    <span class="list-count"></span>
    
   
<ul id="list" >
  <c:forEach items="${category}" var="commodity">
  <li class="in">
<figure class="snip1492" style="float:left; box-sizing: content-box; width:315px; height:520px;" class="in">
  <img src="${commodity.pathImage}" alt="sample85" />
  <figcaption>
    <h3>${commodity.name}</h3>
    <p>${commodity.model }</p>
    <%-- <p>${commodity.pathImage }</p> --%>
    <div class="price">
      $ ${commodity.price} 
        <sec:authorize access="hasRole('ROLE_USER')" > 
<a href="buyCommodity/${commodity.id}" style="color:black;">Buy</a>
  </sec:authorize>
    </div>
  </figcaption>
  <sec:authorize access="hasRole('ROLE_USER')" > 
  <a href="buyCommodity/${commodity.id}" style="color:black;"></a>
  </sec:authorize>
</figure>
  </li>
</c:forEach>
  <span class="empty-item">no results</span>
</ul>
   </section>
   
<!-- <div class="wrap" style="height:200px;">
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
      <li class='menu-sub-nav'><a href='userSign'><i class='fa fa-book'></i><span>Contact</span></a></li>
      <li class='menu-sub-nav' id='searchbox'><a href='#'><i class='fa fa-search'></i><span>Search</span></a></li>
    </ul>
  </div>
  <div id='search-bar'>
    <form action='nothing'>
      <input type='text' name='search' id='searchfld' placeholder='Enter your query and hit enter'/>
    </form>
  </div>
</div>
</div> -->
<div class="all"></div>

<%-- <div class="container_commodity" style="padding:3%;">
<c:forEach items="${category}" var="commodity">
<figure class="snip1492" style="float:left; box-sizing: content-box; width:315px; height:520px;">
  <img src="${commodity.pathImage}" alt="sample85" />
  <figcaption>
    <h3>${commodity.name}</h3>
    <p>${commodity.model }</p>
    <p>${commodity.pathImage }</p>
    <div class="price">
      $ ${commodity.price} 
<a href="buyCommodity/${commodity.id}" style="color:black;">Buy</a>
    </div>
  </figcaption>
  <a href="buyCommodity/${commodity.id}" style="color:black;"></a>
</figure>
</c:forEach>
</div> --%>

<script>
/* Demo purposes only */
$(".hover").mouseleave(
  function() {
    $(this).removeClass("hover");
  }
);

     
/* document.getElementById('searchfld').oninput =(function(){
	 var search  =  $('searchfld').val();
		$.ajax({
			url: 'search?' + $('input[name = csrf_name]').val() + '=' + $('input[name = csrf_value]').val(),
				contentType :'application/json ; charSet=UTF-8',
				method : 'POST',
				dataType : 'json',
				data: search ,
				 success : function(res) {

 					 var allsearch = document.createElement('div');
 					 allsearch.id = 'all';
 					var all = '';
 						
 					for (var i = 0; i < res.length; i++) {
						all+='<figure class="snip1492">'+
						  +'<img src="'+res[i].pathImage+'" alt="sample85" />'+
							  '<figcaption><h3>'+res[i].name+'</h3><p>'+res[i].model+'</p><div class="price">'+
							      '$'+ res[i]commodity.price} +
							'<a href="buyCommodity/${commodity.id}" style="color:black;">Buy</a></div></figcaption><a href="buyCommodity/${commodity.id}" style="color:black;"></a></figure>'
					}
 					
 					document.getElementById('all').innerHTML = all;
				 }
	
	
	
});
}); */

$(document).ready(function() {

	  var jobCount = $('#list .in').length;
	  $('.list-count').text(jobCount + ' items');
	    
	  
	  $("#search-text").keyup(function () {
	     //$(this).addClass('hidden');
	  
	    var searchTerm = $("#search-text").val();
	    var listItem = $('#list').children('li');
	  
	    
	    var searchSplit = searchTerm.replace(/ /g, "'):containsi('")
	    
	      //extends :contains to be case insensitive
	  $.extend($.expr[':'], {
	  'containsi': function(elem, i, match, array)
	  {
	    return (elem.textContent || elem.innerText || '').toLowerCase()
	    .indexOf((match[3] || "").toLowerCase()) >= 0;
	  }
	});
	    
	    
	    $("#list li").not(":containsi('" + searchSplit + "')").each(function(e)   {
	      $(this).addClass('hiding out').removeClass('in');
	      setTimeout(function() {
	          $('.out').addClass('hidden');
	        }, 300);
	    });
	    
	    $("#list li:containsi('" + searchSplit + "')").each(function(e) {
	      $(this).removeClass('hidden out').addClass('in');
	      setTimeout(function() {
	          $('.in').removeClass('hiding');
	        }, 1);
	    });
	    
	  
	      var jobCount = $('#list .in').length;
	    $('.list-count').text(jobCount + ' items');
	    
	    //shows empty state text when no jobs found
	    if(jobCount == '0') {
	      $('#list').addClass('empty');
	    }
	    else {
	      $('#list').removeClass('empty');
	    }
	    
	  });

	  
	                  
	     /*  
	     An extra! This function implements
	     jQuery autocomplete in the searchbox.
	     Uncomment to use :)
	     
	     
	 function searchList() {                
	    //array of list items
	    var listArray = [];
	  
	     $("#list li").each(function() {
	    var listText = $(this).text().trim();
	      listArray.push(listText);
	    });
	    
	    $('#search-text').autocomplete({
	        source: listArray
	    });
	    
	    
	  }
	                                   
	  searchList();
	*/
	  
	                    
	});
	
	$(function() {
		  hideandshow($("#searchbox"),$("#search-bar"),300);
		});

		function hideandshow(e,n,a) {
		  var c=!1;
		  e.click(function(e) {
		    c?n.slideUp(a):n.slideDown(a);
		    c=!c;
		    e.preventDefault();
		  })
		}
</script>


<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script  src="/js/categorycommodity.js"></script>

</body>
</html>