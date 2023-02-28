package com.kh.notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.member.model.dao.MemberDao;
import com.kh.notice.model.vo.Notice;
import static com.kh.common.JDBCTemplate.*;


public class NoticeDao {
	
	private Properties prop = new Properties();
	
	public NoticeDao() {
		String filePath = NoticeDao.class.getResource("/db/sql/notice-mapper.xml").getPath();
	
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Notice> selectNoticeList(Connection conn){
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		String sql=prop.getProperty("selectNoticeList");
		System.out.println("!!!!!!+"+sql);
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Notice(rset.getInt("notice_no"),
									rset.getString("notice_title"),
									rset.getDate("notice_date")
									
						));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Notice selectNotice(Connection conn,int noticeNo) {
		Notice n = null;
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(rset.getInt(""),
							rset.getString(""),
							rset.getString(""),
							rset.getString(""),
							rset.getDate("")
						);
			}
		}
	}
}
