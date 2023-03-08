package com.kh.payment.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.payment.model.vo.Location;

import static com.kh.common.JDBCTemplate.*;

public class AdminPaymentDao {
	
	private Properties prop = new Properties();
	
	public AdminPaymentDao() {
		String filePath = AdminPaymentDao.class.getResource("/db/sql/payment-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertLocation(Connection conn, Location l) {
		int result = 0;
		PreparedStatement pstmt = null;
	
		String sql = prop.getProperty("adminInsertLocation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, l.getMemNo());
			pstmt.setString(2, l.getLocAddressName());
			pstmt.setString(3, l.getLocName());
			pstmt.setString(4, l.getLocPhone());
			pstmt.setString(5, l.getLocAddress());
			pstmt.setString(6, l.getLocAddressDtl());
			pstmt.setString(7, l.getLocPostCode());
			pstmt.setString(8, l.getLocYn());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
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
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateLocYn(Connection conn, int memNo) {
		int result = 0;
		PreparedStatement pstmt = null;
	
		String sql = prop.getProperty("updateLocYn");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
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

}
