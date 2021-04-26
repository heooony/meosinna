package kosta.service;

import java.sql.SQLException;
import java.util.List;

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
	Goods selectByBrand(String brand) throws SQLException;
	

   /**
    * 상품검색 - 가격대 별 검색
    * */
	Goods selectByPrice(int price) throws SQLException;
	


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
    * 상품 품절여부 표시
    * */



   /**
    * 자주 검색한 상품과 같은 태그 달고있는 상품 우선순위로 보이기
    * */



  /**
   *  좋아요....
   * */
	public void updateLikes(String gdCode) throws SQLException; 
	
	public Goods selectByGdCode(String gdCode) throws SQLException;
	/**
	 * 상세페이지
	 * */
     public Goods gdDetail(String gdCode) throws SQLException; 
	
}
