package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dao.GoodsDAO;
import kosta.dao.GoodsDAOImpl;
import kosta.dto.Goods;

public class GoodsServiceImpl implements GoodsService {

	private GoodsDAO goodsDAO = new GoodsDAOImpl();
	
	@Override
	public void insert(Goods goods) throws SQLException {
		int result = goodsDAO.insert(goods);
		if(result==0) throw new SQLException("ERROR : 등록되지 않았습니다.");

	}

	@Override
	public void delete(String gdCode) throws SQLException {
		if(goodsDAO.delete(gdCode)==0) {
			throw new SQLException("ERROR : 삭제 실패했습니다.");
		}
		
	}

	@Override
	public void update(Goods goods) throws SQLException {
		Goods dbGoods = goodsDAO.selectByGdCode(goods.getGdCode());
		if(!dbGoods.getGdCode().equals(goods.getGdCode())) {
			throw new SQLException("ERROR : 상품코드가 일치하지 않습니다");
		}
		
		

	}

	@Override
	public List<Goods> selectAll() throws SQLException {
		List<Goods> list = goodsDAO.selectAll();
		if(list.size()==0)throw new SQLException("ERROR : 등록된 상품정보가 없습니다.");
		return list;
	}

	@Override
	public Goods selectByGdName(String gdName) throws SQLException {
		Goods goods = goodsDAO.selectByGdName(gdName);
		if(goods==null) {
			throw new SQLException("ERROR : 해당하는 브랜드에 대한 상품정보가 없습니다.");
		}
		return goods;
	}

	@Override
	public Goods selectByBrand(String brand) throws SQLException {
		Goods goods = goodsDAO.selectByBrand(brand);
		if(goods==null) {
			throw new SQLException("ERROR : 해당하는 브랜드에 대한 상품정보가 없습니다.");
		}
		return goods;
	}

	@Override
	public Goods selectByPrice(int price) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
