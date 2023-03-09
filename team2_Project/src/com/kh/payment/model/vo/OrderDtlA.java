package com.kh.payment.model.vo;

import java.sql.Date;

public class OrderDtlA {
	
	private String filePath;
	private int orderNo;
	private int dtlOrderNo;
	private Date orderDate;
	private String rcpName;
	private String rcpPhone;
	private String rcpAddress;
	private String rcpAddressDtl;
	private String rcpPostCode;
	private String productNo;
	private String dtlSize;
	private int dtlQnt;
	private String orderStatus;
	
	
	public OrderDtlA() {}


	public OrderDtlA(String filePath, int orderNo, int dtlOrderNo, Date orderDate, String rcpName, String rcpPhone,
			String rcpAddress, String rcpAddressDtl, String rcpPostCode, String productNo, String dtlSize, int dtlQnt,
			String orderStatus) {
		super();
		this.filePath = filePath;
		this.orderNo = orderNo;
		this.dtlOrderNo = dtlOrderNo;
		this.orderDate = orderDate;
		this.rcpName = rcpName;
		this.rcpPhone = rcpPhone;
		this.rcpAddress = rcpAddress;
		this.rcpAddressDtl = rcpAddressDtl;
		this.rcpPostCode = rcpPostCode;
		this.productNo = productNo;
		this.dtlSize = dtlSize;
		this.dtlQnt = dtlQnt;
		this.orderStatus = orderStatus;
	}


	public OrderDtlA(String filePath, int orderNo, int dtlOrderNo, String productNo, String dtlSize, int dtlQnt,
			String orderStatus) {
		super();
		this.filePath = filePath;
		this.orderNo = orderNo;
		this.dtlOrderNo = dtlOrderNo;
		this.productNo = productNo;
		this.dtlSize = dtlSize;
		this.dtlQnt = dtlQnt;
		this.orderStatus = orderStatus;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public int getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}


	public int getDtlOrderNo() {
		return dtlOrderNo;
	}


	public void setDtlOrderNo(int dtlOrderNo) {
		this.dtlOrderNo = dtlOrderNo;
	}


	public Date getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}


	public String getRcpName() {
		return rcpName;
	}


	public void setRcpName(String rcpName) {
		this.rcpName = rcpName;
	}


	public String getRcpPhone() {
		return rcpPhone;
	}


	public void setRcpPhone(String rcpPhone) {
		this.rcpPhone = rcpPhone;
	}


	public String getRcpAddress() {
		return rcpAddress;
	}


	public void setRcpAddress(String rcpAddress) {
		this.rcpAddress = rcpAddress;
	}


	public String getRcpAddressDtl() {
		return rcpAddressDtl;
	}


	public void setRcpAddressDtl(String rcpAddressDtl) {
		this.rcpAddressDtl = rcpAddressDtl;
	}


	public String getRcpPostCode() {
		return rcpPostCode;
	}


	public void setRcpPostCode(String rcpPostCode) {
		this.rcpPostCode = rcpPostCode;
	}


	public String getProductNo() {
		return productNo;
	}


	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}


	public String getDtlSize() {
		return dtlSize;
	}


	public void setDtlSize(String dtlSize) {
		this.dtlSize = dtlSize;
	}


	public int getDtlQnt() {
		return dtlQnt;
	}


	public void setDtlQnt(int dtlQnt) {
		this.dtlQnt = dtlQnt;
	}


	public String getOrderStatus() {
		return orderStatus;
	}


	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}


	@Override
	public String toString() {
		return "OrderDtlA [filePath=" + filePath + ", orderNo=" + orderNo + ", dtlOrderNo=" + dtlOrderNo
				+ ", orderDate=" + orderDate + ", rcpName=" + rcpName + ", rcpPhone=" + rcpPhone + ", rcpAddress="
				+ rcpAddress + ", rcpAddressDtl=" + rcpAddressDtl + ", rcpPostCode=" + rcpPostCode + ", productNo="
				+ productNo + ", dtlSize=" + dtlSize + ", dtlQnt=" + dtlQnt + ", orderStatus=" + orderStatus + "]";
	}


	

	
}
