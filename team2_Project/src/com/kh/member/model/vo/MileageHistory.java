package com.kh.member.model.vo;

public class MileageHistory {
	private int mileageNo;
	private String mileageHistory;
	private int mileage;
	private String productNo;
	private int memNo;
	
	public MileageHistory() {}

	public MileageHistory(int mileageNo, String mileageHistory, int mileage, String productNo, int memNo) {
		super();
		this.mileageNo = mileageNo;
		this.mileageHistory = mileageHistory;
		this.mileage = mileage;
		this.productNo = productNo;
		this.memNo = memNo;
	}

	public int getMileageNo() {
		return mileageNo;
	}

	public void setMileageNo(int mileageNo) {
		this.mileageNo = mileageNo;
	}

	public String getMileageHistory() {
		return mileageHistory;
	}

	public void setMileageHistory(String mileageHistory) {
		this.mileageHistory = mileageHistory;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	@Override
	public String toString() {
		return "MileageHistory [mileageNo=" + mileageNo + ", mileageHistory=" + mileageHistory + ", mileage=" + mileage
				+ ", productNo=" + productNo + ", memNo=" + memNo + "]";
	}
}
