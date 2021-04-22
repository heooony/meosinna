package kosta.dao.member;

import java.sql.SQLException;

import kosta.dto.Member;

public interface MemberDAO {
	public int insert(Member member) throws SQLException;
}
