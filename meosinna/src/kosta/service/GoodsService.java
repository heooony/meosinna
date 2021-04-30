package kosta.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kosta.dto.Goods;

public interface GoodsService {
	


	/**
	 *전체검색
	 * */
	List<Goods> selectAll() throws SQLException;
	

	/**
	 * 페이징
	 * */
	List<Goods> selectAll(int pageNo) throws SQLException;

	/**
	 * 상품검색 - 상품명 별 검색
	 * */
	Goods selectByGdName(String gdName) throws SQLException;
	

	/**
	 * 상품검색 - 브랜드 별 검색
	 * */
	List<Goods> selectByBrand(String GdBrand) throws SQLException;
	

   /**
    * 상품검색 - 가격대 별 검색
    * */
	List<Goods> selectByPrice(int min, int max) throws SQLException;
	


   /**
    * 상품검색 - 시간제한 할인 상품  배너에 출력
    * */

	/**
	 * 등록
	 * */
	public void insert(Goods goods) throws SQLException;

	/**
	 * 삭제
	 * */
	public void delete(String gdCode) throws SQLException;
	
	/**
	 * 수정
	 * */
	public void update(Goods goods) throws SQLException;

	

   /**
    * 상품 품절여부 표시 - front에서 처리 
    * */




	
	public Goods selectByGdCode(String gdCode) throws SQLException;
	
	
	/**
	 * 상세페이지
	 * */
     public Goods gdDetail(String gdCode) throws SQLException; 

     
     /**
 	 * 낮은 가격순 정렬
 	 * */
 	List<Goods> selectAllByPriceAsc(int pageNo) throws SQLException;
 	
 	/**
 	 * 높은 가격순 정렬
 	 * */
 	List<Goods> selectAllByPriceDesc(int pageNo) throws SQLException;
     


	int checkLike(int mbCode, String gdCode) throws SQLException ;


	List<Goods> selectOrderByLike() throws SQLException;


	Map<Integer, Integer> getSizeQty(String gdCode) throws SQLException; 
	
}
