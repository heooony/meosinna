package kosta.service;

import java.sql.SQLException;

import kosta.dao.GoodsDAO;
import kosta.dao.GoodsDAOImpl;
import kosta.dto.GoodsDTO;

public class GoodsServiceImpl implements GoodsService {

	private GoodsDAO goodsDAO = new GoodsDAOImpl();
	
	@Override
	public void insert(GoodsDTO goodsDTO) throws SQLException {
		int result = goodsDAO.insert(goodsDTO);
		if(result==0) throw new SQLException("등록되지 않았습니다.");

	}

	@Override
	public void delete(String gdCode) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(GoodsDTO dto) throws SQLException {
		// TODO Auto-generated method stub

	}

}
