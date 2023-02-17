package com.kh.payment.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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

}
