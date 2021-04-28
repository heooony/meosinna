package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dao.CartDAO;
import kosta.dao.CartDAOImpl;
import kosta.dao.GoodsDAO;
import kosta.dao.GoodsDAOImpl;
import kosta.dao.OrderDAO;
import kosta.dao.OrderDAOImpl;
import kosta.dto.Goods;
import kosta.dto.Member;
import kosta.dto.Order;
import kosta.dto.OrderDetail;
import kosta.dto.OrderLine;
import kosta.dto.Payment;

public class OrderServiceImpl implements OrderService {
	OrderDAO dao = new OrderDAOImpl();

	@Override
	public int order(Order order, OrderLine orderLine, Payment payment) throws SQLException {
		int result = dao.order(order, orderLine, payment);
		CartDAO cartDAO = new CartDAOImpl();
		cartDAO.clearCart(order.getMbCode());
		return result;
	}
	
	@Override
	public List<Order> viewAllOrders() throws SQLException {
		List<Order> list = dao.viewAllOrders();
		return list;
	}
	
	@Override
	public List<Order> viewMyOrder(int mbCode) throws SQLException {
		List<Order> list = dao.viewMyOrder(mbCode);
		return list;
	}
	
	@Override
	public OrderDetail viewOrderDetail(String gdCode, int odCode) throws SQLException {
		OrderDetail orderDetail = dao.viewOrderDetail(gdCode, odCode);
		return orderDetail;
	}

	@Override
	public void setComplain(Member member, int odCode, String gdCode, String type) throws SQLException {
		GoodsDAO goodsDAO = new GoodsDAOImpl();
		Goods goods = goodsDAO.selectByGdCode(gdCode);
		Order order = dao.getOrder(odCode);
		int result = dao.setComplain(member, order, goods, type);
	}

}
 