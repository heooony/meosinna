package kosta.service;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.CartDTO;
import kosta.dto.GoodsDTO;

public interface CartService {
	
	public List<CartDTO> viewCart() throws SQLException;
	
	public void addToCart(GoodsDTO goods, int qty, int mbCode) throws SQLException;
	
	
	
}
