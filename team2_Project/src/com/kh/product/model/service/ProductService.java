package com.kh.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.product.model.dao.ProductDao;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductImage;

public class ProductService {
	
	public ArrayList<Product> categorySearch(String categoryName){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().categorySearch(conn, categoryName);
		close(conn);
		return list;
	}
	
	public ArrayList<Product> categorySort(String categoryName,int value){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().categorySort(conn,categoryName,value);
		close(conn);
		return list;
	}
	
	
	public ArrayList<Product> productSearch(String product){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().productSearch(conn, product);
		close(conn);
		return list;
	}
	
	public ArrayList<Product> productSort(String product, int value){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().productSort(conn,product,value);
		close(conn);
		return list;
	}
	
	public Product productDetail(int pNo) {
		Connection conn = getConnection();
		
		Product p = new ProductDao().productDetail(conn, pNo);
		close(conn);
		return p;
	}
	
	public int productViewUp(int pNo) {
		Connection conn = getConnection();
		
		int result = new ProductDao().productViewUp(conn,pNo);
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<ProductImage> selectProductImage(int pNo){
		Connection conn = getConnection();
		
		ArrayList<ProductImage> list = new ProductDao().selectProductImage(conn, pNo);
	}

}
