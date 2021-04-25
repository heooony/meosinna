package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dao.OrderDAO;
import kosta.dao.OrderDAOImpl;
import kosta.dto.Order;
import kosta.dto.OrderLine;
import kosta.dto.Payment;

public class OrderServiceImpl implements OrderService {
	OrderDAO dao = new OrderDAOImpl();

	@Override
	public int order(Order order, OrderLine orderLine, Payment payment) throws SQLException {
		int result = dao.order(order, orderLine, payment);
		return result;
	}
	
	@Override
	public List<Order> viewAllOrders() throws SQLException {
		List<Order> list = dao.viewAllOrders();
		return list;
	}
}
 