package com.kh.member.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.MileageHistory;
import com.kh.payment.model.vo.Location;

public class AdminMemberDao {
	
	private Properties prop = new Properties();
	
	public AdminMemberDao () {
		try {
			prop.loadFromXML(new FileInputStream(AdminMemberDao.class.getResource("/db/sql/member-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 회원 전체조회 (관리자)
	 * @param conn
	 * @return
	 */
	public ArrayList<Member> selectList(Connection conn) { // selectList start
		ArrayList<Member> list = new ArrayList<Member>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("MEM_NO"),
									rset.getString("MEM_ID"),
									rset.getString("MEM_NAME"),
									rset.getDate("ENROLL_DATE")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	} // selectList end

	/**
	 * 회원 상세조회 (관리자)
	 * @param conn
	 * @return
	 */
	public Member selectMember(Connection conn, int memNo) { // selectMember start
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
		
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
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	} // selectMember end
	
	/**
	 * 배송지 조회 (관리자)
	 * @param conn
	 * @return
	 */
	public ArrayList<Location> selectLocation(Connection conn, int memNo) { // selectLocation start
		ArrayList<Location> lList = new ArrayList<Location>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLocationList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				lList.add(new Location(
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
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return lList;
	}// selectLocation end

	public int insertMileage(Connection conn, MileageHistory mh) {
		int result = 0;
		PreparedStatement pstmt = null;
	
		String sql = prop.getProperty("insertMileage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mh.getMileage());
			pstmt.setInt(2, mh.getMemNo());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteMember(Connection conn, String deleteList) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMemberList");
		
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
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
