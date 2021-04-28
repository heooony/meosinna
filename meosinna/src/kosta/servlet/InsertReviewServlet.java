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

import kosta.dto.Goods;
import kosta.dto.Member;
import kosta.dto.Review;
import kosta.service.GoodsService;
import kosta.service.GoodsServiceImpl;
import kosta.service.ReviewService;

/**
 * Servlet implementation class InsertReviewServlet
 */
@WebServlet("/insertReview")
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    GoodsService goodsService = new GoodsServiceImpl();   
	ReviewService reviewService = new ReviewService();
    @Override
    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
	
		response.setContentType("text/html;charset=UTF-8");
		
		String img = request.getParameter("img");
		String gdCode = request.getParameter("gdCode");
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		//String gdCode = request.getParameter("gdCode");
		try {
		Goods dbGoods = goodsService.selectByGdCode(gdCode);
//		String img = request.getParameter("img");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int size = Integer.parseInt(request.getParameter("size"));
		int grade = Integer.parseInt(request.getParameter("grade"));
		Review review = new Review(0, dbGoods.getGdName(), member.getMbName(), title, content, img, grade, size, dbGoods.getGdCode());
		reviewService.insertByMbName(review);
		PrintWriter out =response.getWriter();
		out.println("작성되었습니다.");
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

}




