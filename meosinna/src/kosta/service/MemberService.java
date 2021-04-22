package kosta.service;

import java.sql.SQLException;

import kosta.dao.member.MemberDAO;
import kosta.dao.member.MemberDAOImpl;
import kosta.dto.Member;

public class MemberService {
	MemberDAO dao = new MemberDAOImpl();

	public void register(Member member) throws SQLException {

		int result = dao.insert(member);
		if (result == 0) {
			throw new SQLException("등록되지 않았습니다.");
		}

		
		
	}
}
