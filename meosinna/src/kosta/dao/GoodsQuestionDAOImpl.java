package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.dto.Goods;
import kosta.dto.GoodsQuestion;
import kosta.util.DbUtil;

public class GoodsQuestionDAOImpl implements GoodsQuestionDAO {

	@Override
	public List<GoodsQuestion> selectGQAll(int mbCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select q.gq_content, g.gd_name, q.rg_date\r\n"
				+ "from goods_question q join goods g\r\n"
				+ "on(q.gd_code = g.gd_code)\r\n"
				+ "where mb_code = ?";
		List<GoodsQuestion> list = new ArrayList<GoodsQuestion>();
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, mbCode);
			rs = ps.executeQuery();
			while(rs.next()) {
				Goods goods = new Goods(null, rs.getString(2), 0, null, 0, null, null, null);
				GoodsQuestion goodsQuestion = new GoodsQuestion(0, rs.getString(1), rs.getString(3), null, mbCode, null, goods);
				
				list.add(goodsQuestion);
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

}
