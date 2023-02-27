package com.kh.notice.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.notice.model.dao.ManageNoticeDao;
import com.kh.notice.model.vo.Attachment;
import com.kh.notice.model.vo.Notice;

public class ManageNoticeService { // class start

	/**
	 * 공지사항 전체조회 (관리자)
	 * @return
	 */
	public ArrayList<Notice> selectList() { // selectList start
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new ManageNoticeDao().selectList(conn);
		
		close(conn);
		
		return list;
	} // selectList end

	/**
	 * 공지사항 내용 이미지 등록
	 * @param at
	 * @return
	 */
	public int insertImg(Attachment at) {
		Connection conn = getConnection();
		
		int result = new ManageNoticeDao().insertImg(conn, at);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	/**
	 * 공지사항 등록 
	 * @param n
	 * @param at
	 * @return
	 */
	public int insertNotice(Notice n, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new ManageNoticeDao().insertNotice(conn, n);
		int result2 = 1;
		
		if(at != null) { // 첨부파일 있다 => 첨부파일 테이블 insert
			result2 = new ManageNoticeDao().insertAttachment(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}

} // class end
