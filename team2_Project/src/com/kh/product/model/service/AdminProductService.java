package com.kh.product.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.product.model.dao.AdminProductDao;
import com.kh.product.model.vo.Attachment;
import com.kh.product.model.vo.Option;
import com.kh.product.model.vo.ProductA;

public class AdminProductService {

	/**
	 * 상품 전체조회 (관리자)
	 * @return
	 */
	public ArrayList<ProductA> selectList() {
		Connection conn = getConnection();
		
		ArrayList<ProductA> list = new AdminProductDao().selectList(conn);
		
		close(conn);
		
		return list;
	}

	public ProductA selectProduct(int productNo) {
		Connection conn = getConnection();
		
		ProductA p = new AdminProductDao().selectProduct(conn, productNo);
		
		close(conn);
		
		return p;
	}

	public ArrayList<Attachment> selectAttachmentList(int productNo) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> atList = new AdminProductDao().selectAttachment(conn, productNo);
		
		close(conn);
		
		return atList;
	}

	public int insertProduct(ProductA p, ArrayList<Attachment> atList, ArrayList<Option> opList) {
		Connection conn = getConnection();
		
		int result1 = new AdminProductDao().insertProduct(conn, p);
		int result2 = new AdminProductDao().insertAttachmentList(conn, atList);
		int result3 = new AdminProductDao().insertOption(conn, opList);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2 * result3;
	}

	public int insertImg(Attachment at) {
		Connection conn = getConnection();
		
		int result = new AdminProductDao().insertImg(conn, at);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public ArrayList<Option> selectOptionList(int productNo) {
		Connection conn = getConnection();
		
		ArrayList<Option> opList = new AdminProductDao().selectOptionList(conn, productNo);
		
		close(conn);
		
		return opList;
	}

	public int insertOption(Option o) {
		Connection conn = getConnection();
		
		int result = new AdminProductDao().insertOption(conn, o);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int deleteOption(int optionNo) {
		Connection conn = getConnection();
		
		int result = new AdminProductDao().deleteOption(conn, optionNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int updateProduct(ProductA p, ArrayList<Attachment> updateAtList, ArrayList<Attachment> newAtList,
			ArrayList<Option> newOpList, ArrayList<Option> updateOpList) {
		Connection conn = getConnection();
		
		int result1 = new AdminProductDao().updateProduct(conn, p);
		int result2 = 1;
		int result3 = 1;
		int result4 = 1;
		int result5 = 1;
		
		
		if(!updateAtList.isEmpty()) {
			result2 = new AdminProductDao().updateAttachmentList(conn, updateAtList);
		}
		
		
		if(!newAtList.isEmpty()) {
			result3 = new AdminProductDao().insertAttachmentList2(conn, newAtList);
		}
		
		if(!updateOpList.isEmpty()) {
			result4 = new AdminProductDao().updateOptionList(conn, updateOpList);
		}
		
		if(!newOpList.isEmpty()) {
			result5 = new AdminProductDao().insertOptionList(conn, newOpList);
		}
		
		return result1 * result2 * result3 * result4 * result5;
	}

	public int deleteProduct(String deleteList) {
		Connection conn = getConnection();
		
		int result = new AdminProductDao().deleteProduct(conn, deleteList);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
