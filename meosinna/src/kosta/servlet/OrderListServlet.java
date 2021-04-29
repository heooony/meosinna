package kosta.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.dto.OrderIndex;
import kosta.service.MemberService;
import net.sf.json.JSONArray;

@WebServlet("/orderList")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberService memberService = new MemberService();

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int mbCode = Integer.parseInt(request.getParameter("mbCode"));

		List<OrderIndex> orderIndexs = null;
		try {
			orderIndexs = memberService.getOrderList(mbCode);
			session.setAttribute("orderIndexs", orderIndexs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		/*
		 * JSONArray arr = JSONArray.fromObject(orderIndexs); System.out.println(arr);
		 * PrintWriter out = response.getWriter(); out.println(arr);
		 */

	}

}
