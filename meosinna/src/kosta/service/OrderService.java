package kosta.service;

import java.sql.SQLException;
import java.util.List;
import kosta.dao.MemberDAOImpl;

import kosta.dto.Goods;
import kosta.dto.Order;
import kosta.dto.OrderLine;
import kosta.dto.Payment;

public interface OrderService {
	public int order(Order order, OrderLine orderLine, Payment payment) throws SQLException;
	
	public List<Order> viewAllOrders() throws SQLException;

}