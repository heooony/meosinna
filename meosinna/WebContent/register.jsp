<%@page import="kosta.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>MEOSINNA - SIGN UP</title>
    <link rel="icon" href="img/bannerLogo.png" type="image/png">
    <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="vendors/linericon/style.css">
    <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
    <link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">
	<link rel="stylesheet" href="css/style.css">
<!-- 	<link rel="stylesheet" href="css/style.css"> -->

	<!-- 추가(정희) -->
	
<link rel = "stylesheet" type="text/css" href="css/registerEdit.css">

	
<script>

function goPopup(){
	
	var pop = window.open("./popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	document.getElementById('address').blur();
}

//나중에 활용할 수도 있어서 인수는 더 받음
function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, jibunAddr, zipNo){
	document.getElementById('address').value = roadAddrPart1;
	document.getElementById('addressDetail').value = addrDetail + ", " + zipNo;
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
                <h1>Register</h1>
                <nav aria-label="breadcrumb" class="banner-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Register</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- ================ end banner area ================= -->

<!--================Login Box Area =================-->
<section class="login_box_area section-margin">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login_box_img">
                    <div class="hover">
                        <h4>Already have an account?</h4>
                        <p>There are advances being made in science and technology everyday, and a good example of this
                            is the</p>
                        <a class="button button-account" href="login.html">Login Now</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="login_form_inner register_form_inner">
                    <h3>Create an account </h3>${roadFullAddr}
                    <form class="row login_form" action="${pageContext.request.contextPath}/front?key=member&methodName=register" id="register_form" method="post">
                        <div class="col-md-12 form-group">
                            <input type="text" class="form-control" id="name" name="name" placeholder="Username"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'">
                        </div>
                        <div class="col-md-12 form-group">
                            <input type="text" class="form-control" id="id" name="id" placeholder="UserId"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'UserId'">
                        </div>
                        <div class="col-md-12 form-group">
                            <input type="text" class="form-control" id="phone" name="phone"
                                   placeholder="phone" onfocus="this.placeholder = ''"
                                   onblur="this.placeholder = 'Phone'">
                        </div>
                         <div class="col-md-12 form-group">
                            <input type="text" class="form-control" id="email" name="email" placeholder="Email Address"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address'">
                        </div>
                        <div class="col-md-12 form-group">
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
                        </div>
                        <div class="col-md-12 form-group">
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword"
                                   placeholder="Confirm Password" onfocus="this.placeholder = ''"
                                   onblur="this.placeholder = 'Confirm Password'">
                        </div>
                        <div class="col-md-12 form-group">
							 <input type="text" class="form-control" id="address" name="address"
               						placeholder="Address" onclick="goPopup();"
               						onblur="this.placeholder = 'Address'">
                        </div>
                        <div class="col-md-12 form-group">
							 <input type="text" class="form-control" id="addressDetail" name="addressDetail"
               						placeholder="Address Detail" onfocus="this.placeholder = ''"
               						onblur="this.placeholder = 'Address Detail'">
                        </div>
                        <div class="col-md-5 form-group">
							 <input type="text" class="form-control" id="jumin" name="jumin"
               						placeholder="Jumin" onfocus="this.placeholder = ''"
               						onblur="this.placeholder = 'Jumin'">
                        </div>

						<div class="col-md-5 form-group">
							 <input type="text" class="form-control" id="jumin" name="jumin"
               						placeholder="Jumin" onfocus="this.placeholder = ''"
               						onblur="this.placeholder = 'Jumin'">
                        </div>
						

                        <div class="col-md-12 form-group">
                            <div class="creat_account">
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <button type="submit" value="submit" class="button button-register w-100">Register</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================End Login Box Area =================-->


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
<!-- 정희 추가 -->
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
</body>
</html>