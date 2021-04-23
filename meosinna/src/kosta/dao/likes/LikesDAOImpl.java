package kosta.dao.likes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.dto.Likes;
import kosta.dto.Member;
import kosta.util.DbUtil;

public class LikesDAOImpl implements LikesDAO {

	@Override
	public List<Likes> selectLikes(Member member) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Likes> list = new ArrayList<Likes>();
		/*String sql = "select g.gd_name, g.brand, g.price, g.gd_like\r\n"
				+ "from likes l \r\n"
				+ "join goods g\r\n"
				+ "on l.gd_code = g.gd_code\r\n"
				+ "where mb_code = 6";*/
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement();
			ps.setString(1, null);
			ps.setString(1, null);
			ps.setInt(1, null);
			ps.setInt(1, null);
			rs = ps.executeQuery();
			
			while(rs.next())
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return null;
	}

}
