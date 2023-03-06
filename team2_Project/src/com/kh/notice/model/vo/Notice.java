package com.kh.notice.model.vo;

import java.sql.Date;

public class Notice { // class start
	// field
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private String managerNo;
	private String delYn;
	private int count;
	
	// constructor
	public Notice() {}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date noticeDate, String managerNo,
			String delYn,int count) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.managerNo = managerNo;
		this.delYn = delYn;
		this.count =count;
	}
//list
	public Notice(int noticeNo, String noticeTitle, Date noticeDate , int count) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeDate = noticeDate;
		this.count=count;
	}

//희연님
	public Notice(int noticeNo, String noticeTitle, Date noticeDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeDate = noticeDate;
	}

	
	
	//디테일
	public Notice( String noticeTitle, int noticeNo, String noticeContent, Date noticeDate, String managerNo) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeNo = noticeNo;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.managerNo = managerNo;
	}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date noticeDate, String managerNo) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.managerNo = managerNo;
	}
	
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
	
	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	
	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeDate=" + noticeDate + ", managerNo=" + managerNo + ", delYn=" + delYn + ", count=" + count
				+ "]";
	}



} // class end
