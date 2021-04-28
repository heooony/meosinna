package kosta.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * 
 * */
public class DbUtil {
	static DataSource ds;
    /**
     
     * */
	static {
		try {
		  Context initContext = new InitialContext();
		  ds = (DataSource)initContext.lookup("java:/comp/env/jdbc/myoracle");
		  System.out.println("ds = " + ds);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * */
	public static Connection getConnection() throws SQLException{
		return  ds.getConnection();
	} 
	
	/**
	 * 
	 * */
	public static void dbClose(Statement st, Connection con){
		try {
		  if(st!=null) st.close();
		  if(con!=null) con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * */
    public static void dbClose(ResultSet rs , Statement st, Connection con){
    	try {
		  if(rs!=null)rs.close();
		  dbClose(st, con);
    	}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}








