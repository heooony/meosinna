<!-- dbGet.jsp -->
<!-- 클라이언트로부터 가져온 데이터를 이용해 DB에 접근하는 페이지 -->
<%@page import="kosta.util.DbUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="kosta.dao.GoodsDAO"%>
<%@page import="kosta.dao.GoodsDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String gdCode = request.getParameter("gdCode"); 
	GoodsDAOImpl dao = new GoodsDAOImpl();
	dao.setGdLike(gdCode);
%>