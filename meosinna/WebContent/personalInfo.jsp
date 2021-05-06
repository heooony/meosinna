<%@page import="kosta.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>MEOSINNA - MY INFO</title>
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

<style type="text/css">
td {
	padding-top: 20px;
	padding-bottom: 20px;
}

th {
	padding-right: 80px;
	padding-top: 20px;
	padding-bottom: 20px;
}
</style>


<script type="text/javascript">
	function goPopup() {

		var pop = window.open("./popup/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
		document.getElementById('address').blur();
	}

	//나중에 활용할 수도 있어서 인수는 더 받음
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, jibunAddr, zipNo) {
		document.getElementById('address').value = roadAddrPart1;
		document.getElementById('addressDetail').value = addrDetail + ", "
				+ zipNo;
	}
</script>

</head>
<body>
	<!--================ Start Header Menu Area =================-->
<<<<<<< HEAD
	<%@ include file="header.jsp" %>
=======
	<%@ include file="header.jsp"%>
>>>>>>> parent of cf8017d ([IMPROVE] : myPage.jsp 개인정보 수정 뿌려주기 완료)
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
							<li class="breadcrumb-item active" aria-current="page">님
								환영합니다.</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->
	<section class="section-margin--small mb-5">
    <div class="container">
      <div class="row">
      <div class="col-xl-3 col-lg-4 col-md-5">

	<!-- ================ category section start ================= -->		  
  <%@ include file="myPageMenuBar.jsp" %>
	

					<!-- End Filter Bar -->


					<header class="first-info-view-area">
						<span><h4>기본회원정보</h4></span>
					</header>
					<hr>
					<section class="mypage">
						<form class="ps-info-form" id="ps-info-form"
							action="${pageContext.request.contextPath}/front">

							<input type="hidden" name="key" value="member" /> <input
								type="hidden" name="methodName" value="update" />
							<div class="btn-group" role="group" aria-label="Basic example">
								&nbsp;<input type="button" class="btn btn-secondary" value="수정"
									id="ps-info-modify-btn">
								<button type="submit" class="btn btn-secondary"
									name="ps-info-update-btn" id="ps-info-update-btn"
									value="submit">적용</button>
							</div>
							<table class="table-my-info table-hover"
								style="border-collapse: collapse; borderSpacing: 0px; padding: 0px">
								<tr>
									<th scope="row">아이디</th>
									<td colspan="2"><span>${member.id}</span> &nbsp;<input
										type="text" class="ps-info-id" name="ps-info-id"
										id="ps-info-id" style="display: none" value="${member.id}">
									</td>
								</tr>
								<tr>
									<th scope="row">비밀번호</th>
									<td colspan="2"><span>${member.pwd}</span> &nbsp;<input
										type="text" class="ps-info-pwd" name="ps-info-pwd"
										id="ps-info-pwd" style="display: none" value="${member.pwd}">
									</td>
								</tr>
								<tr>
									<th scope="row">이름</th>
									<td colspan="2"><span id="ps-info-name">${member.mbName}</span></td>
								</tr>
								<tr>
									<th scope="row">이메일</th>
									<td colspan="2"><span>${member.email}</span> &nbsp;<input
										type="text" class="ps-info-email" name="ps-info-email"
										id="ps-info-email" style="display: none"
										value="${member.email}"></td>
								</tr>
								<tr>
									<th scope="row">주소</th>
									<td colspan="2"><span>${member.addr}</span> <br> <input
										type="text" class="ps-info-addr" name="ps-info-addr"
										id="ps-info-addr" onclick="goPopup();"
										style="display: none; width: 100%;" value="${member.addr}">
									</td>
								</tr>
								<tr>
									<th scope="row">주민등록번호</th>
									<td colspan="2"><span id="ps-info-jumin">${member.jumin}</span></td>
								</tr>
								<tr>
									<th scope="row">전화번호</th>
									<td colspan="2"><span>${member.tel}</span> &nbsp;<input
										type="text" class="ps-info-tel" name="ps-info-tel"
										id="ps-info-tel" style="display: none" value="${member.tel}">
									</td>
								</tr>
								<tr>
									<th scope="row">가입일</th>
									<td colspan="2"><span>${member.signUpDate}</span></td>

								</tr>


							</table>
						</form>
						
					<a class="btn btn-secondary" id="withdrawal" href="${pageContext.request.contextPath}/front?key=member&methodName=delete&mbCode=${member.mbCode}">회원탈퇴</a>
					
					</section>
				</div>

			</div>
		</div>
	</section>
	<!-- ================ category section end ================= -->

	<!--================ Start footer Area  =================-->
	<%@ include file="footer.jsp"%>
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

			
			$("#ps-info-form").submit(function() {
						
						var str = "";
			
						if ($("#ps-info-pwd").val() != "${member.pwd}") {
							str += "비밀번호, ";
						}
						if ($("#ps-info-email").val() != "${member.email}") {
							str += "이메일, ";
						}
						if ($("#ps-info-addr").val() != "${member.addr}") {
							str += "주소, ";
						}
						if ($("#ps-info-tel").val() != "${member.tel}") {
							str += "핸드폰 번호, ";
						}

						
						
						////////////////////////////////////////////////////////
						
						if (str.length != 0) {
							str = str.substring(0, str.length - 2);

							if (!confirm(str + "가 변경됩니다.\n변경하시겠습니까?")) {
								return false;
							}

						}else{
							
							alert("변경사항이 없습니다.");
							
						}

					});
			

			$("#withdrawal").click(function() {

				if (!confirm("탈퇴하면 모든 내역이 삭제됩니다.\n탈퇴하시겠습니까?")) {
				
					return false;
				}	

			});

		})
	</script>
</body>
</html>