package kosta.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.dto.CartDTO;
import kosta.dto.Goods;
import kosta.dto.Member;
import kosta.service.CartServiceImpl;

public class CartController implements Controller {
	CartServiceImpl service = new CartServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return null;
	}
	
	public ModelAndView viewCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		List<CartDTO> list = service.viewCart();
		
		session.setAttribute("list", list);
		ModelAndView mv = new ModelAndView("cart.jsp",false);
		session.setAttribute("str", "https://gcsevmfhfcsn4841109.gcdn.ntruss.com/data/jdsports_data/images/addimg/00/00/22/28/24/b_00160153_add.gif");
		return mv;
	}
	
	public ModelAndView addToCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NumberFormatException, SQLException {
		HttpSession session = request.getSession();
//		Goods goods = (Goods)session.getAttribute("goods");
		Goods goods = new Goods("1", "kawai", 3, 30000, "nike", 10, "1", "1", "이 신발은 명품입니다.", "https://gcsevmfhfcsn4841109.gcdn.ntruss.com/data/jdsports_data/images/addimg/00/00/22/28/24/b_00160153_add.gif");
//		String qty = request.getParameter("qty");
		String qty = "1";
//		Member member = (Member)session.getAttribute("member");
		Member member = new Member();
		
		service.addToCart(goods, Integer.parseInt(qty), member.getMbCode());
		ModelAndView mv = new ModelAndView("single-product.html", false);
		return mv;
	}
}
