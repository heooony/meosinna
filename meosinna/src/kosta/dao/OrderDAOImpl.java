package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.dto.Goods;
import kosta.dto.Member;
import kosta.dto.Order;
import kosta.dto.OrderDetail;
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
			this.manageQty(con, orderLine.getQty(), order.getGdCode(), orderLine.getSize());
			
		} finally {
			DbUtil.dbClose(ps, con);
		}

		return result;
	}

	@Override
	public int orderLine(Connection con, OrderLine orderLine) throws SQLException {
		PreparedStatement ps = null;
		String sql = "INSERT INTO ORDERLINE VALUES(SEQ_OD_CODE.CURRVAL, ?, SYSDATE, ?, ?, ?, ?)";
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, orderLine.getGdName());
			ps.setInt(2, orderLine.getQty());
			ps.setInt(3, orderLine.getIsEvent());
			ps.setString(4, orderLine.getReq());
			ps.setInt(5, orderLine.getSize());
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, null);
		}
		return result;
	}

	@Override
	public int payment(Connection con, Payment payment) throws SQLException {
		PreparedStatement ps = null;

		String sql = "INSERT INTO PAYMENT VALUES(SEQ_PY_CODE.NEXTVAL, SEQ_OD_CODE.CURRVAL, SYSDATE, ?, ?, ?)";
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, payment.getPay());
			ps.setString(2, payment.getMethod());
			ps.setString(3, payment.getState());
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
				list.add(new Order(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getString(6),rs.getString(7), rs.getInt(8) ));
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

	
	public List<Order> viewMyOrder(int mbCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Order> list = new ArrayList<Order>();
		String sql = "SELECT * FROM G_ORDER WHERE MB_CODE=?";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, mbCode);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new Order(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), 
									rs.getInt(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return list;
	}

	@Override
	public int setComplain(Member member, Order order, Goods goods, String type) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "INSERT INTO COMPLAIN VALUES(SEQ_COMPLAIN.NEXTVAL,?,SYSDATE,?,?,?,?,?,?,?)";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, type);
			ps.setString(2, member.getMbName());
			ps.setString(3, goods.getGdName());
			ps.setInt(4, 1);
			ps.setString(5, "요청 대기");
			if(type.equals("cancle")) {
				ps.setString(6, null);
				ps.setString(7, null);
			} else {
				ps.setInt(6, order.getPay());
				ps.setInt(7, order.getPay());
			}
			ps.setInt(8, order.getOdCode());
			this.updateState(con, order.getOdCode());
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(ps, con);
		}

		return result;
	}
	
	@Override
	public Order getOrder(int odCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM G_ORDER WHERE OD_CODE = ?";
		Order order = null;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, odCode);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				order = new Order(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getInt(8));
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return order;
	}
	
	public void updateState(Connection con, int odCode) throws SQLException{
		PreparedStatement ps = null;
		String sql = "UPDATE G_ORDER SET STATE = ? WHERE OD_CODE = ?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "요청 중");
			ps.setInt(2, odCode);
			ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(ps, null);
		}
		
	}
	public OrderDetail viewOrderDetail(String gdCode, int odCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		OrderDetail orderDetail = null;
		String sql="SELECT G_ORDER.OD_CODE, G_ORDER.GD_CODE, G_ORDER.MB_NAME, G_ORDER.TEL, G_ORDER.ADDR, G_ORDER.STATE, \r\n"
				+ "PAYMENT.PAY,\r\n"
				+ "ORDERLINE.GD_NAME, ORDERLINE.S_SIZE ,ORDERLINE.OD_DATE, ORDERLINE.QTY, ORDERLINE.REQ \r\n"
				+ "FROM G_ORDER JOIN PAYMENT ON G_ORDER.OD_CODE = PAYMENT.OD_CODE \r\n"
				+ "JOIN ORDERLINE ON G_ORDER.OD_CODE = ORDERLINE.OD_CODE \r\n"
				+ "WHERE GD_CODE = ? AND G_ORDER.OD_CODE = ?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, gdCode);
			ps.setInt(2, odCode);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				orderDetail = new OrderDetail(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), 
							rs.getString(6), rs.getInt(7), rs.getString(8), rs.getInt(9),
							rs.getString(10), rs.getInt(11), rs.getString(12));
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return orderDetail;
	}
	
	public int manageQty(Connection con, int qty, String gdCode, int size) throws SQLException{
		PreparedStatement ps = null;
		int result = 0;
		String sql="UPDATE S_SIZE SET QTY=QTY-? WHERE GD_CODE=? AND S_SIZE=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, qty);
			ps.setString(2, gdCode);
			ps.setInt(3, size);
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, null);
		}
		
		return result;
	}
	
}
