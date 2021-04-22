package kosta.dao;

import java.sql.SQLException;

import kosta.dto.Order;

public interface OrderDAO {

	int order(Order order) throws SQLException;
	
}
