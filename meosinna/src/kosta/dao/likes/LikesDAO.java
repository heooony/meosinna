package kosta.dao.likes;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.Likes;
import kosta.dto.Member;

public interface LikesDAO {
	public List<Likes> selectLikes(Member member) throws SQLException;
}
