package com.kh.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.PageInfo;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;
import static com.kh.common.JDBCTemplate.*;
public class NoticeService {

	public ArrayList<Notice> selectNoticeList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn,pi);
		close(conn);
		return list;
	}
	
	public int increaseCount(int noticeNo) {
		Connection conn =getConnection();
		int result = new NoticeDao().increaseCount(conn,noticeNo);
		if(result<0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}	
	
	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		Notice n = new NoticeDao().selectNotice(conn,noticeNo);
		
		close(conn);
		return n;
	}
	//페이징
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new NoticeDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	
}
