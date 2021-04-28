package kosta.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.dto.Order;
import kosta.service.MemberService;
import net.sf.json.JSONArray;

@WebServlet("/orderList")
public class OrderList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberService memberService = new MemberService();

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int mbCode = Integer.parseInt(request.getParameter("mbCode"));
		System.out.println(mbCode);

		Order order = null;
		try {
			order = memberService.getOrderList(mbCode);
			session.setAttribute("order", order);
			System.out.println(order.getPay());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		JSONArray arr = JSONArray.fromObject(order.getOrderList());
		System.out.println(arr);
		PrintWriter out = response.getWriter();
		out.println(arr);

	}

}
