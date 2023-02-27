package com.kh.payment.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.myPage.model.vo.Cart;
import com.kh.payment.model.dao.PaymentDao;
import com.kh.payment.model.vo.Location;
import com.kh.product.model.dao.ProductDao;
import com.kh.product.model.vo.Product;

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
	
	public Product selectPayment(int cno) {
		Connection conn = getConnection();
		
		Product p  = new PaymentDao().selectPayment(conn, cno);
		close(conn);
		
		return p;
	}

}
