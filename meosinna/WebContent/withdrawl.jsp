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
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="black" name="color"><label for="black">개인정보변경</label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="balckleather" name="color"><label for="balckleather">회원탈퇴</label></li>
                </ul>
              </form>
            </div>
           
          </div>
        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
        
          <!-- End Filter Bar -->
        
          <header class="first-info-view-area"><span>기본회원정보</span>
          &nbsp;<input type="button" value="수정"  id="ps-info-modify-btn">
          </header><hr>
          <section class="mypage">
          
          <form class="ps-info-form" id="ps-withdrawl-form" action="${pageContext.request.contextPath}/front">
          &nbsp;<input type="submit" class="ps-info-id" name="ps-withdrawl" id="ps-withdrawl" value="회원 탈퇴하기"> 
          &nbsp;<input type="text" class="ps-info-id" name="ps-info-mbCode" id="ps-info-mbCode" style="display: none" value="${member.mbCode}">          		
          <input type="hidden" name="key" value = "member" />
          <input type="hidden" name="methodName" value = "delete" />
          </form>
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
  			
  			if("${member.pwd}" != $("#ps-info-pwd").val()){
  				str += "비밀번호, ";
  			}
  			if("${member.email}" != $("#ps-info-email").val()){
  				str += "이메일, ";
  			}
  			if("${member.addr}" != $("#ps-info-addr").val()){
  				str += "주소, ";
  			}
  			if("${member.tel}" != $("#ps-info-tel").val()){
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