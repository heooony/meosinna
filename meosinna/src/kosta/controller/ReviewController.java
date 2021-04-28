package kosta.controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.dto.Goods;
import kosta.dto.Member;
import kosta.dto.Review;
import kosta.service.GoodsService;
import kosta.service.GoodsServiceImpl;
import kosta.service.ReviewService;

public class ReviewController implements Controller {
	private ReviewService reviewService = new ReviewService();
	private GoodsService goodsService = new GoodsServiceImpl();
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	/*
	public ModelAndView selectByGdCode(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String gdCode = request.getParameter("gdCode");
		Goods dbGoods = goodsService.selectByGdCode(gdCode);
		String img = request.getParameter("img");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int size = Integer.parseInt(request.getParameter("size"));
		int grade = Integer.parseInt(request.getParameter("grade"));
		Review review = new Review(0, dbGoods.getGdName(), member.getMbName(), title, content, img, grade, size, dbGoods.getGdCode());
		reviewService.insertByMbName(review);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/single-product.jsp");
		return mv;
	}*/
	
	
}
