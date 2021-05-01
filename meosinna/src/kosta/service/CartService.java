package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.CartDTO;
import kosta.dto.Goods;
import kosta.dto.Member;

public interface CartService {
	
	public List<CartDTO> viewCart(int mbCode) throws SQLException;
	
	public void addToCart(Goods goods, int qty, Member member, int size) throws SQLException;
	
	public void deleteCart(int mbCode, String gdCode) throws SQLException;
	
	public void clearCart(int mbCode) throws SQLException;
	
	public int getCartQty(int mbCode) ;
}
