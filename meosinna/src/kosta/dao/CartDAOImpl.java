package kosta.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import kosta.dto.CartDTO;
import kosta.dto.Goods;
import kosta.util.DbUtil;

public class CartDAOImpl implements CartDAO {

	@Override
	public List<CartDTO> viewCart(int mbCode) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<CartDTO> list = new ArrayList<CartDTO>();
		String sql = "SELECT * FROM CART WHERE MB_CODE=?";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, mbCode);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new CartDTO(rs.getString(1), rs.getString(2), rs.getInt(3), 
						rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getString(7)));
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}
	/** @author Lee SeungHyun
	 * 
	 *  장바구니 TABLE에 하나의 레이블로 추가될 값들은 single-product.html에서 선택된 값들을 가져와야 한다.
	 *  그렇다면 과연 어떤 scope에(request / session / application) 선택된 값들을 저장할 것이며
	 *  어떻게 가져오는가?
	 *  그리고 DAO객체와 어떻게 연결지을 것인가?
	 * 
	 */
	@Override
	public int addToCart(Goods goods , int qty, int mbCode, int size) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String selectSql="SELECT * FROM CART WHERE GD_CODE=? AND S_SIZE=? AND MB_CODE=?";
		String updateSql="UPDATE CART SET QTY=QTY+? WHERE GD_CODE=?";
		String insertSql="INSERT INTO CART VALUES(?,?,?,?,?,?,?)";
		ResultSet rs = null;
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(selectSql);
			ps.setString(1, goods.getGdCode());
			ps.setInt(2, size);
			ps.setInt(3, mbCode);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				DbUtil.dbClose(rs, ps, null);
				ps = con.prepareStatement(updateSql);
				
				ps.setInt(1, qty);		
				ps.setString(2, goods.getGdCode());
				
				result = ps.executeUpdate();
						
			} else {
				DbUtil.dbClose(rs, ps, null);
				ps=con.prepareStatement(insertSql);
				
				ps.setString(1, goods.getGdCode());
				ps.setString(2, goods.getGdName());
				ps.setInt(3, size);
				ps.setInt(4, goods.getPrice());
				ps.setInt(5, qty);
				ps.setInt(6, mbCode);
				ps.setString(7,  goods.getImg());
				System.out.println("mbCode = " + mbCode);
				result = ps.executeUpdate();
			}
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int deleteCart(int mbCode, String gdCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "DELETE FROM CART WHERE MB_CODE=? AND GD_CODE=?";
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, mbCode);
			ps.setString(2, gdCode);
			
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}
	
	public int clearCart(int mbCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "DELETE FROM CART WHERE MB_CODE=?";
		int result = 0;
		try{
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, mbCode);
			
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}
	
	@Override
	public int getCartQty(int mbCode) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT QTY FROM CART WHERE MB_CODE=?";
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, mbCode);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				result += rs.getInt(1);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return result;
	}

}
