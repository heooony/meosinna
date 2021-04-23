package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kosta.dto.Order;
import kosta.dto.OrderEach;
import kosta.dto.OrderLine;
import kosta.dto.Payment;
import kosta.util.DbUtil;

public class OrderDAOImpl implements OrderDAO{

	@Override
	public int order(Order order, OrderLine orderLine, OrderEach orderEach, Payment payment) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
			this.orderLine(con, orderLine);
			this.orderEach(con, orderEach);
			this.payment(con, payment);
		} finally {
			DbUtil.dbClose(ps, con);
		}

		return 0;
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
	public int orderEach(Connection con, OrderEach orderEach) throws SQLException {
		PreparedStatement ps = null;
		String sql = "INSERT INTO ORDER_EACH VALUES(?, ?, ?, ?)";
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, orderEach.getOeCode());
			ps.setInt(2, orderEach.getOdCode());
			ps.setInt(3, orderEach.getSize());
			ps.setInt(4, orderEach.getPrice());
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
}
