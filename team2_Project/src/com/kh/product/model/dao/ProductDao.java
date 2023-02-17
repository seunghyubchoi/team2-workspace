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
import com.kh.product.model.vo.Product;

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
	
	public ArrayList<Product> categorySearch(Connection conn, String categoryName){
		ArrayList<Product> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("categorySearch");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, categoryName);
			
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
}
