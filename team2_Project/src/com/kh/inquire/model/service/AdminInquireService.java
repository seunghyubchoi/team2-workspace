package com.kh.inquire.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.inquire.model.dao.AdminIquireDao;
import com.kh.inquire.model.vo.Inquire;
import com.kh.notice.model.dao.AdminNoticeDao;

public class AdminInquireService {

	public ArrayList<Inquire> selectList() {
		Connection conn = getConnection();
		
		ArrayList<Inquire> list = new AdminIquireDao().selectList(conn);
		
		close(conn);
			
		return list;
	}

	public Inquire selectInquire(int inquireNo) {
		Connection conn = getConnection();
		
		Inquire i = new AdminIquireDao().selectInquire(conn, inquireNo);
		
		close(conn);
		
		return i;
	}

	public int updateInquire(Inquire i) {
		Connection conn = getConnection();
		
		int result = new AdminIquireDao().updateInquire(conn, i);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteInquire(String deleteList) {
		Connection conn = getConnection();
		
		int result1 = new AdminIquireDao().deleteInquire(conn, deleteList);
		
		if(result1 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1;
	}

}
