package com.kh.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.product.model.service.ProductService;
import com.kh.product.model.vo.Option;
import com.kh.product.model.vo.Product;
import com.kh.product.model.vo.ProductImage;
import com.kh.product.model.vo.Review;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		try {
			prop.loadFromXML(new FileInputStream(ProductDao.class.getResource("/db/sql/product-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<Product> categorySearch(Connection conn, String categoryName, int page){
		ArrayList<Product> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("categorySearch");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, categoryName);
			pstmt.setInt(2, page);
			pstmt.setInt(3, page);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Product(rset.getInt("product_no"),
									 rset.getString("product_name"),
									 rset.getInt("product_discount"),
									 rset.getInt("product_price"),
									 rset.getString("brand_name"),
									 rset.getInt("product_view_count"),
									 rset.getString("product_img_src")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Product> categorySort(Connection conn,String categoryName,int value, int page){
		ArrayList<Product> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		switch(value) {
		case 1 : sql = prop.getProperty("categoryViewSearch"); break;
		case 2 : sql = prop.getProperty("categoryRowPrice"); break;
		case 3 : sql = prop.getProperty("categoryHighPrice"); break;
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, categoryName);
			pstmt.setInt(2, page);
			pstmt.setInt(3, page);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Product(rset.getInt("product_no"),
									 rset.getString("product_name"),
									 rset.getInt("product_discount"),
									 rset.getInt("product_price"),
									 rset.getString("brand_name"),
									 rset.getInt("product_view_count"),
									 rset.getString("product_img_src")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	public ArrayList<Product> productSearch(Connection conn,String product,int page){
		ArrayList<Product> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("productSearch");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product);
			pstmt.setString(2, product);
			pstmt.setInt(3, page);
			pstmt.setInt(4, page);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Product(rset.getInt("product_no"),
									 rset.getString("product_name"),
									 rset.getInt("product_discount"),
									 rset.getInt("product_price"),
									 rset.getString("brand_name"),
									 rset.getInt("product_view_count"),
									 rset.getString("product_img_src")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Product> productSort(Connection conn,String product, int value,int page){
		ArrayList<Product> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		switch(value) {
		case 1 : sql = prop.getProperty("productViewSearch"); break;
		case 2 : sql = prop.getProperty("productRowPrice"); break;
		case 3 : sql = prop.getProperty("productHighPrice"); break;
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product);
			pstmt.setString(2, product);
			pstmt.setInt(3, page);
			pstmt.setInt(4, page);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Product(rset.getInt("product_no"),
									 rset.getString("product_name"),
									 rset.getInt("product_discount"),
									 rset.getInt("product_price"),
									 rset.getString("brand_name"),
									 rset.getInt("product_view_count"),
									 rset.getString("product_img_src")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Product productDetail(Connection conn,int pNo) {
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("productDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				     p = new Product(rset.getInt("product_no"),
									 rset.getString("product_name"),
									 rset.getInt("product_discount"),
									 rset.getInt("product_price"),
									 rset.getString("brand_name"),
									 rset.getInt("product_view_count"),
									 rset.getString("product_img_src"));
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
	public int productViewUp(Connection conn,int pNo) {
		int result = 0 ;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("productViewUp");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<ProductImage> selectProductImage(Connection conn, int pNo){
		ArrayList<ProductImage> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductImage");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new ProductImage(rset.getInt("product_img_no"),
										  rset.getString("product_img_name"),
										  rset.getString("product_img_src"),
										  rset.getInt("product_no"),
										  rset.getInt("img_type")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<Option> selectProductOption(Connection conn,int pNo){
		ArrayList<Option> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductOption");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Option(rset.getInt("option_no"),
									rset.getString("option_size"),
									rset.getInt("option_stock"),
									rset.getInt("product_no")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Review> selectProductReview(Connection conn,int pNo) {
		ArrayList<Review> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductReview");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("review_no"),
									rset.getString("review_content"),
									rset.getInt("review_star"),
									rset.getDate("review_date"),
									rset.getString("review_ans_content"),
									rset.getDate("review_ans_date"),
									rset.getString("mem_name"),
									rset.getString("review_img_src")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int listCount(Connection conn, String categoryName) {
		// select문 => ResultSet 객체 (한개) => int형 변수
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, categoryName);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count"); // spl문에 별칭을 줌
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public int listCount2(Connection conn, String product) {
		// select문 => ResultSet 객체 (한개) => int형 변수
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product);
			pstmt.setString(2, product);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count"); // spl문에 별칭을 줌
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
}
