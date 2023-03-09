package com.kh.community.model.vo;

public class InstaImage {
	
	// 필드부 생성
	private int instaImgNo;
	private int refCno;
	private String instaImgOrigin;
	private String instaImgSrc;
	private String instaImgChange;
	
	// 기본 생성자
	public InstaImage() {}

	// 매개변수 생성자
	public InstaImage(int instaImgNo, int refCno, String instaImgOrigin, String instaImgSrc, String instaImgChange) {
		super();
		this.instaImgNo = instaImgNo;
		this.refCno = refCno;
		this.instaImgOrigin = instaImgOrigin;
		this.instaImgSrc = instaImgSrc;
		this.instaImgChange = instaImgChange;
	}

	public InstaImage(String instaImgSrc, String instaImgOrigin, String instaImgChange) {
		super();
		this.instaImgSrc = instaImgSrc;
		this.instaImgOrigin = instaImgOrigin;
		this.instaImgChange = instaImgChange;
	}

	// setter/getter
	public int getInstaImgNo() {
		return instaImgNo;
	}

	public void setInstaImgNo(int instaImgNo) {
		this.instaImgNo = instaImgNo;
	}

	public int getRefCno() {
		return refCno;
	}

	public void setRefCno(int refCno) {
		this.refCno = refCno;
	}

	public String getInstaImgOrigin() {
		return instaImgOrigin;
	}

	public void setInstaImgOrigin(String instaImgOrigin) {
		this.instaImgOrigin = instaImgOrigin;
	}

	public String getInstaImgSrc() {
		return instaImgSrc;
	}

	public void setInstaImgSrc(String instaImgSrc) {
		this.instaImgSrc = instaImgSrc;
	}

	public String getInstaImgChange() {
		return instaImgChange;
	}

	public void setinstaImgChange(String instaImgChange) {
		this.instaImgChange = instaImgChange;
	}

	// toString
	@Override
	public String toString() {
		return "InstaImage [instaImgNo=" + instaImgNo + ", refCno=" + refCno + ", instaImgOrigin=" + instaImgOrigin
				+ ", instaImgSrc=" + instaImgSrc + ", instaImgChange=" + instaImgChange + "]";
	}

}
