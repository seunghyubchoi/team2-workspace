package com.kh.notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.PageInfo;
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
	
	public ArrayList<Notice> selectNoticeList(Connection conn, PageInfo pi){
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		String sql=prop.getProperty("selectNoticeList");
		try {
			pstmt=conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("notice_no"),
									rset.getString("notice_title"),
									rset.getDate("notice_date"),
									rset.getInt("count")
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
	
	public int increaseCount(Connection conn,int noticeNo) {
		//update문 > 처리된행수 > 트랜젝션 처리
		int result =0;
		PreparedStatement pstmt = null;
		String sql =prop.getProperty("increaseCount");
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, noticeNo);
		result = pstmt.executeUpdate();
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
		close(pstmt);
	}
	return result;
	}
	
	public Notice selectNotice(Connection conn,int noticeNo) {
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("nselectNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				n = new Notice(
						rset.getString("notice_title"),
						rset.getInt("notice_no"),
						rset.getString("notice_content"),
						rset.getDate("notice_date"),
						rset.getString("manager_name")
						);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return n;
	}
	//페이징
	public int selectListCount(Connection conn) {
		// select문 => ResultSet 객체 (한개) => int형 변수
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
}
