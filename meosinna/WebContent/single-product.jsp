<%@page import="kosta.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>MEOSINNA - Product Details</title>
<link rel="icon" href="img/bannerLogo.png" type="image/png">
<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet" href="vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="css/style.css">



<style>
#rate{
float:left;
margin:3px 2px;
position: absolute;
 left: 650px;
top: 230px;
}

#addreview{
width: 300px;
float: left;
margin: 3px 2px;
position: relative;
left: 170px;
top: 30px;

}

.review_list{
float:left;
margin: 3px 2px;
position: relative;
left: 120px;
top: 40px;
}

.review_item{
float:left;
margin: 3px 2px;
position: relative;
left: 10px;
top: 60px;
border:1px solid rgba(220, 220, 220, .6);
width: 600px
}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		let curLike = '${requestScope.like}';
		let total = Number('${goods.gdLike}');
		
		let loading = "<img src='img/bean.gif' style='width: 40px'>";
		
		$(document).on('click', '#like-button',function() {
			let str = '';
			console.log(curLike);
			$("#likey").html(loading);
			$.ajax({
				url : '${pageContext.request.contextPath}/likeServlet',
				method : 'get',
				data : {
					gdCode : '${goods.gdCode}',
					isLike: curLike
				},
				success : function(value) {
					console.log(value);
					if(value === "1") {
						total += 1;
						str += "<a class='icon_btn' id='like-button'><i class='fas fa-heart' style='color: red'></i></a>";
						str += "<span id='like-total'>" + total + "<span>";
						$("#likey").html(str);
					} else {
						total -= 1;
						str += "<a class='icon_btn' id='like-button'><i class='lnr lnr lnr-heart'></i></a>";
						str += "<span id='like-total'>" + total + "<span>";
						$("#likey").html(str);
					}
					curLike = value;
				},
				fail : function() {
					console.log(item);
				}
			});
		});
		
		$("select[name=size]").on('change', function() {
			let str = '';
			$(".current:eq(1)").html("선택");
			str += '<option class="option" value="basic">선택</option>';
			for(let i = 0; i < $(this).val() && i < 5; i++) {
				str += '<option class="option" value=' + (i+1) + '>' + (i+1) + '</option>';
			}
			$(".list:eq(2)").html(str);
		});
		
		$("input[type=submit]").on('click', function() {
			let qty = $(".current:eq(1)").html();
			let size = $(".current:eq(0)").html();
			if(size == "선택") {
				alert("사이즈를 선택해주세요");
				return false;
			} else if(qty == "선택") {
				alert("수량 선택해주세요");
				return false;
			}
			$("form").attr("action",  "front?key=cart&methodName=addToCart&gdCode=${goods.gdCode}&size=" + size + "&qty=" + qty);
		});
	});
</script>
</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<%@ include file="header.jsp" %>
	<!--================ End Header Menu Area =================-->

	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shop Single</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Shop
								Single</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->


	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item">
							<img class="img-fluid" src="${goods.img}" alt="">
						</div>
						<!-- <div class="single-prd-item">
							<img class="img-fluid" src="img/category/s-p1.jpg" alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid" src="img/category/s-p1.jpg" alt="">
						</div> -->
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>${goods.gdName}</h3>
						<h2>${goods.price}</h2>
						<ul class="list">
							<li><a class="active" href="#"><span>Category</span> :
									Household</a></li>
							<li><a href="#"><span>Availibility</span> : In Stock</a></li>
						</ul>
						<p>${goods.gdContent}</p>
						<div class="card_area d-flex align-items-center" id="likey">
							<c:choose>
								<c:when test="${requestScope.like eq '0'}">
									<a class="icon_btn" id="like-button"><i class="lnr lnr lnr-heart"></i></a>
									<span id="like-total">${goods.gdLike}</span>
								</c:when>
								<c:otherwise>
									<a class="icon_btn" id="like-button"><i class="fas fa-heart" style="color: red"></i></a>
									<span id="like-total">${goods.gdLike}</span>
								</c:otherwise>
							</c:choose>
						</div>
					  <form action=""  method="post" >
						<fieldset style = "width:500" > 
									<div>사이즈: </div><select name="size" size="8">
										<option value="선택" selected="selected">선택</option>
										<c:forEach items="${requestScope.goodsInfo}" var="info">
											<option value="${info.value}">${info.key}</option>
										</c:forEach>
									</select><br><br>
								<div>수량: </div>
								<select name="qty" size="5" id="qty">
									<%-- <c:forEach begin="1" end="5"> --%>
										<option value="basic" selected="selected">선택</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									<%-- </c:forEach> --%>
								</select>
								<br>
								<p><input class="button primary-btn" type="submit" value ="Add To Cart"></p>
								
								</form>
								</div>
								</div>
								</div>
								</div>
								</div>
								<script>
									function dp_menu() {
										let click = document
												.getElementById("drop-content");
										if (click.style.display === "none") {
											click.style.display = "block";

										} else {
											click.style.display = "none";
										}
									}
								</script>
