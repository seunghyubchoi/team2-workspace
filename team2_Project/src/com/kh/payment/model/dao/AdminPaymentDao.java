package com.kh.payment.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.member.model.vo.MileageHistory;
import com.kh.notice.model.vo.Notice;
import com.kh.payment.model.vo.Location;
import com.kh.payment.model.vo.Order;
import com.kh.payment.model.vo.OrderA;
import com.kh.payment.model.vo.OrderDtl;
import com.kh.product.model.vo.ProductA;

import static com.kh.common.JDBCTemplate.*;

public class AdminPaymentDao {
	
	private Properties prop = new Properties();
	
	public AdminPaymentDao() {
		String filePath = AdminPaymentDao.class.getResource("/db/sql/payment-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertLocation(Connection conn, Location l) {
		int result = 0;
		PreparedStatement pstmt = null;
	
		String sql = prop.getProperty("adminInsertLocation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, l.getMemNo());
			pstmt.setString(2, l.getLocAddressName());
			pstmt.setString(3, l.getLocName());
			pstmt.setString(4, l.getLocPhone());
			pstmt.setString(5, l.getLocAddress());
			pstmt.setString(6, l.getLocAddressDtl());
			pstmt.setString(7, l.getLocPostCode());
			pstmt.setString(8, l.getLocYn());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
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
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateLocYn(Connection conn, int memNo) {
		int result = 0;
		PreparedStatement pstmt = null;
	
		String sql = prop.getProperty("updateLocYn");
		
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

	/**
	 * 주문 전체조회 (관리자)
	 * @param conn
	 * @return
	 */
	public ArrayList<OrderA> selectList(Connection conn) {
		ArrayList<OrderA> list = new ArrayList<OrderA>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new OrderA(rset.getInt("ORDER_NO"),
									rset.getString("MEM_ID"),
									rset.getDate("ORDER_DATE"),
									rset.getString("ORDER_STATUS")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	/**
	 * 주문 상세조회 (관리자)
	 * @param conn
	 * @param orderNo
	 * @return
	 */
	public OrderA selectOrder(Connection conn, int orderNo) {
		OrderA o = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, orderNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				o = new OrderA(rset.getInt("ORDER_NO"),
							   rset.getString("MEM_NO"),
							   rset.getInt("ORDER_QNT"),
							   rset.getDate("ORDER_DATE"),
							   rset.getString("ORDER_STATUS"),
							   rset.getString("RCP_ADDRESS_NAME"),
							   rset.getString("RCP_NAME"),
							   rset.getString("RCP_PHONE"),
							   rset.getString("RCP_ADDRESS"),
							   rset.getString("RCP_ADDRESS_DTL"),
							   rset.getString("RCP_POST_CODE"),
							   rset.getString("RCP_MSG"),
							   rset.getInt("SAVE_MILEAGE"),
							   rset.getInt("USE_MILEAGE"),
							   rset.getString("MEM_NAME"),
							   rset.getString("MEM_ID"),
							   rset.getString("EMAIL"),
							   rset.getString("PHONE")
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return o;
	}

	public ArrayList<OrderDtl> selectOrderDtlList(Connection conn, int orderNo) {
		ArrayList<OrderDtl> odList = new ArrayList<OrderDtl>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrderDtlList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, orderNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				odList.add(new OrderDtl(rset.getInt("DTL_ORDER_NO"),
										rset.getInt("ORDER_NO"),
										rset.getInt("PRODUCT_NO"),
										rset.getString("DTL_SIZE"),
										rset.getInt("DTL_QNT"),
										rset.getString("DEL_YN")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return odList;
	}

	public ProductA selectProduct(Connection conn, int productNo) {
		ProductA p = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new ProductA(rset.getInt("PRODUCT_NO"),
							     rset.getString("PRODUCT_NAME"),
							     rset.getInt("PRODUCT_DISCOUNT"),
							     rset.getInt("PRODUCT_PRICE"),
							     rset.getString("BRAND_NAME")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}

	public int updateOrderDtl(Connection conn, OrderDtl od) {
		int result = 0; 
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateOrderDtl");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, od.getDtlQnt());
			pstmt.setString(2, od.getDtlSize());
			pstmt.setInt(3, od.getOrderDtlNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteOrderDtl(Connection conn, int orderDtlNo) {
		int result = 0; 
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteOrderDtl");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, orderDtlNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateOrder(Connection conn, OrderA o) {
		int result = 0; 
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, o.getOrderQnt());
			pstmt.setString(2, o.getOrderStatus());
			pstmt.setString(3, o.getRcpAddressName());
			pstmt.setString(4, o.getRcpName());
			pstmt.setString(5, o.getRcpPhone());
			pstmt.setString(6, o.getRcpAddress());
			pstmt.setString(7, o.getRcpAddressDtl());
			pstmt.setString(8, o.getRcpPostCode());
			pstmt.setString(9, o.getRcpMsg());
			pstmt.setInt(10, o.getSaveMileage());
			pstmt.setInt(11, o.getOrderNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertMileage(Connection conn, MileageHistory mh) {
		int result = 0;
		PreparedStatement pstmt = null;
	
		String sql = prop.getProperty("insertMileage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mh.getMileage());
			pstmt.setInt(2, mh.getMemNo());
			pstmt.setInt(3, Integer.parseInt(mh.getOrderNo()));
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public MileageHistory selectMileageHistory(Connection conn, MileageHistory mh) {
		MileageHistory m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMileageHistory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mh.getMemNo());
			pstmt.setInt(2, Integer.parseInt(mh.getOrderNo()));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new MileageHistory(rset.getInt("MEM_NO") + "",
									    rset.getInt("ORDER_NO")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

}
