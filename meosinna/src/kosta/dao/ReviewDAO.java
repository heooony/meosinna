package kosta.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.Review;


public interface ReviewDAO {
	List<Review> select() throws SQLException;
}
