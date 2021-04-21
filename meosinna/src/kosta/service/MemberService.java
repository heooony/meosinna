package kosta.service;

import java.sql.SQLException;


import kosta.dao.MemberDAO;
import kosta.dao.MemberDAOImpl;
import kosta.dto.Member;

public class MemberService {
	MemberDAO dao = new MemberDAOImpl();

	public void register(Member member) throws SQLException {

		int result = dao.insert(member);

		if(result==0) {
			throw new SQLException("완료되지 않았습니다.");

		}
	}
	public Member loginCheck(Member member) throws SQLException{
		Member dbMember = dao.loginCheck(member);
		if(dbMember == null) {
			throw new SQLException("아이디와 비밀번호를 확인해주세요");
		}
		return dbMember;
	}

		
}
