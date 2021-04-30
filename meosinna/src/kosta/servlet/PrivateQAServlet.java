package kosta.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.dao.MemberDAO;
import kosta.dao.MemberDAOImpl;
import net.sf.json.JSONArray;


@WebServlet("/privateQA")
public class PrivateQAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberDAO memberDAO = new MemberDAOImpl();
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int mbCode = Integer.parseInt(request.getParameter("mbCode"));
		
		try {
			 map = memberDAO.selectPqAll(mbCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		JSONArray arr = JSONArray.fromObject(map);//
		PrintWriter out = response.getWriter();
		out.println(arr);
		
	}

	
}
