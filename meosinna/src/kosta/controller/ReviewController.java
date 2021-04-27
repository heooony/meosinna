package kosta.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.dto.Member;
import kosta.dto.Review;
import kosta.service.ReviewService;

public class ReviewController implements Controller {
	private ReviewService reviewService = new ReviewService();
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ModelAndView selectByGdCode(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String gdCode = request.getParameter("gdCode");
		List<Review> reviewList = reviewService.selectByGdCode(gdCode);
		request.setAttribute("reviewList", reviewList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("single-product.jsp");
		return mv;
	}
}
