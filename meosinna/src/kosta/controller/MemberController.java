package kosta.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.dto.Member;
import kosta.dto.OrderIndex;
import kosta.dto.PrivateQuestion;
import kosta.service.MemberService;
import net.sf.json.JSONArray;


public class MemberController implements Controller {
	private MemberService memberService = new MemberService();
	

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return null;
	}
	
	
	/**
	 * 1. 회원가입
	 * @param request
	 * @param response
	 * @return ModelAndView
	 * @throws ServletException
	 * @throws IOException
	 * @throws SQLException
	 */
	
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
		

		
		//pwd와 confirm pwd의 일치여부 확인 필요
		//아직 유효성 체크 구현 안됨
		Member member = new Member(mbName, id, pwd, email, address, jumin, tel); 
		
		memberService.register(member);
		session.setAttribute("member", member);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.jsp");
		return mv;
	}

	
	
	
	/**
	 * 2. 로그인 / 주문 내역 가져오기
	 * @param request
	 * @param response
	 * @return ModelAndView
	 * @throws Exception
	 */
	
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String userId=request.getParameter("userId");
		String pwd=request.getParameter("pwd");
		Member member = new Member(userId, pwd);
		
		Member dbMember = memberService.loginCheck(member);
		
		//orderIndex가져오기
		int mbCode = dbMember.getMbCode();
		dbMember.setOrderIndex(memberService.getOrderList(mbCode));
		System.out.println(dbMember.getOrderIndex());
		
		//세션에정보저장
		HttpSession session = request.getSession();
		session.setAttribute("member", dbMember);

		ModelAndView mv = new ModelAndView("index.jsp", true);
		
		return mv;
	}
	
	
	
	/**
	 * 3. 로그아웃
	 * @param request
	 * @param response
	 * @return ModelAndView
	 * @throws Exception
	 */
	
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		session.invalidate();
		
		return new ModelAndView("index.jsp", true);
	}
	
	
	
	
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		
		String name = request.getParameter("ps-info-name");
		String id = request.getParameter("ps-info-id");
		String pwd = request.getParameter("ps-info-pwd");
		String email = request.getParameter("ps-info-email");
		String addr = request.getParameter("ps-info-addr");
		String tel = request.getParameter("ps-info-tel");
		String jumin = request.getParameter("ps-info-jumin");
	
		Member dbMember = new Member(name, id, pwd, email, addr, jumin, tel);
		memberService.update(dbMember);

		
		request.setAttribute("member", dbMember);

		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("personalInfo.jsp");
		
		return mv;
	}
	
	
	
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
	
		int mbCodeid = Integer.parseInt(request.getParameter("ps-info-mbCode"));
		
		memberService.delete(mbCodeid);
		
		ModelAndView mv = new ModelAndView("index.jsp", true);
		return mv;
	}
	
	public ModelAndView selectPrivate(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		List<Member> privateList = memberService.selectPrivate();
		for(Member member : privateList) {
			System.out.println(member.toString());
		}
		request.setAttribute("privateList", privateList);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("memberAdmin.jsp");
		
		return mv;
	}
	
	
	public ModelAndView contact(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int odCode = Integer.parseInt(request.getParameter("orderIndexs"));
		String name = request.getParameter("name");	
		String tel = request.getParameter("phone");
		String email = request.getParameter("email");
		String title = request.getParameter("subject");
		String content = request.getParameter("message");
		String type = request.getParameter("contactType");
		

		PrivateQuestion pq = new PrivateQuestion(odCode, name, tel, email, title, content, type); 
		
		memberService.sendContact(pq);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("myPage.jsp");
		
		return mv;
	
	}
	
	
	

}
