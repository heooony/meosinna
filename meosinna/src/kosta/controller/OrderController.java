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
import kosta.dto.Order;
import kosta.dto.OrderLine;
import kosta.dto.Payment;
import kosta.service.CartService;
import kosta.service.CartServiceImpl;
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
		//session에 저장해두기
		CartService cartService = new CartServiceImpl();
		List<CartDTO> goodsList = cartService.viewCart(member.getMbCode());
		String req = (String)session.getAttribute("req");

		for(CartDTO cart : goodsList) {
			Order order = new Order(1, member.getMbName(), member.getTel(), member.getAddr(), cart.getPrice(), "주문 대기", cart.getGdCode(), member.getMbCode());
			OrderLine orderLine = new OrderLine(1, cart.getName(), null, 1, 0, req, 240);
			Payment payment = new Payment(1,0, null, cart.getPrice(), "paypal", "결제완료");
			service.order(order, orderLine, payment);
		}
		ModelAndView mv = new ModelAndView("index.jsp", false);
		return mv;
	}

	public ModelAndView viewAllOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		List<Order> orderList = service.viewAllOrders();
		HttpSession session = request.getSession();
		session.setAttribute("orderList", orderList);


		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewAllOrders.jsp");

		return mv;
	}
}
