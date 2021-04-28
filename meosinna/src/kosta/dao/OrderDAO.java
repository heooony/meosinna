package kosta.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import kosta.dto.Goods;
import kosta.dto.Order;
import kosta.dto.OrderLine;
import kosta.dto.Payment;

public interface OrderDAO {
	/**
	 * 회원이 order를 마쳤을 때 실행된다.
	 * order는 orderEach, orderLine, payment 메소드를 실행하는 역할을 하며,
	 * order를 통해서 결제, 주문 개별, 주문 상세 테이블이 만들어진다.
	 * @param order
	 * @param orderLine
	 * @param payment
	 * @return int
	 * @throws SQLException
	 */
	int order(Order order, OrderLine orderLine, Payment payment) throws SQLException;
	
	/**
	 * order메소드가 호출될 때 실행된다.
	 * 주문이 이루어졌을 때 상세 정보들을 저장하기 위한 메소드이다.
	 * @param connection
	 * @param orderLine
	 * @return int
	 * @throws SQLException
	 */
	int orderLine(Connection connection, OrderLine orderLine) throws SQLException;
	
	/**
	 * order메소드가 호출될 때 실행된다.
	 * 결제 정보를 저장하기 위한 메소드이다.
	 * @param connection
	 * @param payment
	 * @return int
	 * @throws SQLException
	 */
	int payment(Connection connection, Payment payment) throws SQLException;
	
	/**
	 * order메소드가 호출될 때 실행된다.
	 * 전체 주문 목록을 조회하기 위한 메소드이다.
	 * @param connection
	 * @param payment
	 * @return int
	 * @throws SQLException
	 */
	List<Order> viewAllOrders() throws SQLException;
	
	/**
	 * order메소드가 호출될 때 실행된다.
	 * 로그인된 회원의 개인 주문 목록을 조회하기 위한 메소드이다.
	 * @param connection
	 * @param payment
	 * @return int
	 * @throws SQLException
	 */
	List<Order> viewMyOrder(int mbCode) throws SQLException;

}
