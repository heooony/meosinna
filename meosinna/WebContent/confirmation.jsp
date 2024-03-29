<%@page import="kosta.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>MEOSINNA Shop</title>
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
<body>
  <!--================ Start Header Menu Area =================-->
	<%@ include file="header.jsp" %>
	<!--================ End Header Menu Area =================-->
  
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Order Confirmation</h1>
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
  
  <!--================Order Details Area =================-->
  <section class="order_details section-margin--small">
    <div class="container">
      <p class="text-center billing-alert">Thank you ${sessionScope.member.mbName}. Your order has been received.</p>
      <div class="row mb-5">
        <div class="col-md-6 col-xl-4 mb-4 mb-xl-0">
          <div class="confirmation-card">
            <h3 class="billing-title">Order Info</h3>
            <table class="order-rable">
              <tr>
                <td>Order number</td>
                <td> ${requestScope.orderDetail.odCode} </td>
              </tr>
              <tr>
                <td>Date</td>
                <td style="font-size: 0.83rem; font-weight: none;">${requestScope.orderDetail.odDate} </td>
              </tr>
              <tr>
                <td>Total</td>
                <td> ${requestScope.orderDetail.pay}￦</td>
              </tr>
              <tr>
                <td>State</td>
                <td> ${requestScope.orderDetail.state}</td>
              </tr>
            </table>
          </div>
        </div>
        <div class="col-md-6 col-xl-4 mb-4 mb-xl-0">
          <div class="confirmation-card">
            <h3 class="billing-title">Product Info</h3>
            <table class="order-rable">
              <tr>
                <td>Code</td>
                <td> ${requestScope.orderDetail.gdCode}</td>
              </tr>
              <tr>
                <td>Name</td>
                <td>${requestScope.orderDetail.gdName}</td>
              </tr>
              <tr>
                <td>Size</td>
                <td style="color:#384AEB"> ${requestScope.orderDetail.size}</td>
              </tr>
              <tr>
                <td>Amount</td>
                <td> ${requestScope.orderDetail.qty}</td>
              </tr>
            </table>
          </div>
        </div>
        <div class="col-md-6 col-xl-4 mb-4 mb-xl-0">
          <div class="confirmation-card">
            <h3 class="billing-title">Shipping Address</h3>
            <table class="order-rable">
              <tr>
                <td>Address</td>
                <td>${requestScope.orderDetail.addr}</td>
              </tr>
              <tr>
                <td>Name</td>
                <td> ${requestScope.orderDetail.mbName}</td>
              </tr>
              <tr>
                <td>Phone</td>
                <td> ${requestScope.orderDetail.tel}</td>
              </tr>
              <tr>
                <td>Request</td>
                <td>${requestScope.orderDetail.req}</td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--================End Order Details Area =================-->



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