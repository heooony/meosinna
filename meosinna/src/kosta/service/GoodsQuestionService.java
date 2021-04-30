package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dao.GoodsQuestionDAO;
import kosta.dao.GoodsQuestionDAOImpl;
import kosta.dto.GoodsQuestion;

public class GoodsQuestionService {
	GoodsQuestionDAO dao = new GoodsQuestionDAOImpl();
	
	public void insertGQbyMbCode(GoodsQuestion gq) throws SQLException{
		int result = dao.insertGQbyMbCode(gq);
		if(result==0) {
			throw new SQLException("상품 문의가 등록되지 않았습니다.");
		}
	}
	
	public List<GoodsQuestion> selectByGdCode(String gdCode) throws SQLException{
		List<GoodsQuestion> list = dao.selectByGdCode(gdCode);
		if(list == null) {
			throw new SQLException("상품 문의 게시문이 존재하지 않습니다.");
		}
		return list;
	}
}
