package kosta.service;

import java.sql.SQLException;

import kosta.dao.OrderDAO;
import kosta.dao.OrderDAOImpl;
import kosta.dto.Order;

public class OrderServiceImpl implements OrderService {
	OrderDAO dao = new OrderDAOImpl();

	@Override
	public int order(Order order) throws SQLException {
		int result = dao.order(order);
		return 0;
	}
}
