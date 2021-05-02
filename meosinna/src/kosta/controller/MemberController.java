package kosta.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.dto.Goods;
import kosta.dto.Member;
import kosta.dto.PrivateQuestion;
import kosta.service.GoodsService;
import kosta.service.GoodsServiceImpl;
import kosta.service.MemberService;

public class MemberController implements Controller {
	private MemberService memberService = new MemberService();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return null;
	}

	/**
	 * 1. 회원가입
	 * 
	 * @param request
	 * @param response
	 * @return ModelAndView
	 * @throws ServletException
	 * @throws IOException
	 * @throws SQLException
	 */

	public ModelAndView register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		HttpSession session = request.getSession();
		String mbName = (String) request.getParameter("name");
		String id = (String) request.getParameter("id");
		String pwd = (String) request.getParameter("password");
		String confirmPwd = (String) request.getParameter("confirmPassword");
		String email = (String) request.getParameter("email");
		String addr1 = (String) request.getParameter("address");
		String addr2 = (String) request.getParameter("addressDetail");
		String jumin = (String) request.getParameter("jumin");
		String tel = (String) request.getParameter("phone");
		String address = addr1 + addr2;

		// pwd와 confirm pwd의 일치여부 확인 필요
		// 아직 유효성 체크 구현 안됨
		Member member = new Member(mbName, id, pwd, email, address, jumin, tel);

		memberService.register(member);
		member = memberService.loginCheck(member);
		session.setAttribute("member", member);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.jsp");
		mv.setRedirect(true);
		return mv;
	}

	/**
	 * 2. 로그인
	 * 
	 * @param request
	 * @param response
	 * @return ModelAndView
	 * @throws Exception
	 */

	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		Member member = new Member(userId, pwd);

		Member dbMember = memberService.loginCheck(member);
		String mbName = dbMember.getMbName();
		System.out.println(dbMember);
		// 세션에정보저장
		HttpSession session = request.getSession();
		session.setAttribute("member", dbMember);
		session.setAttribute("mbName", mbName);
		ModelAndView mv = new ModelAndView("index.jsp", true);

		return mv;
	}

	/**
	 * 3. 로그아웃
	 * 
	 * @param request
	 * @param response
	 * @return ModelAndView
	 * @throws Exception
	 */

	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();

		return new ModelAndView("index.jsp", true);
	}

	public ModelAndView update(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String name = request.getParameter("ps-info-name");
		String id = request.getParameter("ps-info-id");
		String pwd = request.getParameter("ps-info-pwd");
		String email = request.getParameter("ps-info-email");
		String addr = request.getParameter("ps-info-addr");
		String tel = request.getParameter("ps-info-tel");
		String jumin = request.getParameter("ps-info-jumin");

	
		Member dbMember = new Member(name, id, pwd, email, addr, jumin, tel);
		memberService.update(dbMember);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("personalInfo.jsp");

		return mv;
	}

	
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int mbCode = Integer.parseInt(request.getParameter("mbCode"));
		
		memberService.delete(mbCode);
		this.logout(request, response);
		ModelAndView mv = new ModelAndView("index.jsp", true);
		return mv;
	
	}

	public ModelAndView selectPrivate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Member> privateList = memberService.selectPrivate();
		for (Member member : privateList) {
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

	public ModelAndView getOrderIndex(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		Member member = (Member) (session.getAttribute("member"));

		// orderIndex가져오기
		int mbCode = member.getMbCode();
		member.setOrderIndex(memberService.getOrderList(mbCode));

		// 세션에 저장하기
		session.setAttribute("member", member);
		return new ModelAndView("contact.jsp", true);

	}

	public ModelAndView getPqList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		Member member = (Member) (session.getAttribute("member"));
		System.out.println(member);

		int mbCode = member.getMbCode();
		List<PrivateQuestion> pqList = (List<PrivateQuestion>)(memberService.getPqList(mbCode));

		
		// 리퀘스트에 저장하기
		  
		request.setAttribute("pqList", pqList);	
		 
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("myPrivateQA.jsp");
		
		return mv;
	}



	public ModelAndView deletePq(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int odCode = Integer.parseInt(request.getParameter("odCode"));

		memberService.deletePq(odCode);
		ModelAndView mv = this.getPqList(request, response);
		return mv;

	}
	
	  public ModelAndView selectOrderByLike(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  GoodsService goodsService = new GoodsServiceImpl();
		  	HttpSession session = request.getSession();
		  	Member member = (Member)session.getAttribute("member");
			List<Goods> recGoodsList = goodsService.getRecommended(member.getMbCode());
			request.setAttribute("recGoodsList", recGoodsList);
	 		ModelAndView mv = new ModelAndView();
	 		mv.setViewName("myPage.jsp");
	 		
	 		return mv;
	 	} 

}
