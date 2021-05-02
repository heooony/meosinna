package kosta.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.dao.GoodsQuestionDAO;
import kosta.dao.GoodsQuestionDAOImpl;
import kosta.dto.GoodsQuestion;
import kosta.dto.Member;
import kosta.service.GoodsQuestionService;

public class GoodsQuestionController implements Controller {
private GoodsQuestionDAO dao = new GoodsQuestionDAOImpl();
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ModelAndView selectGQAll(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		List<GoodsQuestion> gqList = dao.selectGQAll(member.getMbName());
		request.setAttribute("gqList", gqList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/goodsQA.jsp");
		return mv;
	}
	
	

}
