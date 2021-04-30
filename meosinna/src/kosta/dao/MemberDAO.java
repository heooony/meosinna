package kosta.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kosta.dto.Member;
import kosta.dto.OrderIndex;
import kosta.dto.PrivateQuestion;
import kosta.exception.AuthenticationException;

public interface MemberDAO {
	public int insert(Member member) throws SQLException;
	public Member loginCheck(Member member) throws SQLException, AuthenticationException;
	public int update(Member dbMember) throws SQLException;
	public int delete(int mbCode) throws SQLException;
	public List<Member> selectPrivate() throws SQLException;
	public List<OrderIndex> getOrderListByMember(int mbCode) throws SQLException;
	public int insertContact(PrivateQuestion pq) throws SQLException;
	public Map<String, Object> selectPqAll(int mbCode) throws SQLException;
	

}
