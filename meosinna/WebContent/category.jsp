<%@page import="kosta.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Category</title>
  <link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
  <link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="vendors/linericon/style.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">
  <link rel="stylesheet" href="css/style.css">
 
  
<style>
@import url("https:/fonts.googleapis.com/css?family=Roboto:400,300");

body {
	color: #2c3e50;
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
}

h1 {
	text-align: center;
	font-size: 2.5rem;
	font-weight: 300;
}

.pagination-container {
	margin: 35px auto;
	text-align: center;
	margin-left: 850px;
}

.pagination {
	position: relative;
	text-align: center;
	
}

.pagination a {
	position: relative;
	display: inline-block;
	color: #2c3e50;
	text-decoration: none;
	font-size: 1.2rem;
	padding: 8px 16px 10px;
}

.pagination a:before {
	z-index: -1;
	position: absolute;
	height: 100%;
	width: 100%;
	content: "";
	top: 0;
	left: 0;
	background-color: #2c3e50;
	border-radius: 24px;
	-webkit-transform: scale(0);
	transform: scale(0);
	transition: all 0.2s;
}

.pagination a:hover, .pagination a .pagination-active {
	color: #fff;
}

.pagination a:hover:before, .pagination a .pagination-active:before {
	-webkit-transform: scale(1);
	transform: scale(1);
}

.pagination .pagination-active {
	color: #fff;
}

.pagination .pagination-active:before {
	-webkit-transform: scale(1);
	transform: scale(1);
}

.pagination-newer {
	margin-right: 50px;
}

.pagination-older {
	margin-left: 50px;
}

#min{
float:left;
margin:3px 2px;
position: absolute;
 left: 60px;
        top: 380px;
}

#max{
float:left;
margin:3px 2px;
position: absolute;
left: 150px;
top: 380px;
}

#search{
  float: none !important; display: inline-block; 
 }
 #search{
 vertical-align: top !important;
 text-align: center;
 margin:3px 2px;
 background-color: #B4B4FF;
 position: absolute;
 left: 110px;
 top: 440px;
 }

 #space{
 position: absolute;
 left: 140px;
 top: 390px;
 }
 
 
 
</style>


<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function() {
    $(".pixel-radio").click(function(){
 	   let ra = $(this).attr("id")
 	   $("#brand").val(ra)
 	   $("#brandForm").submit();
  })
  
	$("[name=choice]").change(function(){
		//alert($(this).val())
		if($(this).val()=="0"){
			return;
		}
		
		  $.ajax({
	   			 url:"priceAlign" , // 서버요청주소  
	   			 type: "get", //method방식 = 전송방식(get, post, put, delete)
	   			 dataType: "json", //서버가 응답해주는 데이터의 타입(html, text, xml, json 중의 한개)
	   			 data: {align : $(this).val() } ,  //서버에게 보낼 parameter정보
	   			 success : function(arr){
	   			   // alert(result)
	   			   var str="";
	   			 
	   			   str+="<div class='row'>";
	               $.each(arr, function(index, obj) {
	            	   	  
	            	   	  str+="<div class='col-md-6 col-lg-4'>";
	                   	  str+="<div class='card text-center card-product'>";
	                  
	                      str+="<div class='card-product__img'>";
	                      str+="<img class='card-img' src='"+obj.img+"' alt='' style='width: 240px; height: 200px;'>";
	                      str+="<ul class='card-product__imgOverlay'>";
	                      str+="<li><button><i class='ti-search'></i></button></li>";
	                      str+="<li><button><i class='ti-shopping-cart'></i></button></li>";
	                      str+="<a class='icon_btn' id='like-button'><i class='lnr lnr lnr-heart'></i></a>";
	                      str+="<span id='like-total'>"+obj.gdLike+"</span>";                          
	                      str+="</ul>";
	                      str+="</div>";
	                  
	                      str+="<div class='card-body'>";
	                      str+="<p>Accessories</p>";
	                      str+="<h4 class='card-product__title'><a href='${pageContext.request.contextPath}/single-product.jsp?gdCode="+obj.gdCode+"'>"+obj.gdName+"</a></h4>";
	                      str+="<p class='card-product__price'>"+obj.price+"</p>";
	                      str+="</div>";
	                       
	                      str+="</div>";
	                      str+="</div>";    	
	   			    })
	   			    
	   			    str+="</div>";
	   			    $("#categoryList").html(str);
	   			    
	   			 } , //성공했을때 함수
	   			 error: function(err){
	   				 alert(err+"발생했어요^^")
	   			 } //오류발생했을때 함수 
	   			 
	   		 });//ajax끝
	})
	  
})
</script>


