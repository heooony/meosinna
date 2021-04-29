package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dao.CartDAO;
import kosta.dao.CartDAOImpl;
import kosta.dto.CartDTO;
import kosta.dto.Goods;

public class CartServiceImpl implements CartService{
	CartDAO dao = new CartDAOImpl();
	
	public List<CartDTO> viewCart(int mbCode) throws SQLException {
		List<CartDTO> list = dao.viewCart(mbCode);
		//if(list == null || list.size()==0 || list.isEmpty()) throw new SQLException("장바구니에 상품이 없습니다.");
		
		return list;
	}
	
	
	public void addToCart(Goods goods, int qty, int mbCode) throws SQLException {
		int result = dao.addToCart(goods, qty, mbCode);
		if(result == 0) throw new SQLException("장바구니에 추가되지 않았습니다.");
	}
	
	public void deleteCart(int mbCode, String gdCode) throws SQLException {
		int result = dao.deleteCart(mbCode, gdCode);
		if(result==0) throw new SQLException("삭제되지 않았습니다");
	}
	
	public void clearCart(int mbCode) throws SQLException {
		int result = dao.clearCart(mbCode);
		if(result==0) throw new SQLException("장바구니가 비워지지 않았습니다.");
	}
	
	
}
