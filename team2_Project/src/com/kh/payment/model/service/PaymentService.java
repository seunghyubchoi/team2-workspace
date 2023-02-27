package com.kh.payment.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.myPage.model.vo.Cart;
import com.kh.payment.model.dao.PaymentDao;
import com.kh.payment.model.vo.Location;
import com.kh.product.model.dao.ProductDao;

public class PaymentService {

	public Location selectLocation(int memNo) {
		Connection conn = getConnection();
		
		Location defaultLocation = new PaymentDao().selectLocation(conn, memNo);
		
		close(conn);
		
		return defaultLocation;
	}
	
	public int insertCart(int mno,int pno,int amount ,String size) {
		Connection conn = getConnection();
		
		int result = new PaymentDao().insertCart(conn,mno,pno,amount,size);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public ArrayList<Cart> selectCart(int MemNo){
		Connection conn = getConnection();
		
		ArrayList<Cart> list = new PaymentDao().selectCart(conn, MemNo);
		close(conn);
		
		return list;
	}
	
	public int deleteCart(int cartNo) {
		Connection conn = getConnection();
		
		int result = new PaymentDao().deleteCart(conn, cartNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int checkCart(int mno,int pno,String size) {
		Connection conn = getConnection();
		
		int result = new PaymentDao().checkCart(conn,mno,pno,size);
		close(conn);
		
		return result;
	
	}
	
	public int updateQnt(int qnt,int cartNo) {
		Connection conn = getConnection();
		
		int result = new PaymentDao().updateQnt(conn,qnt,cartNo);
		if(result>0) {
			close(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
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

	public int insertLocation(Location l) {
		Connection conn = getConnection();
		int result = new PaymentDao().insertLocation(conn, l);
		if (result > 0) {
			// 성공
			commit(conn);
		} else {
			// 데이터 안들어 갔음 = 실패
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

	public int insertFirstLocation(Location l) {
		Connection conn = getConnection();
		int result = new PaymentDao().insertFirstLocation(conn, l);
		if (result > 0) {
			// 성공
			commit(conn);
		} else {
			// 데이터 안들어 갔음 = 실패
			rollback(conn);
		}
		close(conn);
		return result;
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

}
