<%@page import="kosta.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
  <script type="text/javascript">
  
	  function cancle (odCode, gdCode) {
			  location.href="front?key=order&methodName=setComplain&type=cancle&odCode=" + odCode + "&gdCode=" + gdCode;
	  }
	  
	  function refund (odCode, gdCode) {
			  location.href="front?key=order&methodName=setComplain&type=refund&odCode=" + odCode + "&gdCode=" + gdCode;
  	   }	  
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
          
          <div class="sidebar-filter">
            <div class="top-filter-head">My page</div>
            <div class="common-filter">
              <div class="head">쇼핑활동</div>
              <form action="#">
                <ul>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="brand"><label for="apple">주문 내역 조회</label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="asus" name="brand"><label for="asus">구매후기</label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="gionee" name="brand"><label for="gionee">장바구니</label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="micromax" name="brand"><label for="micromax">적립금</label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="samsung" name="brand"><label for="samsung">좋아요</label></li>
                </ul>
              </form>
            </div>
            <div class="common-filter">
              <div class="head">나의정보</div>
              <form action="#">
                <ul>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="black" name="myInfo">개인정보변경</li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="balckleather" name="myInfo">회원탈퇴</li>
                </ul>
              </form>
            </div>
           
          </div>
        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
        
          <!-- End Filter Bar -->
          
          <!-- Start Best Seller -->
		<div class="order_details_table">
		        <h2><span style="color:#007BFF">${sessionScope.member.mbName}</span> 님 주문내역조회</h2>
		        <div class="table-responsive">
		          <table class="table">
		            <thead>
		              <tr>
		                <th scope="col">주문코드</th>
		                <th scope="col">상품코드</th>
		                <th scope="col">주문금액</th>
		                <th scope="col">주문상태</th>
		                <th scope="col">상품이상</th>
		              </tr>
		            </thead>
		            <tbody>
		              <c:forEach items="${requestScope.myOrderList}" var="order"> 
		              <tr>
		                <td>${order.odCode}</td>
		                <td><a id="orderDetail" href="front?key=order&methodName=viewOrderDetail&gdCode=${order.gdCode}&odCode=${order.odCode}">${order.gdCode}</a></td>
		                <td>${order.pay}</td>
		                <td>${order.state}</td>
		                <td>
			                <c:choose>
	    						<c:when test="${order.state eq '주문 대기'}">
				                	<input type="button" value="취소" onclick="cancle('${order.odCode}', '${order.gdCode}')">
	                    		</c:when>
	                    		<c:when test="${order.state eq '요청 중'}">
	                    			요청 대기중입니다.
	                    		</c:when>
	                    		<c:when test="${order.state eq '요청 완료'}">
	                    			요청이 완료되었습니다.
	                    		</c:when>
	                    		<c:otherwise>
			                		<input type="button" value="환불" onclick="refund('${order.odCode}', '${order.gdCode}')">
				                	<input type="button" value="취소" onclick="cancle('${order.odCode}', '${order.gdCode}')">
	  						  	</c:otherwise>
							</c:choose>
		                </td>
		              </tr>
		              </c:forEach>
		            </tbody>
		          </table>
		        </div>
		      </div>
		     </div>
	

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
  
	$(function() {

		//정남님...id이름 짓기 힘드셨군요..
		 $("myInfo").click(function () {
			
			 alert(1);
			 
			 
		});
		 
		
		
		
		
		
		
	})//Jquery끝  
  
  
  
  </script>
  
</body>
</html>