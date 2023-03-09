package com.kh.Qnaboard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.Qnaboard.model.vo.Board;
import com.kh.Qnaboard.model.vo.QAttachment;
import com.kh.common.PageInfo;
import com.kh.notice.model.vo.Attachment;
import com.kh.product.model.vo.Category;

import static com.kh.common.JDBCTemplate.*;

public class BoardDao {
	private Properties prop = new Properties();
	
	public BoardDao() {
		String filePath = BoardDao.class.getResource("/db/sql/board-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public int selectListCount(Connection conn) {
		int listCount =0;
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
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public ArrayList<Board> selectList(Connection conn, PageInfo pi){
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow = startRow + pi.getBoardLimit()-1;
		
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Board( rset.getInt("QNA_NO"),
									rset.getString("QNA_TITLE"),
									rset.getDate("QNA_DATE"),
									rset.getString("MEM_NAME"),
									rset.getInt("QNA_VIEW_COUNT")
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
	
	public int increaseCount(Connection conn,int boardNo) {
		int result=0;
		PreparedStatement pstmt = null;
		String sql =prop.getProperty("increaseCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Board selectBoard(Connection conn, int boardNo) {
		//select문 => ResultSet객체 => 한행 > board
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		
		String sql =prop.getProperty("selectBoard");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				b = new Board(rset.getInt("QNA_NO"),
							  rset.getString("QNA_TITLE"),
							  rset.getString("QNA_CONTENT"),
							  rset.getDate("QNA_DATE"),
							  rset.getString("ANS_CONTENT"),
							  rset.getDate("ANS_DATE"),
							  rset.getInt("QNA_VIEW_COUNT"),
							  rset.getString("ANS_YN"),
							  rset.getString("mem_name"),
							  rset.getString("MANAGER_ID")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}
	
	public ArrayList<Category> selectCategoryList(Connection conn) {
		// select문 => ResultSet객체 => 여러행 => ArrayList
		
		ArrayList<Category> list = new ArrayList<Category>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Category(rset.getInt("HEADER_NO"),
									  rset.getString("HERADER_CONTENT")
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
	
	public int insertBoard(Connection conn, Board b) {
		// insert문 => 처리된 행수 => 트랜젝션 처리
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,b.getQcategory());
			pstmt.setString(2, b.getQnaTitle());
			pstmt.setString(3, b.getQnaContent());
			pstmt.setString(4, b.getMemNo());
			pstmt.setInt(5, b.getHeaderNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertAttachment(Connection conn, QAttachment at) {
		// insert문 => 처리된 행수 => 트랜젝션 처리
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, b.getHeaderNo());
			pstmt.setString(2, b.getQnaTitle());
			pstmt.setString(3, b.getQnaContent());
			pstmt.setInt(4,b.getQnaNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateAttachment(Connection conn, QAttachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int insertNewAttachment(Connection conn, QAttachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, at.getRefBno());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	public QAttachment selectAttachment(Connection conn, int boardNo) {
		// select문 => ResultSet객체 => 한행 => Attachment 객체
		QAttachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new QAttachment();
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
	}
}
