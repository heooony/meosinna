package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.dto.Review;
import kosta.util.DbUtil;

public class ReviewDAOImpl implements ReviewDAO {

	@Override
	public List<Review> selectByGdCode(String gdCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Review> list = new ArrayList<Review>();
		String sql = "select * from review where gd_code = ?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, gdCode);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Review review = new Review(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), gdCode);
				
				list.add(review);
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

	@Override
	public int insertByMbName(Review review) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "insert into review values(rv_code.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
		try{
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, review.getGdName());
			ps.setString(2, review.getMbName());
			ps.setString(3, review.getTitle());
			ps.setString(4, review.getContent());
			ps.setString(5, review.getImg());
			ps.setInt(6, review.getGrade());
			ps.setInt(7, review.getGdSize());
			ps.setString(8, review.getGdCode());
			
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

}
