package com.kh.inquire.model.vo;

import java.sql.Date;

public class Inquire {
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private int qndViewCount; 
	private String ansContent;
	private Date ansDate;
	private String ansYn;
	private String delYn;
	private String headerNo;
	private String managerNo;
	private String memNo;
	
	public Inquire() {}

	public Inquire(int qnaNo, String qnaTitle, String qnaContent, Date qnaDate, int qndViewCount, String ansContent,
			Date ansDate, String ansYn, String delYn, String headerNo, String managerNo, String memNo) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaDate = qnaDate;
		this.qndViewCount = qndViewCount;
		this.ansContent = ansContent;
		this.ansDate = ansDate;
		this.ansYn = ansYn;
		this.delYn = delYn;
		this.headerNo = headerNo;
		this.managerNo = managerNo;
		this.memNo = memNo;
	}

	public Inquire(int qnaNo, String qnaTitle, Date qnaDate, int qndViewCount, String ansYn, String headerNo,
			String memNo) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaDate = qnaDate;
		this.qndViewCount = qndViewCount;
		this.ansYn = ansYn;
		this.headerNo = headerNo;
		this.memNo = memNo;
	}

	public Inquire(int qnaNo, String qnaTitle, String qnaContent, Date qnaDate, String ansContent, Date ansDate,
			String ansYn, String headerNo, String managerNo, String memNo) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaDate = qnaDate;
		this.ansContent = ansContent;
		this.ansDate = ansDate;
		this.ansYn = ansYn;
		this.headerNo = headerNo;
		this.managerNo = managerNo;
		this.memNo = memNo;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	public int getQndViewCount() {
		return qndViewCount;
	}

	public void setQndViewCount(int qndViewCount) {
		this.qndViewCount = qndViewCount;
	}

	public String getAnsContent() {
		return ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public Date getAnsDate() {
		return ansDate;
	}

	public void setAnsDate(Date ansDate) {
		this.ansDate = ansDate;
	}

	public String getAnsYn() {
		return ansYn;
	}

	public void setAnsYn(String ansYn) {
		this.ansYn = ansYn;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public String getHeaderNo() {
		return headerNo;
	}

	public void setHeaderNo(String headerNo) {
		this.headerNo = headerNo;
	}

	public String getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(String managerNo) {
		this.managerNo = managerNo;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	@Override
	public String toString() {
		return "Inquire [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaDate="
				+ qnaDate + ", qndViewCount=" + qndViewCount + ", ansContent=" + ansContent + ", ansDate=" + ansDate
				+ ", ansYn=" + ansYn + ", delYn=" + delYn + ", headerNo=" + headerNo + ", managerNo=" + managerNo
				+ ", memNo=" + memNo + "]";
	}
	
}
