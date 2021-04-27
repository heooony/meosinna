package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.dto.Goods;
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
		String sql = "INSERT INTO G_ORDER VALUES(SEQ_OD_CODE.NEXTVAL,?,?,?,?,?,?,?)";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, order.getMbName());
			ps.setString(2, order.getTel());
			ps.setString(3, order.getAddr());
			ps.setInt(4, order.getPay());
			ps.setString(5, order.getState());
			ps.setString(6, order.getGdCode());
			ps.setInt(7, order.getMbCode());
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
		String sql = "INSERT INTO ORDERLINE VALUES(?, ?, SYSDATE, ?, ?, ?, ?)";
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, orderLine.getGdName());
			ps.setString(2, orderLine.getGdName());
			ps.setInt(3, orderLine.getQty());
			ps.setInt(4, orderLine.getIsEvent());
			ps.setString(5, orderLine.getReq());
			ps.setInt(6, orderLine.getSize());
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, null);
		}
		return result;
	}

	@Override
	public int payment(Connection con, Payment payment) throws SQLException {
		PreparedStatement ps = null;
		String sql = "INSERT INTO PAYMENT VALUES(SEQ_PY_CODE.NEXTVAL, ?, SYSDATE, ?, ?, ?)";
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, payment.getOdCode());
			ps.setInt(2, payment.getPay());
			ps.setString(3, payment.getMethod());
			ps.setString(4, payment.getState());
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