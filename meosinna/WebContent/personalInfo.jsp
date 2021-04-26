<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  </style>
</head>
<body>
  <!--================ Start Header Menu Area =================-->
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="index.jsp"><img src="img/logo3.png" alt="" width="100px"></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Shop</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="category.html">Shop Category</a></li>
                  <li class="nav-item"><a class="nav-link" href="single-product.html">Product Details</a></li>
                  <li class="nav-item"><a class="nav-link" href="checkout.html">Product Checkout</a></li>
                  <li class="nav-item"><a class="nav-link" href="confirmation.html">Confirmation</a></li>
                  <li class="nav-item"><a class="nav-link" href="cart.html">Shopping Cart</a></li>
                </ul>
							</li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Blog</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
                  <li class="nav-item"><a class="nav-link" href="single-blog.html">Blog Details</a></li>
                </ul>
							</li>
							<li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">멤버</a>
                <ul class="dropdown-menu">
                  <%if(session.getAttribute("member") == null){ %>
                  <li class="nav-item"><a class="nav-link" href="login.jsp">로그인</a></li>
                  <li class="nav-item"><a class="nav-link" href="register.jsp">회원가입</a></li>
                  <li class="nav-item"><a class="nav-link" href="tracking-order.html">고객센터</a></li>
                  <%}else{ %>
                  <li class="nav-item"><a class="nav-link" href="personalInfo.jsp">마이페이지</a></li>
                  <li class="nav-item"><a class="nav-link" href="cart.jsp">장바구니</a></li>
                  <li class="nav-item"><a class="nav-link" href="like.jsp">좋아요</a></li>
                  <li class="nav-item"><a class="nav-link" href="tracking-order.html">주문배송조회</a></li>
                  <li class="nav-item"><a class="nav-link" href="tracking-order.html">고객센터</a></li>
                  <%} %>
                </ul>
              <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
            </ul>

            <ul class="nav-shop">
              <li class="nav-item"><button><i class="ti-search"></i></button></li>
              <li class="nav-item"><button onclick="location.href='cart.jsp' "><i class="ti-shopping-cart"></i><span class="nav-shop__circle">3</span></button> </li>
              <%if(session.getAttribute("member") == null) {%>
              
              <li class="nav-item"><a class="button button-header" href="${pageContext.request.contextPath}/login.jsp">Buy Now</a></li>
              <%}else{ %>
              <li class="nav-item"><a class="like" href="${pageContext.request.contextPath}/like.jsp">좋아요</a></li>
              <li class="nav-item"><a class="like" href="${pageContext.request.contextPath}/myPage.jsp">${dbMember.mbName}</a>님</li>
              <li class="nav-item"><a class="button button-header" href="${pageContext.request.contextPath}/front?key=member&methodName=logout">logout</a></li>
              <%} %>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </header>
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
          <div class="sidebar-categories">
            <div class="head">Browse Categories</div>
            <ul class="main-categories">
              <li class="common-filter">
                <form action="#">
                  <ul>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="men" name="brand"><label for="men">Men<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="women" name="brand"><label for="women">Women<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="accessories" name="brand"><label for="accessories">Accessories<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="footwear" name="brand"><label for="footwear">Footwear<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="bayItem" name="brand"><label for="bayItem">Bay item<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="electronics" name="brand"><label for="electronics">Electronics<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="food" name="brand"><label for="food">Food<span> (3600)</span></label></li>
                  </ul>
                </form>
              </li>
            </ul>
          </div>
          <div class="sidebar-filter">
            <div class="top-filter-head">Product Filters</div>
            <div class="common-filter">
              <div class="head">Brands</div>
              <form action="#">
                <ul>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="brand"><label for="apple">Apple<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="asus" name="brand"><label for="asus">Asus<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="gionee" name="brand"><label for="gionee">Gionee<span>(19)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="micromax" name="brand"><label for="micromax">Micromax<span>(19)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="samsung" name="brand"><label for="samsung">Samsung<span>(19)</span></label></li>
                </ul>
              </form>
            </div>
            <div class="common-filter">
              <div class="head">Color</div>
              <form action="#">
                <ul>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="black" name="color"><label for="black">Black<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="balckleather" name="color"><label for="balckleather">Black
                      Leather<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="blackred" name="color"><label for="blackred">Black
                      with red<span>(19)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="gold" name="color"><label for="gold">Gold<span>(19)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="spacegrey" name="color"><label for="spacegrey">Spacegrey<span>(19)</span></label></li>
                </ul>
              </form>
            </div>
            <div class="common-filter">
              <div class="head">Price</div>
              <div class="price-range-area">
                <div id="price-range"></div>
                <div class="value-wrapper d-flex">
                  <div class="price">Price:</div>
                  <span>$</span>
                  <div id="lower-value"></div>
                  <div class="to">to</div>
                  <span>$</span>
                  <div id="upper-value"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="col-xl-9 col-lg-8 col-md-7">
          <header class="first-info-view-area"><span>기본회원정보</span>
          &nbsp;<input type="button" value="수정"  id="ps-info-modify-btn">
          </header><hr>
          <section class="mypage">
          <form class="ps-info-form" id="ps-info-form" action="${pageContext.request.contextPath}/front">
          
          <input type="hidden" name="key" value = "member" />
          <input type="hidden" name="methodName" value = "update" />
          
          <button type="submit" class="ps-info-update-btn" name="ps-info-update-btn" id="ps-info-update-btn" value="submit">적용</button>
          <table class="table-my-info"  style="border-collapse:collapse; borderSpacing: 0px; padding: 0px">
          	<tr>
          		<th scope="row">아이디</th>
          		<td colspan="2"><span>${member.id}</span>
          		&nbsp;<input type="text" class="ps-info-id" name="ps-info-id" id="ps-info-id" style="display: none" value="${member.id}">          		
          		</td>
          	</tr>
          	<tr>
          		<th scope="row">비밀번호</th>
          		<td colspan="2"><span>${member.pwd}</span>
          		&nbsp;<input type="text" class="ps-info-pwd" name="ps-info-pwd" id="ps-info-pwd" style="display: none" value="${member.pwd}">          		
          		</td>
          	</tr>
          	<tr>
          		<th scope="row">이름</th>
          		<td colspan="2"><span id="ps-info-name">${member.mbName}</span></td>
          	</tr>
          	<tr>
          		<th scope="row">이메일</th>
          		<td colspan="2"><span>${member.email}</span>
          		&nbsp;<input type="text" class="ps-info-email" name="ps-info-email" id="ps-info-email" style="display: none" value="${member.email}"> 		
          		</td>
          	</tr>
          	<tr>
          		<th scope="row">주소</th>
          		<td colspan="2"><span>${member.addr}</span>
          		&nbsp;<input type="text" class="ps-info-addr" name="ps-info-addr" id="ps-info-addr" style="display: none" value="${member.addr}">
          		</td>
          	</tr>
          	<tr>
          		<th scope="row">주민등록번호</th>
          		<td colspan="2"><span id="ps-info-jumin">${member.jumin}</span></td>
          	</tr>
          	<tr>
          		<th scope="row">전화번호</th>
          		<td colspan="2"><span>${member.tel}</span>
          		&nbsp;<input type="text" class="ps-info-tel" name="ps-info-tel" id="ps-info-tel" style="display: none" value="${member.tel}">
          		</td>
          	</tr>
          	<tr>
          		<th scope="row">가입일</th>
          		<td colspan="2"><span>${member.signUpDate}</span></td>
          		&nbsp;<input type="text" class="ps-info-tel" name="ps-info-tel" id="ps-info-tel" style="display: none" value="${member.tel}">
          	
          	</tr>
          </table>
          
          </form>
        	</section>
        	<section>
        		<header class="sample"><h5>샘플</h5></header><hr>
        		<table>
        			<tr>
          		<th scope="row">아이디</th>
          		<td colspan="2">**</td>
          	</tr>
          	<tr>
          		<th scope="row">비밀번호</th>
          		<td colspan="2">**</td>
          	</tr>
          	<tr>
          		<th scope="row">이름</th>
          		<td colspan="2">**</td>
          	</tr>
          	<tr>
          		<th scope="row">이메일</th>
          		<td colspan="2">**</td>
          	</tr>
          	<tr>
          		<th scope="row">주소</th>
          		<td colspan="2">**</td>
          	</tr>
          	<tr>
          		<th scope="row">주민등록번호</th>
          		<td colspan="2">**</td>
          	</tr>
          	<tr>
          		<th scope="row">전화번호</th>
          		<td colspan="2">**</td>
          	</tr>
          	<tr>
          		<th scope="row">가입일</th>
          		<td colspan="2">**</td>
          	</tr>
        		</table>
        	</section>  
        </div>
        
      </div>
    </div>
  </section>
	<!-- ================ category section end ================= -->		  

	

  <!--================ Start footer Area  =================-->	
	<footer>
		<div class="footer-area">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title large_title">Our Mission</h4>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no 
								divided deep moved us lan Gathering thing us land years living.
							</p>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved 
							</p>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Quick Links</h4>
							<ul class="list">
								<li><a href="#">Home</a></li>
								<li><a href="#">Shop</a></li>
								<li><a href="#">Blog</a></li>
								<li><a href="#">Product</a></li>
								<li><a href="#">Brand</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget instafeed">
							<h4 class="footer_title">Gallery</h4>
							<ul class="list instafeed d-flex flex-wrap">
								<li><img src="img/gallery/r1.jpg" alt=""></li>
								<li><img src="img/gallery/r2.jpg" alt=""></li>
								<li><img src="img/gallery/r3.jpg" alt=""></li>
								<li><img src="img/gallery/r5.jpg" alt=""></li>
								<li><img src="img/gallery/r7.jpg" alt=""></li>
								<li><img src="img/gallery/r8.jpg" alt=""></li>
							</ul>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Contact Us</h4>
							<div class="ml-40">
								<p class="sm-head">
									<span class="fa fa-location-arrow"></span>
									Head Office
								</p>
								<p>123, Main Street, Your City</p>
	
								<p class="sm-head">
									<span class="fa fa-phone"></span>
									Phone Number
								</p>
								<p>
									+123 456 7890 <br>
									+123 456 7890
								</p>
	
								<p class="sm-head">
									<span class="fa fa-envelope"></span>
									Email
								</p>
								<p>
									free@infoexample.com <br>
									www.infoexample.com
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="container">
				<div class="row d-flex">
					<p class="col-lg-12 footer-text text-center">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
				</div>
			</div>
		</div>
	</footer>
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
  <script type="text/javascript">
  	
  $(function() {
  		
		$("#ps-info-modify-btn").click(function() {
			$("#ps-info-pwd").show();
			$("#ps-info-email").show();
			$("#ps-info-addr").show();
			$("#ps-info-tel").show();
			$("#ps-info-update-btn").show();
				
		});
	
  	
  		$("#ps-info-form").submit(function(){
  				
  			var str = "";
  			
  			if("${dbMember.pwd}" != $("#ps-info-pwd").val()){
  				str += "비밀번호, ";
  			}
  			if("${dbMember.email}" != $("#ps-info-email").val()){
  				str += "이메일, ";
  			}
  			if("${dbMember.addr}" != $("#ps-info-addr").val()){
  				str += "주소, ";
  			}
  			if("${dbMember.tel}" != $("#ps-info-tel").val()){
  				str += "핸드폰 번호, ";
  			}
  			
  			str = str.substring(0, str.length-2);
  			
  			if(!confirm(str + "을 변경하시겠습니까?")){
  				return false;
  			} 
  			
  			
  			
  			
  		});
   		
  	
  	
  	
  	})
  </script>
</body>
</html>