package kosta.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

import kosta.dao.GoodsDAO;
import kosta.dao.GoodsDAOImpl;
import kosta.dto.Goods;
import kosta.dto.PageCnt;
import kosta.util.DbUtil;
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
		String pageNo = request.getParameter("pageNo");//정렬 완료 시 페이징
		  
        if(pageNo==null || pageNo.equals("")) { 
	 	  pageNo="1"; 
	    }
		GoodsDAO goodsDAO = new GoodsDAOImpl();
		List<Goods> list = null;
		try {
			
			if(align.equals("1")) {
				list = goodsDAO.selectAllByPriceAsc(Integer.parseInt(pageNo));
			}else {
				list = goodsDAO.selectAllByPriceDesc(Integer.parseInt(pageNo));
			}
			
			//정렬에 해당 하는ㄹ레코드 수를 구한다.
			int total = goodsDAO.getSelectTotalCount();
			// int totalCount = ??
			Map<String, Object> map = new HashedMap();
			map.put("list", list);
			map.put("total", total);
			
			JSONArray arr = JSONArray.fromObject(map);
			PrintWriter out = response.getWriter();
			out.println(arr);
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
	
	}
	
	
}
