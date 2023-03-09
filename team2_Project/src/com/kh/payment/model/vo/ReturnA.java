package com.kh.payment.model.vo;

public class ReturnA {
	private int returnNo;
	private String returnStatus;
	private String returnReason;
	private int memNo;
	private String orderNo;
	
	public ReturnA() {}

	public ReturnA(int returnNo, String returnStatus, String returnReason, int memNo, String orderNo) {
		super();
		this.returnNo = returnNo;
		this.returnStatus = returnStatus;
		this.returnReason = returnReason;
		this.memNo = memNo;
		this.orderNo = orderNo;
	}
	
	public ReturnA(int returnNo, String returnStatus, String returnReason) {
		super();
		this.returnNo = returnNo;
		this.returnStatus = returnStatus;
		this.returnReason = returnReason;
	}

	public int getReturnNo() {
		return returnNo;
	}

	public void setReturnNo(int returnNo) {
		this.returnNo = returnNo;
	}

	public String getReturnStatus() {
		return returnStatus;
	}

	public void setReturnStatus(String returnStatus) {
		this.returnStatus = returnStatus;
	}

	public String getReturnReason() {
		return returnReason;
	}

	public void setReturnReason(String returnReason) {
		this.returnReason = returnReason;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	@Override
	public String toString() {
		return "ReturnA [returnNo=" + returnNo + ", returnStatus=" + returnStatus + ", returnReason=" + returnReason
				+ ", memNo=" + memNo + ", orderNo=" + orderNo + "]";
	}

	
	
}
