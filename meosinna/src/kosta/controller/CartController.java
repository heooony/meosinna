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
		int size = Integer.parseInt(request.getParameter("size"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		System.out.println("gdCode = " + gdCode);
		GoodsService goodsService = new GoodsServiceImpl();
		Goods goods = goodsService.selectByGdCode(gdCode);
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		service.addToCart(goods, qty, member.getMbCode(), size);
		ModelAndView mv = new ModelAndView("success.jsp", true);

		return mv;
	}
	
	public ModelAndView deleteCart(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, NumberFormatException, SQLException {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		int mbCode = member.getMbCode();
		String gdCode = request.getParameter("gdCode");
		service.deleteCart(mbCode, gdCode);
		
		ModelAndView mv = new ModelAndView();
		request.setAttribute("path", "cart.jsp");
		mv.setViewName("front?key=cart&methodName=viewCart");
		return mv;
	}
	
	public ModelAndView clearCart(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, NumberFormatException, SQLException {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		int mbCode = member.getMbCode();
		
		service.clearCart(mbCode);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("cart.jsp");
		return mv;
	}
	
}
