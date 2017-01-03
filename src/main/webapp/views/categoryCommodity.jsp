<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<link rel="stylesheet" href="/SpringShop/css/bootstrap.css">
<link rel="stylesheet" href="/SpringShop/css/categoryCommodity.css">
<script type="text/javascript" src="/SpringShop/js/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
      <li class='menu-sub-nav'><a href='userSign'><i class='fa fa-book'></i><span>Sign In | Sign Up</span></a></li>
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