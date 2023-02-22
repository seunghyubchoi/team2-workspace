package com.kh.product.model.vo;

public class ReviewImage {
	private String reviewImgName;
	private String reviewImgSrc;
	private int reviewNo;
	
	public ReviewImage() {}

	public ReviewImage(String reviewImgName, String reviewImgSrc, int reviewNo) {
		super();
		this.reviewImgName = reviewImgName;
		this.reviewImgSrc = reviewImgSrc;
		this.reviewNo = reviewNo;
	}


	public String getReviewImgName() {
		return reviewImgName;
	}

	public void setReviewImgName(String reviewImgName) {
		this.reviewImgName = reviewImgName;
	}

	public String getReviewImgSrc() {
		return reviewImgSrc;
	}

	public void setReviewImgSrc(String reviewImgSrc) {
		this.reviewImgSrc = reviewImgSrc;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	@Override
	public String toString() {
		return "ReviewImage [reviewImgName=" + reviewImgName + ", reviewImgSrc=" + reviewImgSrc + ", reviewNo="
				+ reviewNo + "]";
	}

	
	
}
