<%@page import="kosta.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Contact</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet"
	href="vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<!-- 정희 추가 -->
<link rel="stylesheet" href="vendors/nice-select/nice-select.css">

<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<%@ include file="header.jsp"%>
	<!--================ End Header Menu Area =================-->


	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="contact">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Contact Us</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Contact
								Us</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->

	<!-- ================ contact section start ================= -->
	<section class="section-margin--small">
		<!-- <div class="container">
      <div class="d-none d-sm-block mb-5 pb-4">
        <div id="map" style="height: 420px;"></div>
        <script>
          function initMap() {
            var uluru = {lat: -25.363, lng: 131.044};
            var grayStyles = [
              {
                featureType: "all",
                stylers: [
                  { saturation: -90 },
                  { lightness: 50 }
                ]
              },
              {elementType: 'labels.text.fill', stylers: [{color: '#A3A3A3'}]}
            ];
            var map = new google.maps.Map(document.getElementById('map'), {
              center: {lat: -31.197, lng: 150.744},
              zoom: 9,
              styles: grayStyles,
              scrollwheel:  false
            });
          }
          
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&callback=initMap"></script>
        
      </div>
 -->

		<div class="row">
			<div class="col-md-4 col-lg-3 mb-4 mb-md-0">
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-home"></i></span>
					<div class="media-body">
						<h3>California United States</h3>
						<p>Santa monica bullevard</p>
					</div>
				</div>
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-headphone"></i></span>
					<div class="media-body">
						<h3>
							<a href="tel:454545654">00 (440) 9865 562</a>
						</h3>
						<p>Mon to Fri 9am to 6pm</p>
					</div>
				</div>
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-email"></i></span>
					<div class="media-body">
						<h3>
							<a href="mailto:support@colorlib.com">support@colorlib.com</a>
						</h3>
						<p>Send us your query anytime!</p>
					</div>
				</div>
			</div>
			<%-- <c:choose><!-- c태그 choose추가 -->
	<c:when test="${empty member}"><!-- c태그 when추가 --> --%>
			<div class="col-md-8 col-lg-9">
				<form
					action="${pageContext.request.contextPath}/front?key=member&methodName=contact"
					class="form-contact contact_form" method="post" id="contactForm"
					novalidate="novalidate">
					<div class="row">
						<div class="col-lg-5">
							<div class="form-group">
								<input class="form-control" name="name" id="name" type="text"
									placeholder="Enter your name" value="${member.mbName}">
							</div>
							<div class="form-group">
								<input class="form-control" name="email" id="email" type="email"
									placeholder="Enter email address" value="${member.email}">
							</div>
							<div class="form-group">
								<input class="form-control" name="phone" id="phone" type="text"
									placeholder="Enter your phone number" value="${member.tel}">
							</div>
						</div>
						<!-- class="col-lg-5" -->
					</div>
					<!-- class="row" -->

					<select name="orderIndexs" id="orderIndexs">
						<option data-display="주문내역 조회">주문내역 없음</option>
						<c:forEach items="${member.orderIndex}" var="orderIndexes">
							<option value="${orderIndexes.odCode}">${orderIndexes}</option>
						</c:forEach>
						
					</select> <select name="contactType" id="orderIndexs">
						<option data-display="문의유형">문의유형</option>
						<option value="교환">교환</option>
						<option value="환불">환불</option>
						<option value="취소">취소</option>
					</select>

					<div class="form-group">
						<%-- 	<c:otherwise><!-- c태그 otherwise추가 -->
                	</c:otherwise><!-- c태그 otherwise추가 --> --%>
						<input class="form-control" name="subject" id="subject"
							type="text" placeholder="Enter Subject">
					</div>
					<!-- </div> -->
					<div class="col-lg-7">
						<div class="form-group">
							<textarea class="form-control different-control w-100"
								name="message" id="message" cols="30" rows="5"
								placeholder="Enter Message"></textarea>
						</div>
					</div>
					<!--    </div> -->
					<div class="form-group text-center text-md-right mt-3">
						<button type="submit"
							class="button button--active button-contactForm">Send
							Message</button>
					</div>
				</form>
			</div>
			<%--  </c:when><!-- c태그 when끝 -->
        </c:choose><!-- c태그 choose끝 --> --%>
		</div>
		<!-- </div> -->

	</section>
	<!-- ================ contact section end ================= -->



	<!--================ Start footer Area  =================-->
	<%@ include file="footer.jsp"%>
	<!--================ End footer Area  =================-->



	<script src="vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="vendors/skrollr.min.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="vendors/nice-select/jquery.nice-select.min.js"></script>
<!-- 	<script src="vendors/jquery.form.js"></script> -->
	<script src="vendors/jquery.validate.min.js"></script>
	<script src="vendors/contact.js"></script>
	<script src="vendors/jquery.ajaxchimp.min.js"></script>
	<script src="vendors/mail-script.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript"></script>
	
</body>
</html>