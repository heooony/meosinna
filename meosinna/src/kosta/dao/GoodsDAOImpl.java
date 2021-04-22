package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import kosta.dto.GoodsDTO;
import kosta.util.DbUtil;

public class GoodsDAOImpl implements GoodsDAO {

	Properties proFile = new Properties();
	
	public GoodsDAOImpl () {
		try {	
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
			
			String str = proFile.getProperty("query.select");
			System.out.println("str = " + str);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<GoodsDTO> selectAll() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();
		
		String sql = "select * from goods" ;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				GoodsDTO dto = new GoodsDTO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getInt(6),
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
				
				list.add(dto);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return list;
	}

	@Override
	public GoodsDTO selectByGdName(String gdName) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		GoodsDTO dto = null;
		
		String sql = "select * from Electronics where gd_name=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, gdName);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new GoodsDTO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getInt(6),
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return dto;
	}

	@Override
	public int increamentByGdLike(String gdCode) throws SQLException {
		
		return 0;
	}

	@Override
	public int insert(GoodsDTO goodsDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "insert into good values(?,?,?,?,?,?,?,?,?,?)";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, goodsDTO.getGdCode());
			ps.setString(2, goodsDTO.getGdName());
			ps.setInt(3, goodsDTO.getQty());
			ps.setInt(4, goodsDTO.getPrice());
			ps.setString(5, goodsDTO.getBrand());
			ps.setInt(6, goodsDTO.getGdLike());
			ps.setString(7, goodsDTO.getSzCode());
			ps.setString(8, goodsDTO.getStCode());
			ps.setString(9, goodsDTO.getGdContent());
			ps.setString(10, goodsDTO.getImg());
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int delete(String gdCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "delete goods where gd_code = ?";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, gdCode);
			
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int update(GoodsDTO goodsDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "update goods set gd_name=?.qty=?,price=?,brand=?,gd_content=?,img=? where gd_code=?" ;
		
		try {
			ps.setString(1, goodsDTO.getGdName());
			ps.setInt(2, goodsDTO.getQty());
			ps.setInt(3, goodsDTO.getPrice());
			ps.setString(4, goodsDTO.getBrand());
			ps.setString(5, goodsDTO.getGdContent());
			ps.setString(6, goodsDTO.getImg());
			ps.setString(7, goodsDTO.getGdCode());
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
				
		return result;
	}

}
