package com.kh.payment.model.dao;

import java.io.Closeable;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.myPage.model.vo.Cart;
import com.kh.payment.model.vo.Location;
import com.kh.payment.model.vo.Order;
import com.kh.product.model.vo.Product;

public class PaymentDao {
	
	private Properties prop = new Properties();
	
	public PaymentDao() {
		String filePath = PaymentDao.class.getResource("/db/sql/payment-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Location selectLocation(Connection conn, int memNo) {
		Location defaultLocation = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLocation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				defaultLocation = new Location(
						  rset.getInt("loc_no")
						, rset.getInt("mem_no")
						, rset.getString("loc_address_name")
						, rset.getString("loc_name")
						, rset.getString("loc_phone")
						, rset.getString("loc_address")
						, rset.getString("loc_address_dtl")
						, rset.getString("loc_post_code")
						, rset.getString("del_yn")
						, rset.getString("loc_yn")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return defaultLocation;
	}
	
	public int insertCart(Connection conn,int mno,int pno,int amount, String size) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, amount);
			pstmt.setInt(2, pno);
			pstmt.setInt(3, mno);
			pstmt.setString(4, size);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public ArrayList<Cart> selectCart(Connection conn,int MemNo){
		ArrayList<Cart> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, MemNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Cart(rset.getString("product_name"),
								  rset.getInt("product_discount"),
								  rset.getInt("product_price"),
								  rset.getInt("cart_no"),
								  rset.getInt("cart_qnt"),
								  rset.getString("cart_size"),
								  rset.getInt("mileage"),
								  rset.getString("brand_name"),
								  rset.getString("change_name"),
								  rset.getString("file_path"),
								  rset.getInt("option_stock")));
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
	
	public int deleteCart(Connection conn, int cartNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cartNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int checkCart(Connection conn,int mno,int pno,String size) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			pstmt.setInt(2, pno);
			pstmt.setString(3, size);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("cart_no");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateQnt(Connection conn,int qnt,int cartNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateQnt");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnt);
			pstmt.setInt(2, cartNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Product selectPayment(Connection conn,int cno) {
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPayment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				p = new Product(rset.getString("brand_name"),
								rset.getString("product_name"),
								rset.getString("change_name"),
								rset.getString("file_path"),
								rset.getInt("product_price"),
								rset.getInt("product_discount"),
								rset.getInt("product_no"),
								rset.getString("cart_size"),
								rset.getInt("cart_qnt")
								);
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

	public ArrayList<Location> selectLocationList(Connection conn, int memNo) {
		ArrayList<Location> list = new ArrayList<Location>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLocationList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(
						 new Location(
								  rset.getInt("loc_no")
								, rset.getInt("mem_no")
								, rset.getString("loc_address_name")
								, rset.getString("loc_name")
								, rset.getString("loc_phone")
								, rset.getString("loc_address")
								, rset.getString("loc_address_dtl")
								, rset.getString("loc_post_code")
								, rset.getString("del_yn")
								, rset.getString("loc_yn")
								)
						);
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

	public Location selectLocationByLocationNo(Connection conn, int locNo) {
		Location location = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLocationByLocationNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, locNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				location = new Location(
						  rset.getInt("loc_no")
						, rset.getInt("mem_no")
						, rset.getString("loc_address_name")
						, rset.getString("loc_name")
						, rset.getString("loc_phone")
						, rset.getString("loc_address")
						, rset.getString("loc_address_dtl")
						, rset.getString("loc_post_code")
						, rset.getString("del_yn")
						, rset.getString("loc_yn")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return location;
	}

	public int updateLocation(Connection conn, Location l) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateLocation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, l.getLocAddressName());
			pstmt.setString(2, l.getLocName());
			pstmt.setString(3, l.getLocPhone());
			pstmt.setString(4, l.getLocAddress());
			pstmt.setString(5, l.getLocAddressDtl());
			pstmt.setString(6, l.getLocPostCode());
			pstmt.setString(7, l.getLocYn());
			pstmt.setInt(8, l.getLocNo());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertLocation(Connection conn, Location l) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLocation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, l.getMemNo());
			pstmt.setString(2, l.getLocAddressName());
			pstmt.setString(3, l.getLocName());
			pstmt.setString(4, l.getLocPhone());
			pstmt.setString(5, l.getLocAddress());
			pstmt.setString(6, l.getLocAddressDtl());
			pstmt.setString(7, l.getLocPostCode());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteLocation(Connection conn, int locNo) {
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteLocation");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, locNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	
	}

	public int insertFirstLocation(Connection conn, Location l) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFirstLocation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, l.getMemNo());
			pstmt.setString(2, l.getLocAddressName());
			pstmt.setString(3, l.getLocName());
			pstmt.setString(4, l.getLocPhone());
			pstmt.setString(5, l.getLocAddress());
			pstmt.setString(6, l.getLocAddressDtl());
			pstmt.setString(7, l.getLocPostCode());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateLocationSetN(Connection conn, int memNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateLocationSetN");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Product selectPayment2(Connection conn,int pno,String size, int qnt) {
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPayment2");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				p = new Product(rset.getString("brand_name"),
						rset.getString("product_name"),
						rset.getString("change_name"),
						rset.getString("file_path"),
						rset.getInt("product_price"),
						rset.getInt("product_discount"),
						rset.getInt("product_no"),
						size,
						qnt);
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

	public int insertOrder(Connection conn ,Order o) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, o.getMemNo());
			pstmt.setInt(2, o.getOrderQnt());
			pstmt.setString(3, o.getRcpName());
			pstmt.setString(4, o.getRcpPhone());
			pstmt.setString(5, o.getRcpAddress());
			pstmt.setString(6, o.getRcpAddressDtl());
			pstmt.setString(7, o.getRcpPostCode());
			pstmt.setString(8, o.getRcpMsg());
			pstmt.setInt(9, o.getSaveMileage());
			pstmt.setInt(10, o.getUseMileage());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertOrderDtl(Connection conn,int pNo,String pSize,int pQnt) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertOrderDtl");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pNo);
			pstmt.setString(2, pSize);
			pstmt.setInt(3, pQnt);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateOptionQnt(Connection conn,int pNo,String pSize,int pQnt) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateOptionQnt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pQnt);
			pstmt.setInt(2, pNo);
			pstmt.setString(3, pSize);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateMileage(Connection conn,int mNo,int useMileage) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMileage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, useMileage);
			pstmt.setInt(2, mNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertMileageHistory(Connection conn,int mNo,int useMileage) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMileageHistory");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, useMileage);
			pstmt.setInt(2, mNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
