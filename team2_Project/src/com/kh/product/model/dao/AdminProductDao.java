package com.kh.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.product.model.vo.Attachment;
import com.kh.product.model.vo.Option;
import com.kh.product.model.vo.ProductA;

import static com.kh.common.JDBCTemplate.*;

/**
 * @author phy
 *
 */
public class AdminProductDao {
	
	private Properties prop = new Properties();
	
	public AdminProductDao() {
		try {
			prop.loadFromXML(new FileInputStream(AdminProductDao.class.getResource("/db/sql/product-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 상품 전체조회 (관리자)
	 * @param conn
	 * @return
	 */
	public ArrayList<ProductA> selectList(Connection conn) {
		ArrayList<ProductA> list = new ArrayList<ProductA>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new ProductA(rset.getInt("PRODUCT_NO"),
									 rset.getString("PRODUCT_NAME"),
									 rset.getInt("PRODUCT_PRICE"),
									 rset.getInt("PRODUCT_VIEW_COUNT"),
									 rset.getString("CATEGORY_NAME"),
									 rset.getString("BRAND_NAME")
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
								 rset.getString("PRODUCT_DESC"),
								 rset.getInt("PRODUCT_DISCOUNT"),
								 rset.getInt("PRODUCT_PRICE"),
								 rset.getString("CATEGORY_NAME"),
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

	public ArrayList<Attachment> selectAttachment(Connection conn, int productNo) {
		ArrayList<Attachment> atList = new ArrayList<Attachment>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				atList.add(new Attachment(rset.getInt("FILE_NO"),
										  rset.getString("ORIGIN_NAME"),
										  rset.getString("CHANGE_NAME"),
										  rset.getString("FILE_PATH")
						));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return atList;
	}

	public int insertProduct(Connection conn, ProductA p) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getProductName());
			pstmt.setString(2, p.getProductDesc());
			pstmt.setInt(3, p.getProductDiscount());
			pstmt.setInt(4, p.getProductPrice());
			pstmt.setInt(5, Integer.parseInt(p.getCategoryNo()));
			pstmt.setInt(6, Integer.parseInt(p.getBrandNo()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	
	}

	public int insertAttachmentList(Connection conn, ArrayList<Attachment> atList) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachmentList");
		
		try {
			
			for(Attachment at : atList) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				
				// 실행
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertOption(Connection conn, ArrayList<Option> opList) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertOption");
		
		try {
			
			for(Option op : opList) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, op.getOptionSize());
				pstmt.setInt(2, op.getStock());
				
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertImg(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Option> selectOptionList(Connection conn, int productNo) {
		ArrayList<Option> opList = new ArrayList<Option>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOptionList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				opList.add(new Option(rset.getInt("OPTION_NO"),
								      rset.getString("OPTION_SIZE"),
									  rset.getInt("OPTION_STOCK")
						));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return opList;
	}

	public int insertOption(Connection conn, Option o) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertOptionBox");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, o.getOptionSize());
			pstmt.setInt(2, o.getStock());
			pstmt.setInt(3, o.getProductNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteOption(Connection conn, int optionNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteOption");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, optionNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateProduct(Connection conn, ProductA p) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getProductName());
			pstmt.setString(2, p.getProductDesc());
			pstmt.setInt(3, p.getProductDiscount());
			pstmt.setInt(4, p.getProductPrice());
			pstmt.setInt(5, Integer.parseInt(p.getCategoryNo()));
			pstmt.setInt(6, Integer.parseInt(p.getBrandNo()));
			pstmt.setInt(7, p.getProductNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateAttachmentList(Connection conn, ArrayList<Attachment> updateAtList) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAttachmentList");
		
		try {
			
			for(Attachment at : updateAtList) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileNo());
				
				// 실행
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAttachmentList2(Connection conn, ArrayList<Attachment> newAtList) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachmentList2");
		
		try {
			
			for(Attachment at : newAtList) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, at.getRefBno());
				pstmt.setString(2, at.getOriginName());
				pstmt.setString(3, at.getChangeName());
				pstmt.setString(4, at.getFilePath());
				pstmt.setInt(5, at.getFileLevel());
				
				// 실행
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateOptionList(Connection conn, ArrayList<Option> updateOpList) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateOptionList");
		
		try {
			
			for(Option op : updateOpList) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, op.getOptionSize());
				pstmt.setInt(2, op.getStock());
				pstmt.setInt(3, op.getOptionNo());
				
				// 실행
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertOptionList(Connection conn, ArrayList<Option> newOpList) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertOptionList");
		
		try {
			
			for(Option op : newOpList) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, op.getOptionSize());
				pstmt.setInt(2, op.getStock());
				pstmt.setInt(3, op.getProductNo());
				
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
