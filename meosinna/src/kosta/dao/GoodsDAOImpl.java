package kosta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import kosta.dto.Goods;
import kosta.dto.PageCnt;
import kosta.util.DbUtil;

public class GoodsDAOImpl implements GoodsDAO {

	Properties proFile = new Properties();
	
	public GoodsDAOImpl () {
		/*
		 * try { proFile.load(getClass().getClassLoader().getResourceAsStream(
		 * "dbQuery.properties"));
		 * 
		 * String str = proFile.getProperty("query.select"); System.out.println("str = "
		 * + str); }catch (Exception e) { e.printStackTrace(); }
		 */
	}

	
	
	/**
	 * 상품 전체검색 
	 * */

	@Override
	public List<Goods> selectAll() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Goods> list = new ArrayList<Goods>();
		
		String sql = "select * from goods" ;
		

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Goods dto = new Goods(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
				
				list.add(dto);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return list;
	}

	
	/**
	 * 상품명 검색 
	 * */

	@Override
	public Goods selectByGdName(String gdName) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Goods dto = null;
		String sql = "select * from goods where gd_name=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, gdName);

			rs = ps.executeQuery();

			if (rs.next()) {
				dto = new Goods(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
			}

		} finally {
			DbUtil.dbClose(rs, ps, con);
		}

