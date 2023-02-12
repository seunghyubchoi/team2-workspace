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
	
	public int updateMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getGender());
			pstmt.setString(2, m.getBirthday());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getInstaId());
			pstmt.setString(6, m.getAdCheck());
			pstmt.setString(7, m.getMemId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	

	public int updatePwd(Connection conn, String memId, String userPwd, String updatePwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, memId);
			pstmt.setString(3, userPwd);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}

	public Member selectMember(Connection conn, String memId) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
		
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(
						  rset.getInt("mem_no")
						, rset.getString("mem_id")
						, rset.getString("mem_pwd")
						, rset.getString("mem_name")
						, rset.getString("email")
						, rset.getString("phone")
						, rset.getDate("emroll_date")
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
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	

}
