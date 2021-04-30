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
  <title>MEOSINNA - Cart</title>
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
  <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
  <script type="text/javascript">
  $(function () {
	  
	  function deleteCart (gdCode) {
	  
	  }
	  myDelete = deleteCart;
  	//	$(document).on("click","#deleteBtn",function() {
  		//	console.log($("#deleteBtn").val())
  			//$(location).attr("href","front?key=cart&methodName=deleteCart");
	  })
	  
	  function kosta (gdCode) {
			  location.href="front?key=cart&methodName=deleteCart&gdCode=" + gdCode;
  	   }	  
  </script>
  <style>
  	#deleteBtn{background-color:white; border-color:#eeeeee; 
  			   font-family: "Noto Sans KR", sans-serif; border-radius:6px;
  			   box-shadow : 0 2px  4px -1px #bbbbff;}
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
					<h1>Shopping Cart</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Shopping Cart</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  

  <!--================Cart Area =================-->
  <section class="cart_area">
      <div class="container">
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                      <thead>
                          <tr>
                              <th scope="col">Product</th>
                              <th scope="col">Size</th>
                              <th scope="col">Quantity</th>
                              <th scope="col">Price</th>
                          </tr>
                      </thead>
                      <tbody>

                      <c:set var="totalPrice" value="0"/>
                      <c:forEach items="${requestScope.goodsList}" var="cart">
                     	 <tr>
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                          <img src="${sessionScope.str}" alt="" style="width:65px;"> <!-- img/cart/cart1.png -->
                                      </div>
                                      <div class="media-body">
                                          <p>${cart.name}</p>
                                      </div>
                                  </div>
                              </td>
                              <td>
                                  <h5>${cart.size}</h5>
                              </td>
                              <td>
                                  <h5>${cart.qty}</h5>
                              </td>
                              <td>
                                  <h5>${cart.price}</h5>
                                  <input type="hidden" value="${cart.gdCode}"/>
                              </td>
                              <td>
                                  <h5><button id="deleteBtn" onclick="kosta('${cart.gdCode}')">삭제하기</button></h5>
                              </td>
                          </tr>
                      <c:set var="totalPrice" value="${totalPrice + cart.price}"/>
                      </c:forEach>
                          <tr class="bottom_button">
                              <td>
                              
                              </td>
                              <td>
                              
                              </td>
                              <td>

                              </td>
                              <td>

                              </td>
                              <td>
                                  <div class="cupon_text d-flex align-items-center">

                                    <!--   <input type="text" placeholder="Coupon Code">
                                    <a class="primary-btn" href="#">Apply</a>
                                      <a class="button" href="#">Have a Coupon?</a> -->
                                      <div style="float:right;"><a class="button" href="front?key=cart&methodName=clearCart">장바구니 비우기</a></div>
                                  </div>
                              </td>
                          </tr>
                          <tr>
                              <td>

                              </td>
                              <td>

                              </td>
                              <td>
                                  <h4 style="font-size:2rem">Total</h4>
                              </td>
                              
                              <td>
                              </td>
                              
                              <td>
                                  <h4><c:out value="${totalPrice}"/>&nbsp;₩</h4>
                              </td>
                          </tr>
                          <tr class="shipping_area">
                              <td class="d-none d-md-block">

                              </td>
                              <td>

                              </td>
                              <td>
                                  <h5>Shipping</h5>

                              </td>
                              <td>
                              </td>
                              <td>
                                  <div class="shipping_box">
                                      <ul class="list">
                                          <li class="active"><a style="font-style:">FREE FOR <span style="color:#FFBBBB; font-style:italic;">MEMBERS ONLY</span></a></li>
                                      </ul>
                                  </div>
                              </td>
                          </tr>
                          <tr class="out_button_area">
                              <td class="d-none-l">

                              </td>
                              <td class="">

                              </td>
                              <td>

                              </td>
                              <td>
                                  <div class="checkout_btn_inner d-flex align-items-center">
                                      <a class="gray_btn" href="category.html">Continue Shopping</a>
                                      <a class="primary-btn ml-2" href="checkout.jsp">Proceed to checkout</a>
                                  </div>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
  </section>
  <!--================End Cart Area =================-->



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