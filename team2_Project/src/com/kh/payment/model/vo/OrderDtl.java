package com.kh.payment.model.vo;

public class OrderDtl {

	private int orderDtlNo;
	private int orderNo;
	private int productNo;
	private String dtlSize;
	private int dtlQnt;
	private String delYn;
	
	public OrderDtl() {}

	public OrderDtl(int orderDtlNo, int orderNo, int productNo, String dtlSize, int dtlQnt, String delYn) {
		super();
		this.orderDtlNo = orderDtlNo;
		this.orderNo = orderNo;
		this.productNo = productNo;
		this.dtlSize = dtlSize;
		this.dtlQnt = dtlQnt;
		this.delYn = delYn;
	}
	
	public OrderDtl(int orderDtlNo, String dtlSize, int dtlQnt, String delYn) {
		super();
		this.orderDtlNo = orderDtlNo;
		this.dtlSize = dtlSize;
		this.dtlQnt = dtlQnt;
		this.delYn = delYn;
	}

	public OrderDtl(int orderDtlNo, String dtlSize, int dtlQnt) {
		super();
		this.orderDtlNo = orderDtlNo;
		this.dtlSize = dtlSize;
		this.dtlQnt = dtlQnt;
	}

	public int getOrderDtlNo() {
		return orderDtlNo;
	}

	public void setOrderDtlNo(int orderDtlNo) {
		this.orderDtlNo = orderDtlNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
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

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	@Override
	public String toString() {
		return "OrderDtl [orderDtlNo=" + orderDtlNo + ", orderNo=" + orderNo + ", productNo=" + productNo + ", dtlSize="
				+ dtlSize + ", dtlQnt=" + dtlQnt + ", delYn=" + delYn + "]";
	}
	
	
}
