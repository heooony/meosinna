package kosta.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.Goods;


public interface GoodsDAO {
	
	/**
	 * 전체검색
	 * */
	List<Goods> selectAll() throws SQLException;
	
	/**
	 * 상품명 검색
	 * */
	Goods selectByGdName(String gdName) throws SQLException;
	
	/**
	 * 상품코드 검색
	 * */
	Goods selectByGdCode(String gdName) throws SQLException;
	
	
	/**
	 * 브랜드 검색
	 * */
	 Goods selectByBrand(String gdBrand) throws SQLException;
	  
	  
	/**
	 * 가격대 검색  - 여러개 담아!
	 * */
	  List<Goods> selectByPrice (int min, int max) throws SQLException;
	
	/**
	 * 좋아요 증가 기능???
	 * */
	int increamentByGdLike(String gdCode) throws SQLException;
	
	/**
	* 레코드 삽입
	* @return : 1-삽입성공 , 0 - 삽입실패
	* */
	int insert(Goods goods) throws SQLException;
	  
	/**
	 * 모델번호에 해당하는 레코드 삭제
	 * @return : 1-삭제성공 , 0 - 삭제실패
	 * */
	int delete(String gdCode) throws SQLException;
	  
	/**
	* 모델번호에 해당하는 레코드 수정
	* @return : 1-수정성공 , 0 - 수정실패
	* */
	int update(Goods goods) throws SQLException;
	
	/**
	 * 품절여부 
	 * -qty 0 될 때 이미지 opacity 0.2로
	 * */
	int soldOut(int qty) throws SQLException; 
	
	/**
	 * 좋아요 기능 
	 * 
	 * 숫자1증가 , 감소 - database안에서 쿼리문 작성 먼저! 
	 * update!
	 *  특정 유저의 좋아요 증가 !
	 * 
	 * */
	
	int updateLikes(String gdCode) throws SQLException; 
	
	  /**
	   * 상품 상세페이지 
	   * 상품이름, 코드, 가격,, 등 정보 
	   * return goods 
	   * */
	
	Goods gdDetail(String gdCode) throws SQLException; 

	/**
	 * 페이징
	 * */
	List<Goods> getGoodsList(int pageNo) throws SQLException;

	int checkLike(int mbCode, String gdCode) throws SQLException ;
	
	/**
	 * 낮은 가격순 정렬
	 * */
	List<Goods> selectAllByPriceAsc() throws SQLException;
	
	/**
	 * 높은 가격순 정렬
	 * */
	List<Goods> selectAllByPriceDesc() throws SQLException;
	
	  
}