package com.kh.payment.model.vo;

public class OrderDtlA {
	
	private String productImgSrc;
	private int orderNo;
	private int dtlOrderNo;
	private String productNo;
	private String dtlSize;
	private int dtlQnt;
	private String orderStatus;
	
	
	public OrderDtlA() {}


	public OrderDtlA(String productImgSrc, int orderNo, int dtlOrderNo, String productNo, String dtlSize, int dtlQnt,
			String orderStatus) {
		super();
		this.productImgSrc = productImgSrc;
		this.orderNo = orderNo;
		this.dtlOrderNo = dtlOrderNo;
		this.productNo = productNo;
		this.dtlSize = dtlSize;
		this.dtlQnt = dtlQnt;
		this.orderStatus = orderStatus;
	}


	public String getProductImgSrc() {
		return productImgSrc;
	}


	public void setProductImgSrc(String productImgSrc) {
		this.productImgSrc = productImgSrc;
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
		return "OrderDtlA [productImgSrc=" + productImgSrc + ", orderNo=" + orderNo + ", dtlOrderNo=" + dtlOrderNo
				+ ", productNo=" + productNo + ", dtlSize=" + dtlSize + ", dtlQnt=" + dtlQnt + ", orderStatus="
				+ orderStatus + "]";
	}


	
}
