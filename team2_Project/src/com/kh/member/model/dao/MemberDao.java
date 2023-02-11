package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
	
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, String userId, String userPwd) {
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(
						  rset.getInt("mem_no")
						, rset.getString("mem_id")
						, rset.getString("mem_pwd")
						, rset.getString("mem_name")
						, rset.getString("email")
						, rset.getString("phone")
						, rset.getDate("enroll_date")
						, rset.getString("ad_check")
						, rset.getString("gender")
						, rset.getString("birthday")
						, rset.getString("insta_id")
						, rset.getString("act_yn")
						, rset.getInt("mileage")
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return m;
	}

	public Member passwordCheck(Connection conn, String memId, String pwdCheck) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("passwordCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			pstmt.setString(2, pwdCheck);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(
						  rset.getInt("mem_no")
						, rset.getString("mem_id")
						, rset.getString("mem_pwd")
						, rset.getString("mem_name")
						, rset.getString("email")
						, rset.getString("phone")
						, rset.getDate("enroll_date")
						, rset.getString("ad_check")
						, rset.getString("gender")
						, rset.getString("birthday")
						, rset.getString("insta_id")
						, rset.getString("act_yn")
						, rset.getInt("mileage")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

}
