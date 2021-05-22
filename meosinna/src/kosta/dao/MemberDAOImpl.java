package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kosta.dto.Member;
import kosta.dto.OrderIndex;
import kosta.dto.PrivateQuestion;
import kosta.exception.AuthenticationException;
import kosta.util.DbUtil;

public class MemberDAOImpl implements MemberDAO {

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
			DbUtil.dbClose(ps, con);
		}

		return result;

	}

	public Member loginCheck(Member member) throws SQLException, AuthenticationException {
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

			if (rs.next()) {
				dbMember = new Member(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return dbMember;
	}

	@Override
	public int update(Member dbMember) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "update member set pwd=?, email=?, addr=?, tel=? where id=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dbMember.getPwd());
			ps.setString(2, dbMember.getEmail());
			ps.setString(3, dbMember.getAddr());
			ps.setString(4, dbMember.getTel());
			ps.setString(5, dbMember.getId());
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int delete(int mbCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "DELETE FROM MEMBER WHERE MB_CODE = ?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, mbCode);
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public List<Member> selectPrivate() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList<Member>();
		String sql = "select mb_name, id, email, addr, regexp_replace(jumin, '\\d','*','7')as p_jumin, tel, sign_up_date from member where NOT id IN ('admin') order by sign_up_date desc";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Member member = new Member(0, rs.getString(1), rs.getString(2), null, rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7));

				list.add(member);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

	public List<OrderIndex> getOrderListByMember(int mbCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<OrderIndex> list = null;

		String sql = "SELECT OD_CODE, TO_CHAR(OD_DATE, 'YY/MM/DD AMHH24:MI'), PAY, GOODS.GD_NAME, ORDERLINE.QTY\r\n"
				+ "FROM ORDERLINE JOIN G_ORDER\r\n" + "USING (OD_CODE) JOIN GOODS\r\n" + "USING (GD_CODE)\r\n"
				+ "WHERE MB_CODE = ?" + "ORDER BY (OD_CODE)ASC";

		try {
			list = new ArrayList<OrderIndex>();
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, mbCode);
			rs = ps.executeQuery();

			while (rs.next()) {
				int odCode = rs.getInt(1);
				String odDate = rs.getString(2);
				int pay = rs.getInt(3);
				String gdName = rs.getString(4);
				int qty = rs.getInt(5);

				OrderIndex orderIndex = new OrderIndex(odCode, gdName, odDate, qty, pay);
				list.add(orderIndex);

			}

		} finally {
			DbUtil.dbClose(rs, ps, con);
		}

		return list;
	}

	public int insertContact(PrivateQuestion pq) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "INSERT INTO PRIVATE_QUESTION VALUES (?, ?, ?, ?, ?, ?, ?, '신청대기', SYSDATE)";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, pq.getOdCode());
			ps.setString(2, pq.getMbName());
			ps.setString(3, pq.getTel());
			ps.setString(4, pq.getEmail());
			ps.setString(5, pq.getTitle());
			ps.setString(6, pq.getContent());
			ps.setString(7, pq.getType());

			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(ps, con);
		}

		return result;

	}

	public List<PrivateQuestion> selectPqAll(int mbCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<PrivateQuestion> pqList = new ArrayList<PrivateQuestion>();
		/* List<OrderIndex> odList = new ArrayList<OrderIndex>(); */
		/* Map<String, List<?>> map = new HashMap<String, List<?>>(); */
		

		String sql = "SELECT OD_CODE, G_ORDER.MB_CODE, PRIVATE_QUESTION.TITLE, PRIVATE_QUESTION.CONTENT, PRIVATE_QUESTION.TYPE, PRIVATE_QUESTION.STATE, TO_CHAR(PRIVATE_QUESTION.SUBMIT_DATE, 'YYYY/MM/DD AMHH24:MI:SS')\r\n"
				+ "FROM G_ORDER JOIN PRIVATE_QUESTION\r\n"
				+ "USING (OD_CODE) WHERE MB_CODE = ? ORDER BY (OD_CODE)ASC";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, mbCode);
			rs = ps.executeQuery();

			while (rs.next()) {

				int odCode = rs.getInt(1);
				String title = rs.getString(3);
				String content = rs.getString(4);
				String type = rs.getString(5);
				String state = rs.getString(6);
				String pqDate = rs.getString(7);

				/* odList.add(new OrderIndex(odCode, gdName, odDate, qty, pay)); */
				pqList.add(new PrivateQuestion(odCode, title, content, type, state, pqDate));

			}

			/* map.put("odList", odList); */
			/* map.put("pqList", pqList); */

		} finally {
			DbUtil.dbClose(rs, ps, con);

		}
		return pqList;
	}

	
	
	
	
	public int deletePq(int odCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "DELETE FROM PRIVATE_QUESTION WHERE OD_CODE = ?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, odCode);

			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(ps, con);
		}

		return result;

	}
}
