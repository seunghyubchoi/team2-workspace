package com.kh.inquire.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.inquire.model.vo.Inquire;

public class AdminIquireDao {
	
	private Properties prop = new Properties();
	
	public AdminIquireDao () {
		try {
			prop.loadFromXML(new FileInputStream(AdminIquireDao.class.getResource("/db/sql/inquire-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Inquire> selectList(Connection conn) {
		ArrayList<Inquire> list = new ArrayList<Inquire>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Inquire(rset.getInt("QNA_NO"),
									 rset.getString("QNA_TITLE"),
									 rset.getDate("QNA_DATE"),
									 rset.getInt("QNA_VIEW_COUNT"),
									 rset.getString("ANS_YN"),
									 rset.getString("HERADER_CONTENT"),
									 rset.getString("MEM_NAME")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public Inquire selectInquire(Connection conn, int inquireNo) {
		Inquire i = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectInquire");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, inquireNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				i = new Inquire(rset.getInt("QNA_NO"),
								rset.getString("QNA_TITLE"),
								rset.getString("QNA_CONTENT"),
								rset.getDate("QNA_DATE"),
								rset.getString("ANS_CONTENT"),
								rset.getDate("ANS_DATE"),
								rset.getString("ANS_YN"),
								rset.getString("HERADER_CONTENT"),
								rset.getString("MANAGER_NO"),
								rset.getString("MEM_ID")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
			close(pstmt);
		}
		
		return i;
	}

	public int updateInquire(Connection conn, Inquire i) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateInquire");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, i.getManagerNo());
			pstmt.setString(2, i.getAnsYn());
			pstmt.setString(3, i.getAnsContent());
			pstmt.setInt(4, i.getQnaNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteInquire(Connection conn, String deleteList) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteInquire");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, deleteList);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
