<%@page import="kosta.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Product Details</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet" href="vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">


<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		let curLike = '${requestScope.like}';
		$("#like-button").click(function() {
			console.log(curLike);
			$.ajax({
				url : 'dbGet.jsp',
				method : 'post',
				data : {
					gdCode : '${goods.gdCode}',
					isLike:  '0'
				},
				success : function(value) {
					if(value === "1") {
						$("#like-total").html(  Number($("#like-total").html()) + 1  );
					} else {
						$("#like-total").html(  Number($("#like-total").html()) - 1  );
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
			$(".current:eq(0)").html("선택");
			str += '<option class="option" value="basic">선택</option>';
			for(let i = 0; i < $(this).val() && i < 5; i++) {
				str += '<option class="option" value=' + (i+1) + '>' + (i+1) + '</option>';
			}
			$(".list:eq(1)").html(str);
		});
		
		$("input[type=submit]").on('click', function() {
			let qty = $(".current:eq(0)").html();
			let size = $(".current:eq(1)").html();
			if(qty == "선택") {
				alert("수량 선택해주세요");
				return false;
			} else if(size == "선택") {
				alert("사이즈를 선택해주세요");
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
	<div class="container">
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
				<p>Beryl Cook is one of Britain’s most talented and amusing
					artists .Beryl’s pictures feature women of all shapes and sizes
					enjoying themselves .Born between the two world wars, Beryl Cook
					eventually left Kendrick School in Reading at the age of 15, where
					she went to secretarial school and then into an insurance office.
					After moving to London and then Hampton, she eventually married her
					next door neighbour from Reading, John Cook. He was an officer in
					the Merchant Navy and after he left the sea in 1956, they bought a
					pub for a year before John took a job in Southern Rhodesia with a
					motor company. Beryl bought their young son a box of watercolours,
					and when showing him how to use it, she decided that she herself
					quite enjoyed painting. John subsequently bought her a child’s
					painting set for her birthday and it was with this that she
					produced her first significant work, a half-length portrait of a
					dark-skinned lady with a vacant expression and large drooping
					breasts. It was aptly named ‘Hangover’ by Beryl’s husband and</p>
				<p>It is often frustrating to attempt to plan meals that are
					designed for one. Despite this fact, we are seeing more and more
					recipe books and Internet websites that are dedicated to the act of
					cooking for one. Divorce and the death of spouses or grown children
					leaving for college are all reasons that someone accustomed to
					cooking for more than one would suddenly need to learn how to
					adjust all the cooking practices utilized before into a streamlined
					plan of cooking that is more efficient for one person creating less</p>
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
					<div class="col-lg-6">
						<div class="comment_list">
							<div class="review_item">
								<div class="media">
									<div class="d-flex">
										<img src="img/product/review-1.png" alt="">
									</div>
									<div class="media-body">
										<h4>Blake Ruiz</h4>
										<h5>12th Feb, 2018 at 05:56 pm</h5>
										<a class="reply_btn" href="#">Reply</a>
									</div>

								</div>
								<p>디자인이 깔끔하고 예뻐서 구매했습니다. 어떤 룩에도 잘어울려서 활용성도 좋고 착화감도 너무 좋아서
									만족하고 착용 중입니다! 좋은 상품을 합리적인 가격에 구매할 수 있어서 만족합니다~~ 다음번에도 콜라보 신발은
									머신나로 구매하러 올게요 !!!</p>
							</div>
							<div class="review_item reply">
								<div class="media">
									<div class="d-flex">
										<img src="img/product/review-2.png" alt="">
									</div>
									<div class="media-body">
										<h4>Blake Ruiz</h4>
										<h5>12th Feb, 2018 at 05:56 pm</h5>
										<a class="reply_btn" href="#">Reply</a>
									</div>
								</div>
								<p>친구들이 신발 보고 다들 잘샀다고 하네요. 저희 아버지께서 머신나라는 이름 들으시고 계속 아재개그를
									하시네요 하하 덕분에 즐거운 시간도 생겼고 머시나는 신발도 생겼네요~</p>
							</div>
							<div class="review_item">
								<div class="media">
									<div class="d-flex">
										<img src="img/product/review-3.png" alt="">
									</div>
									<div class="media-body">
										<h4>王大陆</h4>
										<h5>12th Feb, 2021 at 05:56 pm</h5>
										<a class="reply_btn" href="#">Reply</a>

									</div>
								</div>
								<p>天啊！ 这一双鞋怎么这么让我满意呀～！ 我所有的朋友都称我的漂亮鞋子。 所以我建议他们在这儿上购买它～
									希望您的生意蒸蒸日上!</p>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="review_box">
							<h4>Post a comment</h4>
							<form class="row contact_form" action="contact_process.php"
								method="post" id="contactForm" novalidate="novalidate">
								<div class="col-md-12">
									<div class="form-group">
										<input type="text" class="form-control" id="name" name="name"
											placeholder="Your Full name">
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="email" class="form-control" id="email"
											name="email" placeholder="Email Address">
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="text" class="form-control" id="number"
											name="number" placeholder="Phone Number">
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<textarea class="form-control" name="message" id="message"
											rows="1" placeholder="Message"></textarea>
									</div>

								</div>
								<div class="col-md-12 text-right">
									<button type="submit" value="submit" class="btn primary-btn">Submit
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
					<div class="col-lg-6">
						<div class="row total_rate">
							<div class="col-6">
								<div class="box_total">
									<h5>Overall</h5>
									<h4>4.0</h4>
									<h6>(03 Reviews)</h6>
								</div>
							</div>
							<div class="col-6">
								<div class="rating_list">
									<h3>Based on 3 Reviews</h3>
									<ul class="list">
										<li><a href="#">5 Star <i class="fa fa-star"></i><i
												class="fa fa-star"></i><i class="fa fa-star"></i><i
												class="fa fa-star"></i><i class="fa fa-star"></i> 01
										</a></li>
										<li><a href="#">4 Star <i class="fa fa-star"></i><i
												class="fa fa-star"></i><i class="fa fa-star"></i><i
												class="fa fa-star"></i><i class="fa fa-star"></i> 01
										</a></li>
										<li><a href="#">3 Star <i class="fa fa-star"></i><i
												class="fa fa-star"></i><i class="fa fa-star"></i><i
												class="fa fa-star"></i><i class="fa fa-star"></i> 01
										</a></li>
										<li><a href="#">2 Star <i class="fa fa-star"></i><i
												class="fa fa-star"></i><i class="fa fa-star"></i><i
												class="fa fa-star"></i><i class="fa fa-star"></i> 01
										</a></li>
										<li><a href="#">1 Star <i class="fa fa-star"></i><i
												class="fa fa-star"></i><i class="fa fa-star"></i><i
												class="fa fa-star"></i><i class="fa fa-star"></i> 01
										</a></li>
									</ul>
								</div>
							</div>
							<div class="review_list" id="review_list">
								<c:forEach items="${reviewList}" var="review">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="${review.img}" alt="">
										</div>
										<div class="media-body">
											<h4>${review.mbName}</h4>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
									</div>
									<p>${review.content}</p>

								</div>
								</c:forEach>
							
							</div>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
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

<!--================ Start related Product area =================-->
<section class="related-product-area section-margin--small mt-0">
	<div class="container">
		<div class="section-intro pb-60px">
			<p>Popular Item in the market</p>
			<h2>
				Top <span class="section-intro__style">Product</span>
			</h2>
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
<!--================ end related Product area =================-->

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
	})
  </script>

</body>
</html>