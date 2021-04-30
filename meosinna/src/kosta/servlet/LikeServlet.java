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

import kosta.dao.GoodsDAOImpl;
import kosta.dto.Member;

/**
 * Servlet implementation class PriceAscServlet
 */
@WebServlet("/likeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String gdCode = request.getParameter("gdCode"); 
		String isLike = request.getParameter("isLike");
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		GoodsDAOImpl dao = new GoodsDAOImpl();
		PrintWriter out =response.getWriter();
		try {
			dao.setGdLike(member.getMbCode(), gdCode, isLike);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(isLike.equals("0")) {
			out.write("1");
		} else {
			out.write("0");
		}
	}
}
