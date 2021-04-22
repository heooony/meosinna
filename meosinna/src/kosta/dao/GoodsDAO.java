package kosta.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.GoodsDTO;


public interface GoodsDAO {
	
	/**
	 * 전체검색
	 * */
	List<GoodsDTO> selectAll() throws SQLException;
	
	/**
	 * 상품명 검색
	 * */
	GoodsDTO selectByGdName(String gdName) throws SQLException;
	
	/**
	 * 좋아요 증가 기능???
	 * */
	int increamentByGdLike(String gdCode) throws SQLException;
	
	/**
	* 레코드 삽입
	* @return : 1-삽입성공 , 0 - 삽입실패
	* */
	int insert(GoodsDTO goodsDTO) throws SQLException;
	  
	/**
	 * 모델번호에 해당하는 레코드 삭제
	 * @return : 1-삭제성공 , 0 - 삭제실패
	 * */
	int delete(String gdCode) throws SQLException;
	  
	/**
	* 모델번호에 해당하는 레코드 수정
	* @return : 1-수정성공 , 0 - 수정실패
	* */
	int update(GoodsDTO goodsDTO) throws SQLException;
	  
}
