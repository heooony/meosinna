package kosta.service;

import java.sql.SQLException;
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
		return 0;
	}
}
