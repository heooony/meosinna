package kosta.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.dto.GoodsQuestion;
import kosta.service.GoodsQuestionService;

public class GoodsQuestionController implements Controller {
private GoodsQuestionService goodsQuestionService = new GoodsQuestionService();
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}

	public ModelAndView selectGQAll(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		int mbCode = Integer.parseInt(request.getParameter("mbCode"));
		List<GoodsQuestion> gqList = goodsQuestionService.selectGQAll(mbCode);
		request.setAttribute("gqList", gqList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/goodsQA.jsp");
		return mv;
	}
	

}
