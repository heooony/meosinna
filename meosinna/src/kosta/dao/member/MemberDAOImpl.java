package kosta.dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kosta.dto.Member;
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
			ps.setString(6, member.getTel());

			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose( ps, con);
		}

		return result;
		
	}
	
}
