package com.kh.payment.model.service;

import com.kh.member.model.vo.MileageHistory;
import com.kh.payment.model.dao.AdminPaymentDao;
import com.kh.payment.model.dao.PaymentDao;
import com.kh.payment.model.vo.Location;
import com.kh.payment.model.vo.OrderA;
import com.kh.payment.model.vo.OrderDtl;
import com.kh.payment.model.vo.ReturnA;
import com.kh.product.model.vo.ProductA;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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

	public int deleteLocation(int locNo) {
		Connection conn = getConnection();	
		
		int result = new AdminPaymentDao().deleteLocation(conn, locNo);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	/**
	 * 주문 전체조회 (관리자)
	 * @return
	 */
	public ArrayList<OrderA> selectList() {
		Connection conn = getConnection();
		
		ArrayList<OrderA> list = new AdminPaymentDao().selectList(conn);
		
		close(conn);
		
		return list;
	}

	public OrderA selectOrder(int orderNo) {
		Connection conn = getConnection();
		
		OrderA o = new AdminPaymentDao().selectOrder(conn, orderNo);
		
		close(conn);
		
		return o;
	}

	public ArrayList<OrderDtl> selectOrderDtl(int orderNo) {
		Connection conn = getConnection();
		
		ArrayList<OrderDtl> odList = new AdminPaymentDao().selectOrderDtlList(conn, orderNo);
		
		close(conn);
		
		return odList;
		
	}

	public ProductA selectProduct(int productNo) {
		Connection conn = getConnection();
		
		ProductA p = new AdminPaymentDao().selectProduct(conn, productNo);
		
		close(conn);
		
		return p;
	}

	public int updateOrderDtl(OrderDtl od) {
		Connection conn = getConnection();	
		
		int result = new AdminPaymentDao().updateOrderDtl(conn, od);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteOrderDtl(int orderDtlNo) {
		Connection conn = getConnection();	
		
		int result = new AdminPaymentDao().deleteOrderDtl(conn, orderDtlNo);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateOrder(OrderA o, MileageHistory mh) {
		Connection conn = getConnection();
		
		int result1 = new AdminPaymentDao().updateOrder(conn, o);
		int result2 = 1;
		
		MileageHistory m = new AdminPaymentDao().selectMileageHistory(conn, mh);
		
		if(m == null && o.getOrderStatus().equals("배송완료")) {
			result2 = new AdminPaymentDao().insertMileage(conn, mh);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result1 * result2;
	}

	public ReturnA selectReturn(int orderNo) {
		Connection conn = getConnection();
		
		ReturnA r = new AdminPaymentDao().selectReturn(conn, orderNo);
		
		close(conn);
		
		return r;
	}

}
