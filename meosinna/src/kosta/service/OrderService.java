package kosta.service;

import java.sql.SQLException;

import kosta.dto.Order;
import kosta.dto.OrderLine;
import kosta.dto.Payment;

public interface OrderService {
	public int order(Order order, OrderLine orderLine, Payment payment) throws SQLException;
}