</body>


</div>
</div>
</div>
</div>
<!--================End Single Product Area =================-->

<!--================Product Description Area =================-->
<section class="product_description_area">
	<div class="container" id="review_container">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link" id="home-tab"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
				aria-selected="true">Description</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
				aria-selected="false">Specification</a></li>
			<li class="nav-item"><a class="nav-link" id="contact-tab"
				data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
				aria-selected="false">Comments</a></li>
			<li class="nav-item"><a class="nav-link active" id="review-tab"
				data-toggle="tab" href="#review" role="tab" aria-controls="review"
				aria-selected="false">Reviews</a></li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade" id="home" role="tabpanel"
				aria-labelledby="home-tab">
		안녕하세요, 머신나에요! <br> 
만나뵙게 되어 정말 반갑습니다.  저희 머신나는 여러분들께 선물같은 존재가 되기 위해 탄생했습니다. <br> 
상품을 고르는 순간, 배송을 기다리는 순간 모두 선물을 고르는 시간과 같지 않나요?  <br> 
고객님의 이 소중한 시간들을 위해 저희는 멋있는, 인기있는 상품을 많은 고객님께 보이도록 노력하고 있습니다. <br> 
 또한 합리적인 가격, 빠른 배송에 힘쓰고 있습니다. 앞으로도 오래 만나요 우리! <br> 
<p><p>
Hello, this is MEOSINNA!<br> 
It's so nice to meet you.We were created to be like gifts to you. <br> 
Isn't it the same moment to choose a gift when you choose a product and wait for delivery? <br> 
For your precious time, we are trying to make our best to recommend popular and nice products to our customers.  <br> 
Also, we are trying to recommend reasonably priced products and deliver them quickly. <br> 
Thanks for your all support and love. 
<p>

