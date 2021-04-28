<%@page import="kosta.dto.Order"%>
<%@page import="kosta.util.DbUtil"%>
<%@page import="kosta.dao.MemberDAOImpl"%>
<%@page import="kosta.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%=DbUtil.getConnection() %>
<p>
<%
MemberDAO dao = new MemberDAOImpl();

	Order order =dao.getOrderListByMember(6);
     out.println(order.getOrderList());
%>

</body>
</html>