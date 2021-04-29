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

import kosta.dto.Goods;
import kosta.service.GoodsService;
import kosta.service.GoodsServiceImpl;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class SelectByPriceServlet
 */
@WebServlet("/selectByPrice")
public class SelectByPriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GoodsService goodsService = new GoodsServiceImpl();   

	
	@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html;charset=UTF-8");
			int min = Integer.parseInt(request.getParameter("min"));     
			System.out.println(min);
			int max = Integer.parseInt(request.getParameter("max")); 
			System.out.println(max);
			try {
				List<Goods> list = goodsService.selectByPrice(min, max);  
				//request.setAttribute("filterList", list);
				JSONArray arr = JSONArray.fromObject(list);
				PrintWriter out =response.getWriter();
				out.println(arr);
			}catch(SQLException e){
				e.printStackTrace();
			}
			
	}

}
