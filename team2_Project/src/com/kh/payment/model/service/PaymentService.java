package com.kh.payment.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.member.model.dao.MemberDao;
import com.kh.payment.model.dao.PaymentDao;
import com.kh.payment.model.vo.Location;

public class PaymentService {

	public Location selectLocation(int memNo) {
		Connection conn = getConnection();
		
		Location defaultLocation = new PaymentDao().selectLocation(conn, memNo);
		
		close(conn);
		
		return defaultLocation;
	}

	public ArrayList<Location> selectLocationList(int memNo) {
		Connection conn = getConnection();
		ArrayList<Location> list = new PaymentDao().selectLocationList(conn, memNo);
		close(conn);
		
		return list;
	}

	public Location selectLocationByLocationNo(int locNo) {
		Connection conn = getConnection();
		
		Location location = new PaymentDao().selectLocationByLocationNo(conn, locNo);
		
		close(conn);
		
		return location;
		
	}

	public Location updateLocation(Location l) {
		Connection conn = getConnection();
		int result = new PaymentDao().updateLocation(conn, l);
		Location location = null;
		if(result > 0) {
			commit(conn);
			location = new PaymentDao().selectLocationByLocationNo(conn, l.getLocNo());
		} else {
			rollback(conn);
		}
		close(conn);
		return location;
	}

	public int updateLocationSetN(int memNo) {
		Connection conn = getConnection();
		int result = new PaymentDao().updateLocationSetN(conn, memNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteLocation(int locNo) {
		Connection conn = getConnection();		
		int result = new PaymentDao().deleteLocation(conn, locNo);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}

}
