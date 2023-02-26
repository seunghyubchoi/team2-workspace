package com.kh.payment.model.dao;

import java.io.Closeable;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.myPage.model.vo.Cart;
import com.kh.payment.model.vo.Location;

public class PaymentDao {
	
	private Properties prop = new Properties();
	
	public PaymentDao() {
		String filePath = PaymentDao.class.getResource("/db/sql/payment-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Location selectLocation(Connection conn, int memNo) {
		Location defaultLocation = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLocation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				defaultLocation = new Location(
						  rset.getInt("loc_no")
						, rset.getInt("mem_no")
						, rset.getString("loc_address_name")
						, rset.getString("loc_name")
						, rset.getString("loc_phone")
						, rset.getString("loc_address")
						, rset.getString("loc_address_dtl")
						, rset.getString("loc_post_code")
						, rset.getString("del_yn")
						, rset.getString("loc_yn")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return defaultLocation;
	}
	
	public int insertCart(Connection conn,int mno,int pno,int amount, String size) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, amount);
			pstmt.setInt(2, pno);
			pstmt.setInt(3, mno);
			pstmt.setString(4, size);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public ArrayList<Cart> selectCart(Connection conn,int MemNo){
		ArrayList<Cart> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, MemNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Cart(rset.getString("product_name"),
								  rset.getInt("product_discount"),
								  rset.getInt("product_price"),
								  rset.getInt("cart_no"),
								  rset.getInt("cart_qnt"),
								  rset.getString("cart_size"),
								  rset.getInt("mileage"),
								  rset.getString("brand_name"),
								  rset.getString("product_img_src")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int deleteCart(Connection conn, int cartNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cartNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int checkCart(Connection conn,int mno,int pno,String size) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			pstmt.setInt(2, pno);
			pstmt.setString(3, size);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("cart_no");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateQnt(Connection conn,int qnt,int cartNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateQnt");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnt);
			pstmt.setInt(2, cartNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
