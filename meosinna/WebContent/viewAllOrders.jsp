<%@page import="kosta.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>MEOSINNA - Home</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="css/style.css">
</head>
<body>
<!--================ Start Header Menu Area =================-->
	<%@ include file="header.jsp" %>
	<!--================ End Header Menu Area =================-->
	 <div class="private_order_details_table">
        <h2>전체주문조회</h2>
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">주문코드</th>
                <th scope="col">주문자 이름</th>
                <th scope="col">주문금액</th>
                <th scope="col">주문상태</th>
                <th scope="col">상품코드</th>
                <th scope="col">회원코드</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach items="${requestScope.orderList}" var="order"> 
              <tr>
                <td><c:out value="${order.odCode}"/></td>
                <td><c:out value="${order.mbName}"/></td>
                <td><c:out value="${order.pay}"/></td>
                <td><a href="front?key=order&methodName=viewOrderDetail&gdCode=${order.gdCode}&odCode=${order.odCode}"><c:out value="${order.state}"/></a></td>
                <td><c:out value="${order.gdCode}"/></td>
                <td><c:out value="${order.mbCode}"/></td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
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
  <script src="vendors/jquery.ajaxchimp.min.js"></script>
  <script src="vendors/mail-script.js"></script>
  <script src="js/main.js"></script>
</body>
</html>