<%@page import="kosta.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="index.jsp"><img src="img/logo3.png" alt="" width="100px" style="opacity: 0.75"></a>
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
	                  <li class="nav-item"><a class="nav-link" href="memberAdmin.jsp">Member Administration</a></li>
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
                  <li class="nav-item"><a class="nav-link" href="checkout.jsp">Product Checkout</a></li>
                  <li class="nav-item"><a class="nav-link" href="confirmation.jsp">Confirmation</a></li>
                  <%} %>

			</ul>
              <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
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