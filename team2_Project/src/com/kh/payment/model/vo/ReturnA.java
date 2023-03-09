package com.kh.payment.model.vo;

public class ReturnA {
	private int returnNo;
	private String returnStatus;
	private String returnReason;
	private int memNo;
	private String dtlOrderNo;
	
	public ReturnA() {}

	public ReturnA(int returnNo, String returnStatus, String returnReason, int memNo, String dtlOrderNo) {
		super();
		this.returnNo = returnNo;
		this.returnStatus = returnStatus;
		this.returnReason = returnReason;
		this.memNo = memNo;
		this.dtlOrderNo = dtlOrderNo;
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

	public String getDtlOrderNo() {
		return dtlOrderNo;
	}

	public void setDtlOrderNo(String dtlOrderNo) {
		this.dtlOrderNo = dtlOrderNo;
	}

	@Override
	public String toString() {
		return "ReturnA [returnNo=" + returnNo + ", returnStatus=" + returnStatus + ", returnReason=" + returnReason
				+ ", memNo=" + memNo + ", dtlOrderNo=" + dtlOrderNo + "]";
	}
	
}
