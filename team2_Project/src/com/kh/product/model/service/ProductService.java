package com.kh.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.product.model.dao.ProductDao;
import com.kh.product.model.vo.Option;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductImage;
import com.kh.product.model.vo.Review;

public class ProductService {
	
	public ArrayList<Product> categorySearch(String categoryName, int page){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().categorySearch(conn, categoryName,page);
		close(conn);
		return list;
	}
	
	public ArrayList<Product> categorySort(String categoryName,int value,int page){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().categorySort(conn,categoryName,value,page);
		close(conn);
		return list;
	}
	
	
	public ArrayList<Product> productSearch(String product, int page){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().productSearch(conn, product,page);
		close(conn);
		return list;
	}
	
	public ArrayList<Product> productSort(String product, int value,int page){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().productSort(conn,product,value,page);
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
		close(conn);
		return list;
	}
	
	public ArrayList<Option> selectProductOption(int pNo){
		Connection conn = getConnection();
		
		ArrayList<Option> list = new ProductDao().selectProductOption(conn, pNo);
		close(conn);
		return list;
	}
	
	public ArrayList<Review> selectProductReview(int pNo){
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ProductDao().selectProductReview(conn, pNo);
		
		close(conn);
		
		return list;
	}
	
	public int listCount(String categoryName) {
		
		Connection conn = getConnection();
		
		int result = new ProductDao().listCount(conn,categoryName);

		close(conn);
		return result;
	}
	
	public int listCount2(String product) {
		
		Connection conn = getConnection();
		
		int result = new ProductDao().listCount2(conn,product);

		close(conn);
		return result;
	}

}
