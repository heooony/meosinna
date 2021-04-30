<%@page import="kosta.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<%@ include file="header.jsp" %>
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
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="myInfo"><a href="${pageContext.request.contextPath}/front?key=member&methodName=selectPrivate">회원목록</a></li>
                </ul>
              </form>
            </div>
            <div class="common-filter">
              <div class="head">주문관리</div>
              <form action="personalInfo.jsp">
                <ul>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="black" name="myInfo"><a href="viewAllOrders.jsp">전체주문조회</a></li>
                </ul>
              </form>
            </div>
           
          </div>
        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
        
          <!-- End Filter Bar -->
          
          <!-- Start Best Seller -->
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
                <td><c:out value="${privateMember.mbName}"/></td>
                <td><c:out value="${privateMember.id}"/></td>
                <td><c:out value="${privateMember.email}"/></td>
                <td><c:out value="${privateMember.addr}"/></td>
                <td><c:out value="${privateMember.jumin}"/></td>
                <td><c:out value="${privateMember.tel}"/></td>
                <td><c:out value="${privateMember.signUpDate}"/></td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
       
          <!-- End Best Seller -->
        </div>
      </div>
    </div>
  </section>
	<!-- ================ category section end ================= -->		  

	

  <!--================ Start footer Area  =================-->	
	<%@ include file="footer.jsp" %>
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