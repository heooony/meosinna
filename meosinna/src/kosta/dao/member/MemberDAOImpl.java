package kosta.dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kosta.dto.Member;
import kosta.exception.AuthenticationException;
import kosta.util.DbUtil;

public class MemberDAOImpl implements MemberDAO{
	
	public int insert(Member member) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "INSERT INTO MEMBER VALUES (MB_CODE_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";

		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getMbName());
			ps.setString(2, member.getId());
			ps.setString(3, member.getPwd());
			ps.setString(4, member.getEmail());
			ps.setString(5, member.getAddr());
			ps.setString(6, member.getJumin());
			ps.setString(7, member.getTel());

			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose( ps, con);
		}

		return result;
		
	}
	
	public Member loginCheck(Member member) throws SQLException, AuthenticationException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Member dbMember = null;
		String sql = "select * from member where id=? and pwd=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPwd());
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dbMember = new Member(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return dbMember;
	}
	
}
