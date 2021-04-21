package kosta.dao;

import java.sql.SQLException;

import kosta.dto.Member;
import kosta.exception.*;

public interface MemberDAO {
	public int insert(Member member) throws SQLException;
	public Member loginCheck(Member member) throws SQLException, AuthenticationException;
}
