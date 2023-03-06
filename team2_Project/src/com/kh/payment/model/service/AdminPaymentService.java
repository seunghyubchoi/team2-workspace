package com.kh.payment.model.service;

import com.kh.payment.model.dao.AdminPaymentDao;
import com.kh.payment.model.vo.Location;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

public class AdminPaymentService {

	public int insertLocation(Location l) {
		Connection conn = getConnection();
		
		int result = new AdminPaymentDao().insertLocation(conn, l);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateLocation(Location l) {
		Connection conn = getConnection();
		
		int result = new AdminPaymentDao().updateLocation(conn, l);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateLocYn(int memNo) {
		Connection conn = getConnection();
		
		int result = new AdminPaymentDao().updateLocYn(conn, memNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
