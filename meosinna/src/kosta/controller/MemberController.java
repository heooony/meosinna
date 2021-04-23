package kosta.controller;

import java.io.IOException;




import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.dao.MemberDAO;
import kosta.dao.MemberDAOImpl;
import kosta.dto.Member;
import kosta.controller.ModelAndView;
import kosta.service.MemberService;


public class MemberController implements Controller {
	private MemberService memberService = new MemberService();
	

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		return null;
	}
	
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		HttpSession session = request.getSession();
		String mbName = (String)request.getParameter("name");
		String id =  (String)request.getParameter("id");
		String pwd =  (String)request.getParameter("password");
		String confirmPwd = (String)request.getParameter("confirmPassword");
		String email =  (String)request.getParameter("email");
		String addr1 =  (String)request.getParameter("address");
		String addr2 =  (String)request.getParameter("addressDetail");		
		String jumin =  (String)request.getParameter("jumin");
		String tel =  (String)request.getParameter("phone");
		String address = addr1 + addr2;
		
		
		//�쑀�슚�꽦 泥댄겕 
		//pwd confirmPwd 留ㅼ튂 �솗�씤 �븘�슂
		Member member = new Member(mbName, id, pwd, email, address, jumin, tel); 
		
		memberService.register(member);
		session.setAttribute("member", member);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.jsp");
		return mv;
	}

	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String userId=request.getParameter("userId");
		String pwd=request.getParameter("pwd");
		Member member = new Member(userId, pwd);
		
		Member dbMember = memberService.loginCheck(member);
		
		//세션에정보저장
		HttpSession session = request.getSession();
		session.setAttribute("dbMember", dbMember);
		
		
		ModelAndView mv = new ModelAndView("index.jsp", true);
		
		return mv;
	}
	
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		session.invalidate();
		
		return new ModelAndView("index.jsp", true);
	}
	
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		
		String name=request.getParameter("ps-info-name");
		String id=request.getParameter("ps-info-id");
		String pwd=request.getParameter("ps-info-pwd");
		String email=request.getParameter("ps-info-email");
		String addr=request.getParameter("ps-info-addr");
		String tel= request.getParameter("ps-info-tel");
		String jumin=request.getParameter("ps-info-jumin");
		
		Member dbMember = new Member(name, id, pwd, email, addr, jumin, tel);
		memberService.update(dbMember);
		
		request.setAttribute("dbMember", dbMember);
		
		return new ModelAndView("personalInfo.jsp", true);
	}
	
	
}
