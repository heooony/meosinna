package kosta.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.dto.CartDTO;
import kosta.dto.Goods;
import kosta.dto.Member;
import kosta.service.CartServiceImpl;
import kosta.service.GoodsService;
import kosta.service.GoodsServiceImpl;

public class CartController implements Controller {
	CartServiceImpl service = new CartServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return null;
	}
	
	public ModelAndView viewCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		int mbCode = member.getMbCode();
		List<CartDTO> goodsList = service.viewCart(mbCode);
		request.setAttribute("goodsList", goodsList);
		String path = (String)request.getAttribute("path");
		ModelAndView mv = new ModelAndView(path,false);
		return mv;
	}
	
	public ModelAndView addToCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NumberFormatException, SQLException {
		String gdCode = (String) request.getParameter("gdCode");
		System.out.println("gdCode = " + gdCode);
		GoodsService goodsService = new GoodsServiceImpl();
		Goods goods = goodsService.selectByGdCode(gdCode);
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String qty = "1"; //임시 수량
		service.addToCart(goods, Integer.parseInt(qty), member.getMbCode());
		ModelAndView mv = new ModelAndView("single-product.jsp", false);
		return mv;
	}
}
