package kosta.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.dto.Goods;
import kosta.dto.Member;
import kosta.dto.Order;
import kosta.dto.OrderLine;
import kosta.dto.Payment;
import kosta.service.OrderService;
import kosta.service.OrderServiceImpl;

public class OrderController implements Controller {
	OrderService service = new OrderServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		return null;
	}
	
	public ModelAndView order(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		List<Goods> goodsList = (List<Goods>)session.getAttribute("goodsList");
		String req = (String)session.getAttribute("req");
		
		for(Goods goods : goodsList) {
			Order order = new Order(0, member.getMbName(), member.getTel(), member.getAddr(), goods.getPrice(), "주문 대기", goods.getGdCode(), member.getMbCode());
			OrderLine orderLine = new OrderLine(0, goods.getGdName(), null, 0, 0, req, 0);
			Payment payment = new Payment(0,0, null, goods.getPrice(), "paypal", "결제완료");
			service.order(order, orderLine, payment);
		}
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
}
