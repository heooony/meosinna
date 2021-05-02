package kosta.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.GoodsQuestion;

public interface GoodsQuestionDAO {
	int insertGQbyMbCode(GoodsQuestion gq) throws SQLException;
	List<GoodsQuestion> selectByGdCode(String gdCode) throws SQLException;
	List<GoodsQuestion> selectGQAll(String mbName) throws SQLException;
}