您好。 我们是 MEOSINNA!<br> 
很高兴见到您们。我们生来就是给你感觉送好像礼物的。选择商品等待配送，不正是选择礼物的时候吗？<br> 
为了您的宝贵时间，我们竭尽所能向客户推荐受欢迎、好的产品。同时，我们也在努力推荐价格合理的产品，并尽快交货。<br> 
希望我们能在一起很久。谢谢。
<p>
			</div>
			<div class="tab-pane fade" id="profile" role="tabpanel"
				aria-labelledby="profile-tab">
				<div class="table-responsive">
					<table class="table">
						<tbody>
							<tr>
								<td>
									<h5>Width</h5>
								</td>
								<td>
									<h5>128mm</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Height</h5>
								</td>
								<td>
									<h5>508mm</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Depth</h5>
								</td>
								<td>
									<h5>85mm</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Weight</h5>
								</td>
								<td>
									<h5>52gm</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Quality checking</h5>
								</td>
								<td>
									<h5>yes</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Freshness Duration</h5>
								</td>
								<td>
									<h5>03days</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>When packeting</h5>
								</td>
								<td>
									<h5>Without touch of hand</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Each Box contains</h5>
								</td>
								<td>
									<h5>60pcs</h5>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane fade" id="contact" role="tabpanel"
				aria-labelledby="contact-tab">
				<div class="row">
					<div class="col-lg-8">
						<div class="comment_list">
							<c:forEach items="${gqList}" var="gq">
							<div class="review_item">
								<div class="media">
									
									<div class="media-body">
										<h4>${gq.mbName}</h4>
										<h5>${gq.rgDate}</h5>
										<h6>${gq.reply}</h6>
										<a class="reply_btn" name="reply_btn" href="#">Reply</a>
									</div>

								</div>
								<p>${gq.gqContent}</p>
							</div>
							</c:forEach>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="review_box">
							<h4>Post a Question</h4>
							<form class="row contact_form" action="contact_process.php"
								method="post" id="gq-form" novalidate="novalidate">
								<input type="hidden" name="gdCode" value="${param.gdCode}"/>
								<div class="col-md-12">
									<div class="form-group">
										<textarea class="form-control" name="message" id="message"
											rows="1" placeholder="Message"></textarea>
									</div>
								</div>
								<div class="col-md-12 text-right">
									<button type="button" id="gq-submit" value="submit" class="btn primary-btn">Submit
										Now</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane fade show active" id="review" role="tabpanel"
				aria-labelledby="review-tab">
				<div class="row">
						<div class="row total_rate">
							<div class="review_list" id="review_list">
								<c:forEach items="${reviewList}" var="review">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="${review.img}" alt="">
										</div>
										<div class="media-body">
											<h4 style="padding: 5px">제목 : ${review.title}</h4>
											<h4 style="padding: 5px">작성자 : ${review.mbName}</h4>
											<p style="color: gray">${review.gdName}</p>
											<c:forEach var="i" begin="1" end="${review.grade}">
												<i class="fa fa-star"></i>
											</c:forEach>
											<c:forEach var="i" begin="${review.grade}" end="4">
												<i class="far fa-star"></i>
											</c:forEach>
											
										</div>
									</div>
									<p style="padding: 10px 20px">${review.content}</p>

								</div>
								<p><p><p>
								</c:forEach>
							
						</div><br><p>
						<div class="row-lg-9" >
							<div class="review_box" id=addreview>
								<h4>Add a Review</h4>
								<p>Your Rating:</p>
								<ul class="list">
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
								</ul>
								<p>Outstanding</p>
                <form id="review-form" method="post" class="form-contact form-review mt-3">
                   <input type="hidden" name="gdCode" value="${param.gdCode}"/>
                <div class="form-group">
                    <input class="form-control" name="grade" type="text" placeholder="Enter your grade" required>
                  </div>
                  <div class="form-group">
                    <input class="form-control" name="size" type="text" placeholder="Enter your size" required>
                  </div>
                  <div class="form-group">
                    <input class="form-control" name="img" type="text" placeholder="Enter your img" required>
                  </div>
                  <div class="form-group">
                    <input class="form-control" name="title" type="text" placeholder="Enter Title">
                  </div>
                  <div class="form-group">
                    <textarea class="form-control different-control w-100" name="content" id="textarea" cols="30" rows="5" placeholder="Enter Message"></textarea>
                  </div>
                  <div class="form-group text-center text-md-right mt-3">
                    <button type="button" id="review-submit" class="button button--active button-review">Submit Now</button>
                  </div>
                </form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--================End Product Description Area =================-->



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
  <script type="text/javascript">
  	$(function() {
		$("#review-submit").click(function() {
			
			$.ajax({
				url: "${pageContext.request.contextPath}/insertReview",
				type: "post",
				dataType: "text",
				data: $("#review-form").serialize(),
				success: function(result) {
					alert(result);
					location.reload();
				},
				error: function(err) {
					alert(err + " :  오류 발생...");
				}
			})
		})
		
		$("#gq-submit").click(function() {
			$.ajax({
				url: "${pageContext.request.contextPath}/insertGQ",
				type: "post",
				dataType: "text",
				data: $("#gq-form").serialize(),
				success: function(result) {
					alert(result);
					location.reload();
				},
				error: function(err) {
					alert(err + " :  오류 발생...");
				}
			})
		})
		
		$(".reply_btn").click(function() {
			var mbName = "<%=(String)session.getAttribute("mbName")%>";
			if(mbName != "admin"){
				alert("권한이 없습니다.");
			}else{
				alert("권한 있어요");
			}
		})
	})
  </script>

</body>
</html>