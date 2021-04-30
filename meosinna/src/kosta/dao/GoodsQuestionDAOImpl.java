package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.dto.Goods;
import kosta.dto.GoodsQuestion;
import kosta.dto.Member;
import kosta.util.DbUtil;

public class GoodsQuestionDAOImpl implements GoodsQuestionDAO {

	@Override
	public int insertGQbyMbCode(GoodsQuestion gq) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "insert into goods_question values(gq_code.nextval, ?,sysdate, '답변대기', ?, ?)";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, gq.getGqContent());
			ps.setString(2, gq.getGdCode());
			ps.setString(3, gq.getMbName());
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public List<GoodsQuestion> selectByGdCode(String gdCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<GoodsQuestion> list = new ArrayList<GoodsQuestion>();
		String sql = "select mb_name, rg_date, gq_content, reply\r\n"
				+ "from goods_question\r\n"
				+ "where gd_code = ?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, gdCode);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				GoodsQuestion gq = new GoodsQuestion(0, rs.getString(3), rs.getString(2), rs.getString(4), rs.getString(1), gdCode, null);
				list.add(gq);
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

}
