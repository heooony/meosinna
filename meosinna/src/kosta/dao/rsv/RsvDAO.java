package kosta.dao.rsv;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.Member;
import kosta.dto.RSV;

public interface RsvDAO {
	public List<RSV> selectRsv(Member member) throws SQLException;
}
