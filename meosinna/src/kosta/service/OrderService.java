package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.Member;
import kosta.dto.Order;
import kosta.dto.OrderDetail;
import kosta.dto.OrderLine;
import kosta.dto.Payment;

public interface OrderService {
	public int order(Order order, OrderLine orderLine, Payment payment) throws SQLException;
	
	public List<Order> viewAllOrders() throws SQLException;
	
	public List<Order> viewMyOrder(int mbCode) throws SQLException;


	public void setComplain(Member member, int odCode, String gdCode, String type) throws SQLException;
	
	public OrderDetail viewOrderDetail(String gdCode, int odCode) throws SQLException;
}