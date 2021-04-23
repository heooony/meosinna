package kosta.dao.likes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.dao.GoodsDAO;
import kosta.dao.GoodsDAOImpl;
import kosta.dto.Goods;
import kosta.dto.Likes;
import kosta.dto.Member;
import kosta.util.DbUtil;

public class LikesDAOImpl implements LikesDAO {

	GoodsDAO goodsDAO = new GoodsDAOImpl();
	
	@Override
	public List<Likes> selectLikes(int mbCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Likes likes = null;
		List<Likes> list = new ArrayList<Likes>();
		Goods goods = null;
		String sql = "select g.gd_name, g.brand, g.price, g.gd_like, g.img\r\n"
				+ "from likes l \r\n"
				+ "join goods g \r\n"
				+ "on l.gd_code = g.gd_code\r\n"
				+ "where mb_code = ?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, mbCode);

			rs = ps.executeQuery();
			
			while(rs.next()){
				goods = new Goods(null, rs.getString(1), rs.getInt(2), rs.getString(3), rs.getInt(4), null, null, rs.getString(5));
				likes = new Likes(0, null, null, goods);
				
				list.add(likes);
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

}
