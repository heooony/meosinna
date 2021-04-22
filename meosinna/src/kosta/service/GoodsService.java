package kosta.service;

import java.sql.SQLException;

import kosta.dao.GoodsDAO;
import kosta.dao.GoodsDAOImpl;
import kosta.dto.GoodsDTO;

public interface GoodsService {

	
	
	/**
	 * 상품검색 - 상품명 별 검색
	 * */
	
	
	
	
	/**
	 * 상품검색 - 제조사 별 검색
	 * */



   /**
    * 상품검색 - 가격대 별 검색
    * */



   /**
    * 상품검색 - 시간제한 할인 상품  배너에 출력
    * */
	
	/**
	 * 등록
	 * */
	public void insert(GoodsDTO goodsDTO) throws SQLException;

	/**
	 * 삭제
	 * */
	public void delete(String gdCode) throws SQLException;
	/**
	 * 수정
	 * */
	public void update(GoodsDTO dto) throws SQLException;



   /**
    * 상품 품절여부 표시
    * */



   /**
    * 자주 검색한 상품과 같은 태그 달고있는 상품 우선순위로 보이기
    * */

	
	
	/**
	 * 상품 주문 -상세 페이지에서 바로 구매 
	 * */
	
	
	/**
	 * 상품 주문 - 장바구니 내 상품들 일괄/선택 구매 
	 * */

}
