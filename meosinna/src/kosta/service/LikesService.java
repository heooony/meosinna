package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dao.likes.LikesDAO;
import kosta.dao.likes.LikesDAOImpl;
import kosta.dto.Likes;
import kosta.dto.Member;

public class LikesService {
	LikesDAO dao = new LikesDAOImpl();
	
	public List<Likes> selectLikes(int mbCode) throws SQLException{
		List<Likes> list = dao.selectLikes(mbCode);
		
		if(list == null) {
			throw new SQLException("~");
		}
		
		return list;
	}
}
