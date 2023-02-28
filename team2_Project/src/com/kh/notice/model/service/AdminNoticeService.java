package com.kh.notice.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.notice.model.dao.AdminNoticeDao;
import com.kh.notice.model.vo.Attachment;
import com.kh.notice.model.vo.Notice;

public class AdminNoticeService { // class start

	/**
	 * 공지사항 전체조회 (관리자)
	 * @return
	 */
	public ArrayList<Notice> selectList() { // selectList start
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new AdminNoticeDao().selectList(conn);
		
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
		
		int result = new AdminNoticeDao().insertImg(conn, at);
		
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
		
		int result1 = new AdminNoticeDao().insertNotice(conn, n);
		int result2 = 1;
		
		if(at != null) { // 첨부파일 있다 => 첨부파일 테이블 insert
			result2 = new AdminNoticeDao().insertAttachment(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}

	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		
		Notice n = new AdminNoticeDao().selectNotice(conn, noticeNo);
		
		close(conn);
		
		return n;
	}

	public Attachment selectAttachment(int noticeNo) {
		Connection conn = getConnection();
		
		Attachment at = new AdminNoticeDao().selectAttachment(conn, noticeNo);
		
		close(conn);
		
		return at;
	}

	public int updateNotice(Notice n, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new AdminNoticeDao().updateNotice(conn, n);
		int result2 = 1;
		
		if(at != null) { // 새로운 첨부파일이 있는 경우
			if(at.getFileNo() != 0) { // 기존에 첨부파일이 있는 경우 (Update)
				result2 = new AdminNoticeDao().updateAttachment(conn, at);
				
			}else { // 기존에 첨부파일이 없는 경우 (Insert)
				result2 = new AdminNoticeDao().insertNewAttachment(conn, at);
				
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}

	public int deleteNotice(String deleteList) {
		Connection conn = getConnection();
		
		int result1 = new AdminNoticeDao().deleteNotice(conn, deleteList);
		int result2 = new AdminNoticeDao().deleteAttachment(conn, deleteList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}



} // class end
