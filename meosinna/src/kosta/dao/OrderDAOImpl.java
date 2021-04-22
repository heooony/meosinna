package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kosta.dto.Order;
import kosta.util.DbUtil;

public class OrderDAOImpl implements OrderDAO{

	@Override
	public int order(Order order) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
			
			
		} finally {
			DbUtil.dbClose(ps, con);
		}

		return 0;
	}
	
	
}
