package com.kh.Qnaboard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.Qnaboard.model.dao.BoardDao;
import com.kh.Qnaboard.model.vo.Board;
import com.kh.common.PageInfo;
import com.kh.notice.model.vo.Attachment;
import com.kh.product.model.vo.Category;

public class BoardService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new BoardDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Board> selectList(PageInfo pi){
		Connection conn =getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn,pi);
		
		close(conn);
		return list;
	}
	
	public int increaseCount(int boardNo) {
		Connection conn = getConnection();
		int result = new BoardDao().increaseCount(conn, boardNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Board selectBoard(int boardNo) {
		Connection conn = getConnection();
		Board board = new BoardDao().selectBoard(conn, boardNo);
		close(conn);
		return board;
	}
	
	public ArrayList<Category> selectCategoryList() {
		Connection conn = getConnection();
		ArrayList<Category> list = new BoardDao().selectCategoryList(conn);
		close(conn);
		return list;
	}

	public int insertBoard(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
}
