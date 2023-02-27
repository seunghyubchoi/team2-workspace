package com.kh.notice.model.vo;

import java.sql.Date;

public class Notice { // class start
	// field
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeFile;
	private Date noticeDate;
	private String managerNo;
	
	// constructor
	public Notice() {}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, String noticeFile, Date noticeDate,
			String managerNo) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeFile = noticeFile;
		this.noticeDate = noticeDate;
		this.managerNo = managerNo;
	}

	public Notice(int noticeNo, String noticeTitle, Date noticeDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeDate = noticeDate;
	}

	// method
	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeFile() {
		return noticeFile;
	}

	public void setNoticeFile(String noticeFile) {
		this.noticeFile = noticeFile;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(String managerNo) {
		this.managerNo = managerNo;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeFile=" + noticeFile + ", noticeDate=" + noticeDate + ", managerNo=" + managerNo + "]";
	}
	
} // class end
