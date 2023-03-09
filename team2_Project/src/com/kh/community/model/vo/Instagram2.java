package com.kh.community.model.vo;

import java.sql.Date;

public class Instagram2 {

	// 필드부 선언
	private int comNo;
	private String comContent;
	private String comTag;
	private String instaId;
	private int imgNo;
	private String delYn;
	private String memNo;
	private Date uploadDate;

	private String instaImgOrigin;
	private String instaImgChange;
	private String instaImgSrc;

	// 기본 생성자
	public Instagram2() {
	}

	// 매개변수 생성자

	public Instagram2(int comNo, String instaId, String instaImgSrc) {
		super();
		this.comNo = comNo;
		this.instaId = instaId;
		this.instaImgSrc = instaImgSrc;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public String getComContent() {
		return comContent;
	}

	public void setComContent(String comContent) {
		this.comContent = comContent;
	}

	public String getComTag() {
		return comTag;
	}

	public void setComTag(String comTag) {
		this.comTag = comTag;
	}

	public String getInstaId() {
		return instaId;
	}

	public void setInstaId(String instaId) {
		this.instaId = instaId;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getInstaImgOrigin() {
		return instaImgOrigin;
	}

	public void setInstaImgOrigin(String instaImgOrigin) {
		this.instaImgOrigin = instaImgOrigin;
	}

	public String getInstaImgChange() {
		return instaImgChange;
	}

	public void setInstaImgChange(String instaImgChange) {
		this.instaImgChange = instaImgChange;
	}

	public String getInstaImgSrc() {
		return instaImgSrc;
	}

	public void setInstaImgSrc(String instaImgSrc) {
		this.instaImgSrc = instaImgSrc;
	}

	@Override
	public String toString() {
		return "Instagram2 [comNo=" + comNo + ", comContent=" + comContent + ", comTag=" + comTag + ", instaId="
				+ instaId + ", imgNo=" + imgNo + ", delYn=" + delYn + ", memNo=" + memNo + ", uploadDate=" + uploadDate
				+ ", instaImgOrigin=" + instaImgOrigin + ", instaImgChange=" + instaImgChange + ", instaImgSrc="
				+ instaImgSrc + "]";
	}



}