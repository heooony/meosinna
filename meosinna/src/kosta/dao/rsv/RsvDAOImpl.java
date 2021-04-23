package kosta.dao.rsv;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.dto.Member;
import kosta.dto.RSV;
import kosta.util.DbUtil;

public class RsvDAOImpl implements RsvDAO {

	@Override
	public List<RSV> selectRsv(Member member) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<RSV> list = new ArrayList<RSV>();
		String sql = "select rsv, add_rsv, t_rsv\r\n"
				+ "from rsv\r\n"
				+ "where mb_code = ?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, member.getMbCode());
			rs = ps.executeQuery();
			
			where(rs.next()){
				
			}
		}finally {
			
		}
		return null;
	}

}
