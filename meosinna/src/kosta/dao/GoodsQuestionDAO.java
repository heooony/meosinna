package kosta.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.GoodsQuestion;

public interface GoodsQuestionDAO {
	List<GoodsQuestion> selectGQAll(int mbCode) throws SQLException;
}
