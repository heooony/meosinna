<%@page import="kosta.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>MEOSINNA - Home</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
  <link rel="stylesheet" href="vendors/linericon/style.css">
	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="css/style.css">
</head>
<body>

  <!--================ Start Header Menu Area =================-->

	 <%@ include file="header.jsp" %>
	<!--================ End Header Menu Area =================-->
  <main class="site-main">
    
    <!--================ Hero banner start =================-->

    <section class="hero-banner">
      <div class="container">
        <div class="row no-gutters align-items-center pt-60px">
          <div class="col-5 d-none d-sm-block" >
            <div class="hero-banner__img">
              <img class="img-fluid" src="img/sh3.webp" alt="">
            </div>
          </div>
          <div class="col-sm-7 col-lg-6 offset-lg-1 pl-4 pl-md-5 pl-lg-0">
            <div class="hero-banner__content">
              <h4>MEOSINNA</h4>
              <h1>당신의 가치, 우리의 노력</h1>
              <p>'머신나'는 사람들의 대한 이해관계로 상품을 제작합니다. 우리 곁에 항상 있었던 머신나와 함께 고객의 색으로 만들어 가는 상품을 살펴보세요.</p>
              <a class="button button-hero" href="${pageContext.request.contextPath}/category.jsp">상품 둘러보기</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <!-- ================ trending product section start ================= -->  
    <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>당신의 가치</p>
          <h2>PRODUCT'S
            <span class="section-intro__style">DETAILS</span>
            <a href="${pageContext.request.contextPath}/category.jsp" class="more-items">더 알아보기 ></a>
          </h2>
        </div>
        <div class="row">
        <c:forEach items="${requestScope.goodsList}" var="goods" begin="1" end="8">
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
        </div>
    </section>
    <!-- ================ trending product section end ================= --> 
    <!--================ Hero banner start =================-->
    <!--================ Hero Carousel start =================-->
    <section class="section-margin mt-0" style="padding-top: 100px">
      <div class="owl-carousel owl-theme hero-carousel">
        <div class="hero-carousel__slide">
          <img src="img/member.jpg" alt="" class="img-fluid" style="weight:336;height:230; opacity: 0.8">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>We</h3>
            <p>Member Team</p>
            <p>김정희, 최정남</p>
          </a>
        </div>
        <div class="hero-carousel__slide">
          <img src="img/goods.jpg" alt="" class="img-fluid" style="weight:336;height:230; opacity: 0.8">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>Are</h3>
            <p>Goods Team</p>
            <p>배은진, 황보현</p>
          </a>
        </div>
        <div class="hero-carousel__slide">
          <img src="img/order.jpg" alt="" class="img-fluid" style="weight:336;height:230; opacity: 0.8">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>MEOSINNA</h3>
            <p>Order Team</p>
            <p>김동헌, 이승현</p>
          </a>
        </div>
      </div>
    </section>
    <!--================ Hero Carousel end =================--> 
    <!-- ================ offer section start ================= --> 
    <section class="offer" id="parallax-1" data-anchor-target="#parallax-1" data-300-top="background-position: 20px 30px" data-top-bottom="background-position: 0 20px">
      <div class="container">
        <div class="row">
          <div class="col-xl-5">
            <div class="offer__content text-center">
              <h3>Up To 50% Off</h3>
              <h4>시간 한정 상품</h4>
              <p>고객님들과 함께 어울리기 위한 상품들이 기다리고 있습니다. 시간 한정으로 나온 특가 상품을 알아보세요!</p>
              <a class="button button--active mt-3 mt-xl-4" href="#" style="background-color: palevioletred; border: none">특가 상품 알아보기</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- ================ offer section end ================= --> 
    <!-- ================ Best Selling item  carousel ================= -->
    <!-- ================ Best Selling item  carousel end ================= -->
    
    
    
  </main>
  <!--================ Start footer Area  =================-->	
	<%@ include file="footer.jsp" %>
	<!--================ End footer Area  =================-->
  <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="vendors/skrollr.min.js"></script>
  <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="vendors/jquery.ajaxchimp.min.js"></script>
  <script src="vendors/mail-script.js"></script>
  <script src="js/main.js"></script>
</body>
</html>