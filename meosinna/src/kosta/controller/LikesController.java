package kosta.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.dto.Likes;
import kosta.dto.Member;
import kosta.controller.ModelAndView;
import kosta.service.LikesService;

public class LikesController implements Controller {
	private LikesService likesService = new LikesService();
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ModelAndView selectLikes(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		Member dbMember = (Member) session.getAttribute("dbMember");
		
		List<Likes> list = likesService.selectLikes(dbMember.getMbCode());
		session.setAttribute("list", list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("elec/like.jsp");
		
		return mv;
	}

}
