package kosta.dao.cart;

import java.sql.SQLException;
import java.util.List;

import kosta.dto.CartDTO;
import kosta.dto.Goods;
import kosta.dto.SizeDTO;

public interface CartDAO {
	/**
	 * Cart.jsp에서 장바구니 전체 목록 보여주는 메소드 
	 */
	public List<CartDTO> viewCart() throws SQLException;
	
	/**
	 * single-product.html에서 단일상품 장바구니에 넣어주는 메소드 
	 */
	public int addToCart(Goods goods, int qty, int mbCode) throws SQLException;
	
	/**
	 * Cart.jsp에서 장바구니 목록에서 단일상품 제거하는 메소드 
	 */
	public int delete() throws SQLException;
	
}
