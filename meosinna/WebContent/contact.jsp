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
<title>MEOSINNA - Contact</title>
<link rel="icon" href="img/bannerLogo.png" type="image/png">
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

<style>
.nice-select {
	margin-bottom: 12px;
}


</style>
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
		<div class="row">
			<div class="col-md-5  col-lg-3 mb-4 mb-md-0">
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-home"></i></span>
					<div class="media-body">
						<h3>
							경기도 성남시 분당구 구미동<br>185-3
						</h3>
						<p>하나프라자빌딩</p>
					</div>
				</div>
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-headphone"></i></span>
					<div class="media-body">
						<h3>
							<a href="tel:454545654">01 (051) 457 7899</a>
						</h3>
						<p>주중 오전 9시부터 오후 6시까지</p>
					</div>
				</div>
				<div class="media contact-info">
					<span class="contact-info__icon"><i class="ti-email"></i></span>
					<div class="media-body">
						<h3>
							<a href="mailto:support@colorlib.com">support@meosina.com</a>
						</h3>
						<p>궁금한 게 있으면 바로 물어보세요!</p>
					</div>
				</div>
			</div>

			<div class="col-md-4 col-lg-7">
				<form
					action="${pageContext.request.contextPath}/front?key=member&methodName=contact"
					class="form" method="post" id="contactForm">
					<div class="form-group">
						<input class="form-control" name="name" id="name" type="text"
							required="required" placeholder="Enter your name" value="${member.mbName}">
					</div>
					<div class="form-group">
						<input class="form-control" name="email" id="email" type="email"
							required="required" placeholder="Enter email address" value="${member.email}">
					</div>
					<div class="form-group">
						<input class="form-control" name="phone" id="phone" type="text"
							required="required" placeholder="Enter your phone number"
							value="${member.tel}">
					</div>
					<div class="form-group">
					<select
							class="form-control" name="orderIndexs" id="orderIndexs"
							title="문의하실 주문내역을 선택해주세요.">
							<option value="" data-display="주문내역 조회">주문내역 조회</option>
							<c:forEach items="${member.orderIndex}" var="orderIndex">
								<option value="${orderIndex.odCode}">${orderIndex}</option>
							</c:forEach>
						</select>
						
					</div>
					<div class="form-group">
						<select
							class="form-control" name="contactType" id="orderIndexs"
							required>
							<option data-display="문의유형" value=0>문의유형</option>
							<option value="교환">교환</option>
							<option value="환불">환불</option>
							<option value="취소">취소</option>
						</select>
						
					</div>
						<div class="form-group">
							<input class="form-control" name="subject" id="subject"
								type="text" placeholder="Enter Subject" required="required">

						</div>
						<div class="form-group">
							<textarea class="form-control different-control w-100"
								name="message" id="message" cols="30" rows="5"
								placeholder="Enter Message" required="required"></textarea>
						</div>
						<div class="form-group text-center text-md-right mt-3">
							<button type="submit"
								class="button button--active button-contactForm">문의하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
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
	<script src="vendors/jquery.form.js"></script>
	<script src="vendors/jquery.validate.min.js"></script>
	<script src="vendors/contact.js"></script>
	<script src="vendors/jquery.ajaxchimp.min.js"></script>
	<script src="vendors/mail-script.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript"></script>
	<!-- 정희 추가 -->
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script>
		$("#contactForm").validate();
	
	
	</script>


</body>
</html>