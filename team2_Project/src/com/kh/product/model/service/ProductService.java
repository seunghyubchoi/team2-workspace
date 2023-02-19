package com.kh.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.product.model.dao.ProductDao;
import com.kh.product.model.vo.Product;

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

}
