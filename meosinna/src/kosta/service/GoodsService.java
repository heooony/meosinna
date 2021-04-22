package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.Goods;

public interface GoodsService {
	


	/**
	 *전체검색
	 * */
	List<Goods> selectAll() throws SQLException;
	/*public List<Goods> selectAll() throws SQLException{
		List<Goods> list = goodsDao.selectAll();
		if(list.size()==0)throw new SQLException("ERROR : 등록된 상품정보가 없습니다.");
		return list;
	}*/

	/**
	 * 상품검색 - 상품명 별 검색
	 * */
	Goods selectByGdName(String gdName) throws SQLException;
	/*public List<Goods> selectByGdName() throws SQLException{
		List<Goods> list = goodsDao.selectByGdName();
		if(list.size()==0)throw new SQLException("ERROR : 해당하는 이름에 대한 상품정보가 없습니다.");
		return list;
	}*/

	/**
	 * 상품검색 - 브랜드 별 검색
	 * */
	Goods selectByBrand(String brand) throws SQLException;
	/*public List<Goods> selectByGdBrand() throws SQLException{
		List<Goods> list = goodsDao.selectByGdBrand();
		if(list.size()==0)throw new SQLException("ERROR : 해당하는 브랜드에 대한 상품정보가 없습니다.");
		return list;
	}*/

   /**
    * 상품검색 - 가격대 별 검색
    * */
	Goods selectByPrice(int price) throws SQLException;
	/*public List<Goods> selectByGdPrice() throws SQLException{
		List<Goods> list = goodsDao.selectByGdPrice();
		if(list.size()==0)throw new SQLException("ERROR : 해당하는 가격대에 대한 상품정보가 없습니다.");
		return list;
	}*/


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




}
