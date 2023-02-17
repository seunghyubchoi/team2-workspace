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

}
