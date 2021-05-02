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
  <title>MEOSINNA - QA</title>
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
<section class="section-margin--small mb-5">
    <div class="container">
      <div class="row">
      <div class="col-xl-3 col-lg-4 col-md-5">
 <%@ include file="myPageMenuBar.jsp" %>
	<!-- ================ category section start ================= -->		  
  <section class="section-margin--small mb-5">
    <div class="container">

      <p class="text-center billing-alert">Thank you ${sessionScope.member.mbName}.상품문의 리스트입니다.</p>
      <div class="row mb-5">
        
            <h3 class="billing-title">상품문의내역</h3>
            <hr>
            <table class="gq-list" border="1">
              <tr>
                <td>상품명</td>
                <td>작성내용</td>
                 <td>작성일</td>
                 <td>답변상태</td>
              </tr>
               <c:forEach items="${gqList}" var="gq">
              <tr>
                <td> ${gq.goods.gdName} </td>
                <td> ${gq.gqContent} </td>
                <td>${gq.rgDate} </td>
                <td> ${gq.reply}</td>
              </tr>
              </c:forEach>
            </table>
         
      </div>
    </div>
  </section>
	<!-- ================ category section end ================= -->		  

	
</div>
      </div>
    </div>
  </section>

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