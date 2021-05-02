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
  <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- Ensures optimal rendering on mobile devices. -->
<title>MEOSINNA - Checkout</title>
<link rel="icon" href="img/bannerLogo.png" type="image/png">

<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet"
	href="vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
<script>
	paypal.Buttons().render('#paypal-button-container');
	$(function() {
		
		$("#shipping-select").on("change", function() {
			let selected = $("#shipping-select option:selected").val();
			if(selected === "1") {
				$("#rname").val($("#sname").val());
				$("#rtel").val($("#stel").val());
				$("#address").val("${sessionScope.member.addr}");
			} else if (selected === "2") {
				$("#rname").val("");
				$("#rtel").val("");
				$("#address").val("");
			}
		});
		
			$("#payment").on("click", function() {
				/*let formValues = $("[input=text]").val();
				console.log(formValues);
				if(formValues="") {
					alert("필수 입력사항을 입력 후 다시 진행해 주세요 :)");
				}*/
				var state = true;
				$("input[type=text]").each(function(index, element) {
					$(this).css("border-color","#eeeeee").css("background","transparent");
					
					if($(this).val() == "") {
						alert("필수 입력사항을 모두 기재해주세요 :)");
						$(this).focus();
						$(this).css("border-color","red");
						state = false;
						return false;
					}
				});
				if(state) {
					$(this).attr('href', 'front?key=order&methodName=order&req=' + $("#req").val());				
				}
			})
	});
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
					<h1>Product Checkout</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Checkout</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->


	<!--================Checkout Area =================-->
	<section class="checkout_area section-margin--small">
		<div class="container">
			<div class="billing_details">
				<div class="row">
					<div class="col-lg-8">
						<h3>주문자 정보</h3>
						<form class="row contact_form" action="#" method="post"
							novalidate="novalidate">
							<div class="col-md-6 form-group p_star">
								<input type="text" class="form-control" id="sname" name="sname"
									placeholder="Name" value="${sessionScope.member.mbName}"> <span class="placeholder"
									data-placeholder="Name"></span>
							</div>
							<div class="col-md-6 form-group p_star">
								<input type="text" class="form-control" id="stel" name="stel"
									placeholder="Tel" value="${sessionScope.member.tel}"> <span class="placeholder"
									data-placeholder="Tel"></span>
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="email" name="email"
									placeholder="Email" value="${sessionScope.member.email}"> 
							</div>
							<div class="col-md-12 form-group mb-0">
								<div class="creat_account">
									<h3>배송지 정보</h3>
								</div>
							</div>
							<div class="col-md-3 form-group p_star">
								<select class="shipping-select" id="shipping-select">
									<option value="1">주문자와 동일</option>
									<option value="2">새로운 배송지</option>
									<option value="3">최근 배송지</option>
								</select>
							</div>
							<div class="col-md-9 form-group p_star">
								<input class="form-control" style="display: none;">
								<span class="placeholder" data-placeholder="Address"></span>
							</div>
							<div class="col-md-6 form-group p_star">
								<input type="text" class="form-control" id="rname" name="rname"
									placeholder="Name"> <span class="placeholder"
									data-placeholder="Phone number"></span>
							</div>
							<div class="col-md-6 form-group p_star">
								<input type="text" class="form-control" id="rtel" name="rtel"
									placeholder="Tel"> <span class="placeholder"
									data-placeholder="Tel"></span>
							</div>
							<div class="col-md-12 form-group p_star">
								<input type="text" class="form-control" id="address" name="address"
									placeholder="Address"> <span class="placeholder"
									data-placeholder="Address"></span>
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="zip" name="zip"
									placeholder="Postcode/ZIP">
							</div>
							<div class="col-md-12 form-group mb-0">
								<div class="creat_account">
									<h3>Shipping Details</h3>
								</div>
								<textarea class="form-control" name="req" id="req"
									rows="1" placeholder="Order Notes"></textarea>
							</div>
						</form>
					</div>
					<div class="col-lg-4">
						<div class="order_box">
							<h2>Your Order</h2>
							<ul class="list">
								<li><a href="#"><h4>
											Product <span>Price</span>
										</h4></a></li>
										<c:set var = "total" value = "0" />

										<table>
											<c:forEach items="${requestScope.goodsList}" var="cart">
												<tr>
													<td style="width: 200px">${cart.name} x ${cart.qty}</td>
													<td style="padding:5px"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;₩${cart.price}</b></td>
													<c:set var= "total" value="${total + cart.price}"/>
												</tr>
											</c:forEach>
										</table>
								
							</ul>
							<ul class="list list_2">
								<li><a href="#">Total <span>₩<c:out value="${total}"/></span></a></li>
							</ul>
							<div class="payment_item">
							<div class="text-center">

								<a class="button button-paypal" id="payment" style="color:white;">결제하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Checkout Area =================-->



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