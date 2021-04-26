package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dao.GoodsQuestionDAO;
import kosta.dao.GoodsQuestionDAOImpl;
import kosta.dto.GoodsQuestion;

public class GoodsQuestionService {
	GoodsQuestionDAO dao = new GoodsQuestionDAOImpl();
	
	public List<GoodsQuestion> selectGQAll(int mbCode) throws SQLException{
		List<GoodsQuestion> list = dao.selectGQAll(mbCode);
		if(list==null) {
			throw new SQLException("상품 문의에 대한 정보가 없습니다.");
		}
		return list;
	}
}
