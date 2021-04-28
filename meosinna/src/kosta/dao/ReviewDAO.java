package kosta.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.Review;


public interface ReviewDAO {
	List<Review> selectByGdCode(String gdCode) throws SQLException;
	
	int insertByMbName(Review review) throws SQLException;
}
