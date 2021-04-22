package kosta.service;

import java.sql.SQLException;

import kosta.dto.Order;

public interface OrderService {
	public int order(Order order) throws SQLException;
}