		return dto;
	}

	/**
	 * 브랜드 검색
	 */
	public List<Goods> selectByBrand(String GdBrand) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Goods> list = new ArrayList<Goods>();
		Goods goods = null;

		String sql = "select * from goods where upper(brand) like  upper(?)";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1,"%"+GdBrand+"%");

			rs = ps.executeQuery();

		   while (rs.next()) {
				goods = new Goods(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
				
				list.add(goods);
		   }
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}
	

	/**
	 * 가격대 별 검색
	 */
	@Override
	  public List<Goods> selectByPrice (int min, int max) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null; 
		List<Goods> list = new ArrayList<Goods>();
		Goods goods = null;
		
		String sql = "select * from goods where price between ? AND ? order by price asc";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, min);
			ps.setInt(2, max);

			rs = ps.executeQuery();
			
			while(rs.next()) {
				goods = new Goods(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
				
				list.add(goods); 
			}

		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}
	
	/**
	 * 좋아요 수 증가
	 */
	@Override
	public int increamentByGdLike(String gdCode) throws SQLException {

		return 0;
	}

	/**
	 * 레코드 추가
	 */
	@Override
	public int insert(Goods goodsDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "insert into goods values(?,?,?,?,?,?,?,?)";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, goodsDTO.getGdCode());
			ps.setString(2, goodsDTO.getGdName());
			ps.setInt(3, goodsDTO.getPrice());
			ps.setString(4, goodsDTO.getBrand());
			ps.setInt(5, goodsDTO.getGdLike());
			ps.setString(6, goodsDTO.getStCode());
			ps.setString(7, goodsDTO.getGdContent());
			ps.setString(8, goodsDTO.getImg());
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	
	/**
	 * 모델번호에 해당하는 레코드 삭제 
	 * */

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
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}


	/**
	 * 모델번호에 해당하는 레코드 수정
	 */
	@Override
	public int update(Goods goodsDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;

		String sql = "update goods set gd_name=?,price=?,brand=?,gd_content=?,img=? where gd_code=?";

		try {
			ps.setString(1, goodsDTO.getGdName());
			ps.setInt(2, goodsDTO.getPrice());
			ps.setString(3, goodsDTO.getBrand());
			ps.setString(4, goodsDTO.getGdContent());
			ps.setString(5, goodsDTO.getImg());
			ps.setString(6, goodsDTO.getGdCode());


		} finally {
			DbUtil.dbClose(ps, con);
		}

		return result;
	}

	/**
	 * 상품코드 검색
	 */
	@Override
	public Goods selectByGdCode(String gdCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Goods dto = null;

		String sql = "select * from goods where gd_code=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, gdCode);


			rs = ps.executeQuery();

			if (rs.next()) {
				dto = new Goods(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
			}

		} finally {
			DbUtil.dbClose(rs, ps, con);
		}

		return dto;
	}

	
	
	 /*
	  *  페이징
	 * */
	@Override
	public List<Goods> getGoodsList(int pageNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps =null;
		ResultSet rs =null;
		List<Goods> list = new ArrayList<Goods>();
		
		String sql="SELECT * FROM (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM goods ORDER BY gd_name ASC) a WHERE ROWNUM <= ?)  WHERE rnum >= ?";
		try {
			int totalCount = getSelectTotalCount();
			
			PageCnt page= new PageCnt();
			//전체 페이지 구하기 =>총상품수/페이지당 상품수 +1
			page.setPageCnt(totalCount % page.getPageSize() == 0 ? totalCount / page.getPageSize() : totalCount / page.getPageSize() + 1); //3항 연산자
			page.setPageNo(pageNo);
			
			con = DbUtil.getConnection();
			//전체 상품수 가져오기
			ps= con.prepareStatement(sql);
			ps.setInt(1, pageNo * page.getPageSize() );
			ps.setInt(2, (pageNo - 1) * page.getPageSize() + 1);
			
			//상품 가져오기
			rs = ps.executeQuery(); 
			while(rs.next()) {
				Goods goods = new Goods(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
				
				list.add(goods);
			}
			
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		

		return list;
	}
	
	/**
	 * totalCount 총 컬럼수 카운트
	 * */
	public int getSelectTotalCount() throws SQLException{
    	Connection con=null;
		PreparedStatement ps =null;
		ResultSet rs =null;
		int result=0;
		
		String sql="select count(*) from goods";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				 result =rs.getInt(1);
			}			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return result;
    }


	@Override
	public void updateLikes(Connection con, int mbCode, String gdCode) throws SQLException {
		PreparedStatement ps = null;
		int result = 0;
		String sql = "INSERT INTO LIKES VALUES(?, ?, SYSDATE)";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, mbCode);
			ps.setString(2, gdCode);
			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(ps, null);
		}
	}
	
	@Override
	public void deleteLikes(Connection con, int mbCode, String gdCode) throws SQLException {
		PreparedStatement ps = null;
		int result = 0;
		String sql = "DELETE FROM LIKES WHERE MB_CODE = ? AND GD_CODE = ?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, mbCode);
			ps.setString(2, gdCode);
			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(ps, null);
		}
	}

	/**
	 * 품절여부 -qty 0이 될 때 이미지 opacity 0.2로
	 */

	public int soldOut(int qty) throws SQLException {
//   Connection con = null;
//   PreparedStatement ps = null;
//  int result =0; 
//  String sql = " ";
//  
//  try {
//	  con=DbUtil.getConnection();
//	  ps= con.prepareStatement(sql);
//	  ps.setString(, sql);
//  }

		return qty;
//   
	}

	/**
	 * 상품 상세페이지 이동
	 * 
	 */
	public Goods gdDetail(String gdCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "Select * from goods where gd_code =?";
		Goods goods = null;

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, gdCode);
			rs = ps.executeQuery();

			if (rs.next()) {
				goods = new Goods(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8));

			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return goods;
	}


	@Override
	public List<Goods> selectAllByPriceAsc(int pageNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps =null;
		ResultSet rs =null;
		List<Goods> list = new ArrayList<Goods>();
		
		String sql="SELECT * FROM (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM goods ORDER BY price ASC) a WHERE ROWNUM <= ?)  WHERE rnum >= ?";
		try {
			int totalCount = getSelectTotalCount();
			
			PageCnt page= new PageCnt();
			//전체 페이지 구하기 =>총상품수/페이지당 상품수 +1
			page.setPageCnt(totalCount % page.getPageSize() == 0 ? totalCount / page.getPageSize() : totalCount / page.getPageSize() + 1); //3항 연산자
			page.setPageNo(pageNo);
			
			con = DbUtil.getConnection();
			//전체 상품수 가져오기
			ps= con.prepareStatement(sql);
			ps.setInt(1, pageNo * page.getPageSize() );
			ps.setInt(2, (pageNo - 1) * page.getPageSize() + 1);
			
			//상품 가져오기
			rs = ps.executeQuery(); 
			while(rs.next()) {
				Goods goods = new Goods(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
				
				list.add(goods);
			}
			
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		

		return list;
	}
	public int setGdLike(int mbCode, String gdCode, String isLike) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = null;
		System.out.println(isLike);
		if(Integer.parseInt(isLike) == 0) {
			this.updateLikes(con, mbCode, gdCode);
			sql = "UPDATE GOODS SET GD_LIKE = GD_LIKE + 1 WHERE GD_CODE = ?";
		} else {
			this.deleteLikes(con, mbCode, gdCode);
			sql = "UPDATE GOODS SET GD_LIKE = GD_LIKE - 1 WHERE GD_CODE = ?";
		}
		int result = 0;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, gdCode);
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}


	@Override
	public List<Goods> selectAllByPriceDesc(int pageNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps =null;
		ResultSet rs =null;
		List<Goods> list = new ArrayList<Goods>();
		
		String sql="SELECT * FROM (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM goods ORDER BY price desc) a WHERE ROWNUM <= ?)  WHERE rnum >= ?";
		try {
			int totalCount = getSelectTotalCount();
			
			PageCnt page= new PageCnt();
			//전체 페이지 구하기 =>총상품수/페이지당 상품수 +1
			page.setPageCnt(totalCount % page.getPageSize() == 0 ? totalCount / page.getPageSize() : totalCount / page.getPageSize() + 1); //3항 연산자
			page.setPageNo(pageNo);
			
			con = DbUtil.getConnection();
			//전체 상품수 가져오기
			ps= con.prepareStatement(sql);
			ps.setInt(1, pageNo * page.getPageSize() );
			ps.setInt(2, (pageNo - 1) * page.getPageSize() + 1);
			
			//상품 가져오기
			rs = ps.executeQuery(); 
			while(rs.next()) {
				Goods goods = new Goods(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
				
				list.add(goods);
			}
			
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		

		return list;
	}
	
	public int checkLike(int mbCode, String gdCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM LIKES WHERE MB_CODE = ? AND GD_CODE = ?";
		int count = 0;

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setInt(1, mbCode);
			ps.setString(2, gdCode);
			rs = ps.executeQuery();

			if (rs.next()) {
				count++;
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}

		return count;
	}



	@Override
	public List<Goods> selectOrderByLike() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Goods> list = new ArrayList<Goods>();
		
		String sql = "SELECT * FROM GOODS JOIN S_SIZE USING(GD_CODE) WHERE QTY > 0 AND S_SIZE = 260 ORDER BY GD_LIKE DESC";
		

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Goods dto = new Goods(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
				
				list.add(dto);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return list;
	}



	@Override
	public Map<Integer, Integer> getSizeQty(String gdCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		
		String sql = "SELECT S_SIZE, QTY FROM S_SIZE WHERE GD_CODE=? ORDER BY S_SIZE";
		

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, gdCode);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				map.put(rs.getInt(1), rs.getInt(2));
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return map;
	}



	@Override
	public List<Goods> getRecommended(int mbCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Goods> list = new ArrayList<Goods>();
		
		String sql = "SELECT GD_CODE, GD_NAME, PRICE, BRAND, GD_LIKE, ST_CODE, GD_CONTENT, IMG FROM GOODS JOIN (SELECT ST_CODE, COUNT(ST_CODE) AS C FROM GOODS JOIN LIKES USING(GD_CODE) WHERE MB_CODE=? GROUP BY ST_CODE) USING(ST_CODE) ORDER BY(C) DESC";
		

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, mbCode);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Goods dto = new Goods(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
				
				list.add(dto);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return list;
	}
}
