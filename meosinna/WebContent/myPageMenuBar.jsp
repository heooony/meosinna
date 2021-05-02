<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        
          
          <div class="sidebar-filter">
            <div class="">My page</div>
            <div class="">
              <div class="head">쇼핑활동</div>
                <ul class = "list-group list-group-flush">
                  <li class="list-group-item"><a href="${pageContext.request.contextPath}/myOrder.jsp">주문 내역 조회</a></li>
                  <li class="list-group-item"><a href="${pageContext.request.contextPath}/cart.jsp">장바구니</a></li>
                  <li class="list-group-item"><a href="${pageContext.request.contextPath}/front?key=likes&methodName=selectLikes">좋아요</a></li>
                  <li class="list-group-item"><a href="${pageContext.request.contextPath}/front?key=goodsQuestion&methodName=selectGQAll">상품문의</a></li>
                  <li class="list-group-item"><a href="${pageContext.request.contextPath}/front?key=member&methodName=getPqList">일대일문의</a></li>
                </ul>
            </div>
            <div class="">
              <div class="">나의정보</div>
                <ul class = "list-group list-group-flush">
                  <li class="list-group-item"><a href="${pageContext.request.contextPath}/personalInfo.jsp">개인정보변경</a></li>
                </ul>
            </div>
           
          </div>
        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">