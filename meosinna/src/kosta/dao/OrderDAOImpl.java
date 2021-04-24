package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.dto.Order;
import kosta.dto.OrderLine;
import kosta.dto.Payment;
import kosta.util.DbUtil;

public class OrderDAOImpl implements OrderDAO{

	@Override
	public int order(Order order, OrderLine orderLine, Payment payment) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "INSERT INTO G_ORDER VALUES(?,?,?,?,?,?,?,?)";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, order.getOdCode());
			ps.setString(2, order.getMbName());
			ps.setString(3, order.getTel());
			ps.setString(4, order.getAddr());
			ps.setInt(5, order.getPay());
			ps.setString(6, order.getState());
			ps.setString(7, order.getGdCode());
			ps.setInt(8, order.getMbCode());
			
			result = ps.executeUpdate();
			
			this.orderLine(con, orderLine);
			this.payment(con, payment);
		} finally {
			DbUtil.dbClose(ps, con);
		}

		return result;
	}

	@Override
	public int orderLine(Connection con, OrderLine orderLine) throws SQLException {
		PreparedStatement ps = null;
		String sql = "INSERT INTO ORDERLINE VALUES(?, ?, ?, ?, ?, ?)";
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, orderLine.getOdCode());
			ps.setString(2, orderLine.getGdName());
			ps.setString(3, orderLine.getOdDate());
			ps.setInt(4, orderLine.getQty());
			ps.setInt(5, orderLine.getIsEvent());
			ps.setString(6, orderLine.getReq());
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, null);
		}
		return result;
	}

	@Override
	public int payment(Connection con, Payment payment) throws SQLException {
		PreparedStatement ps = null;
		String sql = "INSERT INTO PAYMENT VALUES(?, ?, ?, ?, ?, ?)";
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, payment.getPyCode());
			ps.setInt(2, payment.getOdCode());
			ps.setString(3, payment.getPayDate());
			ps.setInt(4, payment.getPay());
			ps.setString(5, payment.getMethod());
			ps.setString(6, payment.getState());
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, null);
		}
		return result;
	}
	
	@Override
	public List<Order> viewAllOrders() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Order> list = new ArrayList<Order>();
		String sql = "SELECT * FROM G_ORDER";
		
		try{
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new Order(rs.getInt(1), rs.getString(2), rs.getInt(5),
									rs.getString(6),rs.getString(7), rs.getInt(8) ));
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}
	
}