</head>
<body>

  <!--================ Start Header Menu Area =================-->
	<%@ include file="header.jsp" %>
	<!--================ End Header Menu Area =================-->

	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shop Category</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Shop Category</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->


	<!-- ================ category section start ================= -->		  
  <section class="section-margin--small mb-5">
    <div class="container">
      <div class="row">
        <div class="col-xl-3 col-lg-4 col-md-5">
         
          <div class="sidebar-filter">
            <div class="top-filter-head">Brands</div>
            <div class="common-filter">
              <div class="head"></div>
              
              <form action="${pageContext.request.contextPath}/front" id="brandForm" method="post"> 
                 <input type="hidden" name="brand" value="" id="brand">
                 <input type="hidden" name="key" value="goods">
                 <input type="hidden" name="methodName" value="selectByBrand">
                 
                 
              </form>
                <ul>
                  <br><li class="filter-list"><input class="pixel-radio" type="radio" id="Nike X Sacai" name="brand"><label for="Nike X Sacai">Nike X Sacai<span)></span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="Nike X Peaceminusone" name="brand"><label for="Nike X Peaceminusone">Nike X Peaceminusone<span></span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="Adidas X Yeezy Boos" name="brand"><label for="Adidas X Yeezy Boos">Adidas X Yeezy Boost<span></span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="Nike X Off White The" name="brand"><label for="Nike X Off White The">Nike X Off White The<span></span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="Nike X Travis Scott" name="brand"><label for="Nike X Travis Scott">Nike X Travis Scott<span></span></label></li><br>
                </ul>
              
              <div class="top-filter-head">Price</div>
              <br>
                   <form id="price-form"  method="post" >
								<div id="min"> <select name="min" >
									<option value="선택" selected="selected">선택</option>
									<option value="100000">100,000</option>
									<option value="500000">500,000</option>
									<option value="1000000">1,000,000</option>
									<option value="1500000">1,500,000</option>
								
								</select> 
										</div>
										
										<div id="space">~</div>
								<div id="max">
									 <select name="max" >
										<option value="선택" selected="selected">선택</option>
										<option value="500000">500,000</option>
										<option value="1000000">1,000,000</option>
										<option value="1500000">1,500,000</option>
										<option value="2000000">2,000,000</option>
									
									</select>
						
								</div>
								<br><br><div id="search"><input type="button"  id="price-btn"value ="search"></div>
								
								</form>
         							   <p><p><p><p><p><p><p><p><p><p><p><p><p><p><br>
            </div>
         
             
           
    
          </div>
        </div>
    
        <div class="col-xl-9 col-lg-8 col-md-7">
          <!-- Start Filter Bar -->
          <div class="filter-bar d-flex flex-wrap align-items-center">
            <div class="sorting">
              <select name="choice">
                <option value="0">--정렬 선택--</option>
                <option value="1">낮은 가격순</option>
                <option value="2">높은 가격순</option>
              </select>
            </div>
            <div>
              <div class="input-group filter-bar-search">
                <input type="text" placeholder="Search">
                <div class="input-group-append">
                  <button type="button"><i class="ti-search"></i></button>
                </div>
              </div>
            </div>
          </div>
          <!-- End Filter Bar -->

          <!-- Start Best Seller -->
          <section id = "categoryList" class="lattest-product-area pb-40 category-list">
          <div class="row"> 
          <c:forEach items="${requestScope.list}" var="goods">

              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                  	
                      <c:choose>
    					<c:when test="${goods.price eq '799000'}">
                    		<img class="card-img" src="${goods.img}" alt="" style="width: 240px; height: 200px; opacity:  0.2">
                    	</c:when>
                    	<c:otherwise>
                    		<img class="card-img" src="${goods.img}" alt="" style="width: 240px; height: 200px;">
                    		<ul class="card-product__imgOverlay">
                      		<li><button><i class="ti-search"></i></button></li>
                    		<li><button><i class="ti-shopping-cart"></i></button></li>
  							<a class="icon_btn" id="like-button"><i class="lnr lnr lnr-heart"></i></a>
							<span id="like-total">${goods.gdLike}</span>                    		
							</ul>

  						  </c:otherwise>
					</c:choose>
                  </div>
                  <div class="card-body">
                    <p style="color: gray">${goods.brand}</p>
                    <c:choose>
    					<c:when test="${goods.price eq '799000'}">
    					      <h4 class="card-product__title">${goods.gdName}</h4>
                    	</c:when>
                    	<c:otherwise>
                    		<h4 class="card-product__title"><a href="${pageContext.request.contextPath}/single-product.jsp?gdCode=${goods.gdCode}">${goods.gdName}</a></h4>
  						  </c:otherwise>
					</c:choose>
                    <p class="card-product__price">${goods.price}</p>
                  </div>
                </div>
              </div>
          </c:forEach>
              </div>
          </section>
          <!-- End Best Seller -->
        </div>
      </div>
    </div>
  </section>
  
  <!-- ================ paging start ================= -->
  <jsp:useBean class="kosta.dto.PageCnt" id="p"/>

	<nav class="pagination-container">
		<div class="pagination">
			<a class="pagination-newer" href="${path}/front?key=goods&methodName=selectAll&pageNo=${pageNo>1?pageNo-1:1}">PREV</a> 
				<span class="pagination-inner"> 
				<c:forEach var='i' begin='1' end='${p.pageCnt}'>
				  <a class="${i==pageNo?'pagination-active':page}" href="${path}/meosinna/front?key=goods&methodName=selectAll&pageNo=${i}">${i}</a> 
				</c:forEach>
				</span> 
			<a class="pagination-older" href="${path}/meosinna/front?key=goods&methodName=selectAll&pageNo=${pageNo<pageCnt?pageNo+1:pageCnt}">NEXT</a>
		</div>
	</nav> 
	<jsp:include page="footer.jsp"/>
	
	 <!-- ================ paging end ================= -->
	 
	<!-- ================ category section end ================= -->		  

	<!-- ================ top product area start ================= -->	
	<section class="related-product-area">
		<div class="container">
			<div class="section-intro pb-60px">
        <p>Popular Item in the market</p>
        <h2>Top <span class="section-intro__style">Product</span></h2>
      </div>
			<div class="row mt-30">
        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-1.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-2.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-3.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-4.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-5.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-6.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-7.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-8.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-9.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-1.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-2.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-3.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>
      </div>
		</div>
	</section>
	<!-- ================ top product area end ================= -->		

	<!-- ================ Subscribe section start ================= -->		  
  <section class="subscribe-position">
    <div class="container">
      <div class="subscribe text-center">
        <h3 class="subscribe__title">Get Update From Anywhere</h3>
        <p>Bearing Void gathering light light his eavening unto dont afraid</p>
        <div id="mc_embed_signup">
          <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="subscribe-form form-inline mt-5 pt-1">
            <div class="form-group ml-sm-auto">
              <input class="form-control mb-1" type="email" name="EMAIL" placeholder="Enter your email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email Address '" >
              <div class="info"></div>
            </div>
            <button class="button button-subscribe mr-auto mb-1" type="submit">Subscribe Now</button>
            <div style="position: absolute; left: -5000px;">
              <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
            </div>

          </form>
        </div>
        
      </div>
    </div>
  </section>
	<!-- ================ Subscribe section end ================= -->		  


  <!--================ Start footer Area  =================-->	
	<%@ include file="footer.jsp" %>
	<!--================ End footer Area  =================-->



  <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="vendors/skrollr.min.js"></script>
  <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="vendors/nouislider/nouislider.min.js"></script>
  <script src="vendors/jquery.ajaxchimp.min.js"></script>
  <script src="vendors/mail-script.js"></script>
  <script src="js/main.js"></script>
  
  <script type="text/javascript">
  	$(function () {
		$("#price-btn").click(function () {
		    	$.ajax({
				url: "${pageContext.request.contextPath}/front?key=goods&methodName=selectByPrice",
				type: "post",
				dataType: "text",
				data: $("#price-form").serialize(),
				success: function(result) {
					$("#categoryList").html(
					          <c:forEach items="${requestScope.range}" var="goods">
					          
					              <div class="col-md-6 col-lg-4">
					                <div class="card text-center card-product">
					                  <div class="card-product__img">
					                  	
					                      <c:choose>
					    					<c:when test="${goods.price eq '799000'}">
					                    		<img class="card-img" src="${goods.img}" alt="" style="width: 240px; height: 200px; opacity:  0.2">
					                    	</c:when>
					                    	<c:otherwise>
					                    		<img class="card-img" src="${goods.img}" alt="" style="width: 240px; height: 200px;">
					                    		<ul class="card-product__imgOverlay">
					                      		<li><button><i class="ti-search"></i></button></li>
					                    		<li><button><i class="ti-shopping-cart"></i></button></li>
					  							<a class="icon_btn" id="like-button"><i class="lnr lnr lnr-heart"></i></a>
												<span id="like-total">${goods.gdLike}</span>                    		
												</ul>
					  						  </c:otherwise>
										</c:choose>
					                  </div>
					                  <div class="card-body">
					                    <p>Accessories</p>
					                    <c:choose>
					    					<c:when test="${goods.price eq '799000'}">
					    					      <h4 class="card-product__title">${goods.gdName}</h4>
					                    	</c:when>
					                    	<c:otherwise>
					                    		<h4 class="card-product__title"><a href="${pageContext.request.contextPath}/single-product.jsp?gdCode=${goods.gdCode}">${goods.gdName}</a></h4>
					  						  </c:otherwise>
										</c:choose>
					                    <p class="card-product__price">${goods.price}</p>
					                  </div>
					                </div>
					              </div>
					          </c:forEach>
							)
					location.reload();
				},
				error: function(err) {
					alert(err + " :  오류 발생...");
				}
			})
		})
	})
  </script>
</body>
</html>