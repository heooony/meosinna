<%@page import="kosta.util.DbUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="kosta.dao.GoodsDAO"%>
<%@page import="kosta.dao.GoodsDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String gdCode = request.getParameter("gdCode"); 
	String isLike = request.getParameter("isLike");
	GoodsDAOImpl dao = new GoodsDAOImpl();
	dao.setGdLike(gdCode, isLike);
	if(isLike.equals("0")) {
		request.setAttribute("like", "1");
	} else {
		request.setAttribute("like", "0");
	}
%>