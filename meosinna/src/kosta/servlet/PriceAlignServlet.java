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

import kosta.dao.GoodsDAO;
import kosta.dao.GoodsDAOImpl;
import kosta.dto.Goods;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class PriceAscServlet
 */
@WebServlet("/priceAlign")
public class PriceAlignServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String align = request.getParameter("align");
		
		GoodsDAO goodsDAO = new GoodsDAOImpl();
		List<Goods> list = null;
		try {
			
			if(align.equals("asc")) {
				list = goodsDAO.selectAllByPriceAsc();
			}else {
				list = goodsDAO.selectAllByPriceDesc();
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		JSONArray arr = JSONArray.fromObject(list);
		PrintWriter out = response.getWriter();
		out.println(arr);
	}

}
