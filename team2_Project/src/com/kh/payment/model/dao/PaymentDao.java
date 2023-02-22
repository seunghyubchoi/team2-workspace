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

	public ArrayList<Location> selectLocationList(Connection conn, int memNo) {
		ArrayList<Location> list = new ArrayList<Location>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLocationList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(
						 new Location(
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
								)
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public Location selectLocationByLocationNo(Connection conn, int locNo) {
		Location location = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLocationByLocationNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, locNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				location = new Location(
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
		return location;
	}

	public int updateLocation(Connection conn, Location l) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateLocation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, l.getLocAddressName());
			pstmt.setString(2, l.getLocName());
			pstmt.setString(3, l.getLocPhone());
			pstmt.setString(4, l.getLocAddress());
			pstmt.setString(5, l.getLocAddressDtl());
			pstmt.setString(6, l.getLocPostCode());
			pstmt.setString(7, l.getLocYn());
			pstmt.setInt(8, l.getLocNo());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertLocation(Connection conn, Location l) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLocation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, l.getMemNo());
			pstmt.setString(2, l.getLocAddressName());
			pstmt.setString(3, l.getLocName());
			pstmt.setString(4, l.getLocPhone());
			pstmt.setString(5, l.getLocAddress());
			pstmt.setString(6, l.getLocAddressDtl());
			pstmt.setString(7, l.getLocPostCode());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteLocation(Connection conn, int locNo) {
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteLocation");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, locNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	
	}

	public int insertFirstLocation(Connection conn, Location l) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFirstLocation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, l.getMemNo());
			pstmt.setString(2, l.getLocAddressName());
			pstmt.setString(3, l.getLocName());
			pstmt.setString(4, l.getLocPhone());
			pstmt.setString(5, l.getLocAddress());
			pstmt.setString(6, l.getLocAddressDtl());
			pstmt.setString(7, l.getLocPostCode());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
