package com.kh.myPage.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.PageInfo;
import com.kh.community.model.vo.Instagram;
import com.kh.community.model.vo.Like;
import com.kh.member.model.dao.MemberDao;
import com.kh.myPage.model.vo.Follow;
import com.kh.myPage.model.vo.MileageHistory;

public class MyPageDao {

	private Properties prop = new Properties();

	public MyPageDao() {
		String filePath = MemberDao.class.getResource("/db/sql/myPage-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Follow> selectFollowerList(Connection conn, PageInfo pi, int memNo) {
		
		ArrayList<Follow> list = new ArrayList<Follow>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectFollowerList");

		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Follow(rset.getInt("mem_no"), rset.getString("login_id"), rset.getString("followers")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;

	}

	public ArrayList<Follow> selectFollowingList(Connection conn, PageInfo pi, int memNo) {
		//System.out.println("selectFollowingList dao 탐");

		ArrayList<Follow> list = new ArrayList<Follow>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectFollowingList");

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Follow(rset.getInt("mem_no"), rset.getString("login_id"), rset.getString("following")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		//System.out.println(list);
		
		return list;

		
	}

	public int deleteFollower(Connection conn, int memNo, String followerId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteFollower");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, followerId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteFollowing(Connection conn, int memNo, String followingId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFollowing");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, followingId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);

		}
		

		return result;
	}

	public int cancelDeleteFollowing(Connection conn, int memNo, String followingId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("cancelDeleteFollowing");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, followingId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<MileageHistory> selectMileageHistory(Connection conn, int memNo) {
		ArrayList<MileageHistory> list = new ArrayList<MileageHistory>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
 
		String sql = prop.getProperty("selectMileageHistory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new MileageHistory(rset.getInt("mileage_no")
						,rset.getString("mileage_history")
						,rset.getInt("mileage")
						,rset.getString("product_name")
						,rset.getInt("mem_no")
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

	public ArrayList<Instagram> selectLikeList(Connection conn, int memNo) {
		ArrayList<Instagram> list = new ArrayList<Instagram>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectLikeList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Instagram(rset.getInt("com_no")
									 , rset.getString("insta_id")
									 , rset.getString("insta_img_src")));
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

	public int deleteLike(Connection conn, int memNo, int comNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, comNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);

		}
		

		return result;
	}

	public int insertLike(Connection conn, int memNo, int comNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, comNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectFollowerCount(Connection conn, int memNo) {
		// select문 => ResultSet 객체 (한개) => int형 변수
				int listCount = 0;
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				String sql = prop.getProperty("selectFollowerCount");
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, memNo);
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

	public int selectFollowingCount(Connection conn, int memNo) {
		// select문 => ResultSet 객체 (한개) => int형 변수
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFollowingCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
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
