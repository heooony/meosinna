<%@page import="kosta.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <style type="text/css">
  td{
	padding-top: 20px;
	padding-bottom: 20px;
	}
	th{
	padding-right: 100px;
	padding-top: 20px;
	padding-bottom: 20px;
	}
	.info{
		padding: 10px;
	}
  </style>
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
					<h1>마이페이지</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="personalInfo.jsp">${member.mbName}</a></li>
              <li class="breadcrumb-item active" aria-current="page">님 환영합니다.</li>
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
          
          <%@ include file="myPageMenuBar.jsp" %>
          <!-- End Filter Bar -->
          <!-- start likelist -->
          <section class="lattest-product-area pb-40 category-list">
          <div class="row">
          <c:forEach items="${list}" var="likes">

              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                  	
                      <c:choose>
    					<c:when test="${likes.goods.price eq '799000'}">
                    		<img class="card-img" src="${likes.goods.img}" alt="" style="width: 240px; height: 200px; opacity:  0.2">
                    	</c:when>
                    	<c:otherwise>
                    		<img class="card-img" src="${likes.goods.img}" alt="" style="width: 240px; height: 200px;">
                    		<ul class="card-product__imgOverlay">
                      		<li><button><i class="ti-search"></i></button></li>
                    		<li><button><i class="ti-shopping-cart"></i></button></li>
                      		<li><button><i class="ti-heart"></i></button></li>
                    		</ul>
  						  </c:otherwise>
					</c:choose>
                  </div>
                  <div class="card-body">
                    <p>Accessories</p>
                    <c:choose>
    					<c:when test="${likes.goods.price eq '799000'}">
    					      <h4 class="card-product__title">${likes.goods.gdName}</h4>
                    	</c:when>
                    	<c:otherwise>
                    		<h4 class="card-product__title"><a href="${pageContext.request.contextPath}/single-product.jsp?gdCode=${likes.goods.gdCode}">${likes.goods.gdName}</a></h4>
  						  </c:otherwise>
					</c:choose>
                    <p class="card-product__price">₩${likes.goods.price}</p>
                    <p class="card-product__likes_num">${likes.goods.gdLike}</p>
                  </div>
                </div>
              </div>
          </c:forEach>
              </div>
          </section>
        </div>
        
      </div>
    </div>
  </section>
	<!-- ================ category section end ================= -->		  

	

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
</body>
</html>