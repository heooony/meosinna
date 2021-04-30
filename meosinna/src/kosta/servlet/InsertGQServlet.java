package kosta.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.dto.GoodsQuestion;
import kosta.dto.Member;
import kosta.service.GoodsQuestionService;

/**
 * Servlet implementation class InsertGQServlet
 */
@WebServlet("/insertGQ")
public class InsertGQServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    GoodsQuestionService gqService = new GoodsQuestionService();   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String content = request.getParameter("message");
		String gdCode = request.getParameter("gdCode");
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		
		GoodsQuestion gq = new GoodsQuestion(0, content, null, null, member.getMbName(), gdCode, null);
		try {
			gqService.insertGQbyMbCode(gq);
			PrintWriter out =response.getWriter();
			out.println("작성되었습니다.");
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
