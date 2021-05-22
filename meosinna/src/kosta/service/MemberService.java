package kosta.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kosta.dao.MemberDAO;
import kosta.dao.MemberDAOImpl;
import kosta.dto.Member;
import kosta.dto.OrderIndex;
import kosta.dto.PrivateQuestion;

public class MemberService {
	MemberDAO dao = new MemberDAOImpl();

	public void register(Member member) throws SQLException {

		int result = dao.insert(member);

		if (result == 0) {
			throw new SQLException("완료되지 않았습니다.");

		}
	}

	public Member loginCheck(Member member) throws SQLException {
		Member dbMember = dao.loginCheck(member);
//		if (dbMember == null) {
//			throw new SQLException("아이디와 비밀번호를 확인해주세요");
//		}
		return dbMember;
	}

	public void update(Member dbMember) throws SQLException {
		int result = dao.update(dbMember);

		if (result == 0) {
			throw new SQLException("변경되지 않았습니다.");
		}

	}

	public void delete(int mbCode) throws SQLException {
		int result = dao.delete(mbCode);
		
		if (result == 0) {
			throw new SQLException("회원 탈퇴에 실패하였습니다.");
		}

	}

	
	public List<Member> selectPrivate() throws SQLException{
		List<Member> list = dao.selectPrivate();
		
		if(list==null) {
			throw new SQLException("회원 정보를 불러올 수 없습니다.");
		}
		return list;
	}


	public List<OrderIndex> getOrderList(int mbCode) throws SQLException{
		List<OrderIndex> orderIndexs = dao.getOrderListByMember(mbCode);
		
		if(orderIndexs == null) {
			throw new SQLException("주문정보 조회에 실패하였습니다.");
		}
	
		return orderIndexs;
	
	}

	public void sendContact(PrivateQuestion pq) throws SQLException{
		int result = dao.insertContact(pq);
		
		if(result == 0) {
			throw new SQLException("일대일 문의 등록에 실패하였습니다.");
		}
	
	}
	

	public List<PrivateQuestion> getPqList(int mbCode) throws SQLException{
		
		List<PrivateQuestion> list = dao.selectPqAll(mbCode);
	
		
		/*
		 * if(list.size() == 0) { throw new SQLException("일대일 문의 내역이 없습니다."); }
		 */
		return list;
	}
	
	
	public void deletePq(int odCode) throws SQLException{
		
		int result = dao.deletePq(odCode);
		
		if(result == 0) {
		
			throw new SQLException("문의내역 삭제에 실패하였습니다.");
			
		}
		
	}

	
}



