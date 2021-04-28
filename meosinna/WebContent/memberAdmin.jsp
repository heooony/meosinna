<%@page import="kosta.dto.Member"%>
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
                  <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/category.jsp">Shop Category</a></li>
                </ul>
							</li>
				<%
					Member member = (Member)session.getAttribute("member");
					
					if(session.getAttribute("member") == null || !member.getMbName().equals("admin")){
			
              
				}else{%>
					<li class="nav-item submenu dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
	                  aria-expanded="false">Admin</a>
	                <ul class="dropdown-menu">
	                  <li class="nav-item"><a class="nav-link" href="#">Member Administration</a></li>
	                  <li class="nav-item"><a class="nav-link" href="#">Order Administration</a></li>
	                </ul>
								</li>	
				<%} %>
							<li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Member</a>
                <ul class="dropdown-menu">
                  <%if(session.getAttribute("member") == null){ %>
                  <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                  <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
                  <li class="nav-item"><a class="nav-link" href="tracking-order.html">Service</a></li>
                  <%}else{ %>
                  <li class="nav-item"><a class="nav-link" href="myPage.jsp">My Page</a></li>
                  <li class="nav-item"><a class="nav-link" href="cart.jsp">Shopping Cart</a></li>
                  <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/front?key=likes&methodName=selectLikes">Likes</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">Service</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">Product Checkout</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">Confirmation</a></li>
                  <%} %>
                </ul>
              <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
            </ul>

            <ul class="nav-shop">
              <li class="nav-item"><button><i class="ti-search"></i></button></li>
              <li class="nav-item"><button onclick="location.href='cart.jsp' "><i class="ti-shopping-cart"></i><span class="nav-shop__circle">3</span></button> </li>
              <%if(session.getAttribute("member") == null) {%>
              
              <li class="nav-item"><a class="button button-header" href="${pageContext.request.contextPath}/login.jsp">Login</a></li>
              <%}else{ %>
              <li class="nav-item"><button><a class="like" href="${pageContext.request.contextPath}/front?key=likes&methodName=selectLikes">좋아요</a></li>
              <li class="nav-item"><button><a class="like" href="myPage.jsp">${member.mbName}</a>님</li>
              <li class="nav-item"><a class="button button-header" href="${pageContext.request.contextPath}/front?key=member&methodName=logout"">Logout</a></li>
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
					<h1>관리자 페이지</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
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
          
          <div class="sidebar-filter">
            <div class="top-filter-head">Admin</div>
            <div class="common-filter">
              <div class="head">회원관리</div>
              <form action="#">
                <ul>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="myInfo"><label for="apple">회원목록</label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="asus" name="myInfo"><label for="asus">회원제명</label></li>
                </ul>
              </form>
            </div>
            <div class="common-filter">
              <div class="head">주문관리</div>
              <form action="personalInfo.jsp">
                <ul>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="black" name="myInfo"><a href="${pageContext.request.contextPath}/personalInfo.jsp">개인정보변경</a></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="balckleather" name="myInfo"><a href="${pageContext.request.contextPath}/withdrawl.jsp">회원탈퇴</a></li>
                </ul>
              </form>
            </div>
           
          </div>
        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
        
          <!-- End Filter Bar -->
          
          <!-- Start Best Seller -->
          <section class="lattest-product-area pb-40 category-list">
            <div class="private_member_table">
        <h2>전체회원조회</h2>
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">회원이름</th>
                <th scope="col">회원아이디</th>
                <th scope="col">이메일</th>
                <th scope="col">주소</th>
                <th scope="col">주민등록번호</th>
                <th scope="col">전화번호</th>
                <th scope="col">가입일</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach items="${requestScope.privateList}" var="privateMember"> 
              <tr>
                <td><span>${privateMember.mbName}</span></td>
                <td><span>${privateMember.id}</span></td>
                <td><span>${privateMember.email}</span></td>
                <td><span>${privateMember.addr}</span></td>
                <td><span>${privateMember.jumin}</span></td>
                <td><span>${privateMember.tel}</span></td>
                <td><span>${privateMember.signUpDate}</span></td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
          </section>
          <!-- End Best Seller -->
        </div>
      </div>
    </div>
  </section>
	<!-- ================ category section end ================= -->		  

	

  <!--================ Start footer Area  =================-->	
	<footer class="footer">
		<div class="footer-area">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title large_title">MEOSINNA</h4>
							<p>
								머신나는 고객의 소리에 집중합니다. 불편한 부분이나 해결이 되지 않는 부분이 있다면 머신나 정책에 대한 문의를 남겨주세요.
							</p>
							<p>
								<b>머신나</b>는 항상 고객이 우리 상품의 주인공이 되기를 기다리고 있습니다. 
							</p>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Quick Links</h4>
							<ul class="list">
								<li><a href="index.jsp">Home</a></li>
								<li><a href="${pageContext.request.contextPath}/category.jsp">Shop</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget instafeed">
							<h4 class="footer_title">Designer</h4>
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
								<p>경기도 성남시 분당구 구미동 185-3</p>
								<p>하나프라자빌딩</p>
								<p class="sm-head">
									<span class="fa fa-phone"></span>
									Phone Number
								</p>
								<p>
									010 - 1234 - 5678 <br>
									010 - 1352 - 1357
								</p>
	
								<p class="sm-head">
									<span class="fa fa-envelope"></span>
									Email
								</p>
								<p>
									meosinna@kosta.or.kr <br>
									www.meosinna.com
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
  <script type="text/javascript"></script>
  <script>
  

  
  
  
  </script>
  
</body>
</html>