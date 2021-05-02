<%@page import="kosta.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

  <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>MEOSINNA - MYPAGE</title>
	<link rel="icon" href="img/bannerLogo.png" type="image/png">
  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="vendors/linericon/style.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="css/style.css">
</head>
<style>

a { text-decoration:none }


</style>

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
	<section class="section-margin--small mb-5">
    <div class="container">
      <div class="row">
      <div class="col-xl-3 col-lg-4 col-md-5">

	<!-- ================ category section start ================= -->		  
  <%@ include file="myPageMenuBar.jsp" %>
        

	<c:if test="${sessionScope.member ne null}">
    <hr style="margin: 0 100px; background-color: #BBBBFF;">
    <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>고객님에게 어울리는 상품</p>
          <h2>RECOMMENDED
            <span class="section-intro__style">PRODUCT</span>
          </h2>
        </div>
        <div class="row">
        <c:choose>
	        <c:when test="${fn:length(recGoodsList) ne 0}">
		        <c:forEach items="${requestScope.recGoodsList}" var="goods" begin="1" end="8">
		          <div class="col-md-6 col-lg-4 col-xl-3">
		            <div class="card text-center card-product">
		              <div class="card-product__img">
		                <img class="card-img img-size" src="${goods.img}" alt="" style="width: 250px; height: 200px">
		                <ul class="card-product__imgOverlay">
		                  <li><button onclick="location.href='single-product.jsp?gdCode=${goods.gdCode}'"><i class="ti-search"></i></button></li>
		                  <li><button><i class="ti-shopping-cart"></i></button></li>
		                  <a class="icon_btn" id="like-button"><i class="lnr lnr lnr-heart"></i></a>
									<span id="like-total">${goods.gdLike}</span>         
		                </ul>
		              </div>
		              <div class="card-body">
		                <p>${goods.brand}</p>
		                <h4 class="card-product__title"><a href="single-product.jsp?gdCode=${goods.gdCode}">${goods.gdName}</a></h4>
		                <p class="card-product__price">₩${goods.price}</p>
		              </div>
		            </div>
		          </div>
		          </c:forEach>
		       </c:when>
			       <c:otherwise>
			       	<h2 style="margin: 150px auto;">좋아요 목록을 만들어주시면 추천해드립니다!</h2>
			       </c:otherwise>
	       </c:choose>
        </div>
    </section>
    </c:if>

  <!--================ Start footer Area  =================-->	
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
  <script type="text/javascript"></script>
  <script>
  

  
  
  
  </script>
  
</body>
</html>