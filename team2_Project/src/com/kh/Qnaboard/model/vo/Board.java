package com.kh.Qnaboard.model.vo;

import java.sql.Date;

public class Board {
//문의게시판입니당
private int QnaNo;
private String QnaTitle;
private String QnaContent;
private Date QnaDate;
private int count;
private String AnsContent;
private Date AnsDate;
private String AnsYn;
private String DelYn;
private int HeaderNo;
private String ManagerNo;
private String MemNo;
private String Qcategory;

public Board() {
	
}


public Board(int qnaNo, String qnaTitle, String qnaContent, Date qnaDate, String ansContent,Date ansDate,int count,
		String ansYn,String memNo,String managerNo) {
	super();
	this.QnaNo = qnaNo;
	this.QnaTitle = qnaTitle;
	this.QnaContent = qnaContent;
	this.QnaDate = qnaDate;
	this.AnsContent = ansContent;
	this.AnsDate = ansDate;
	this.count = count;
	this.AnsYn = ansYn;
	this.MemNo = memNo;
	this.ManagerNo = managerNo;
	
}





public Board(int qnaNo, String qnaTitle, String qnaContent, int headerNo) {
	super();
	QnaNo = qnaNo;
	QnaTitle = qnaTitle;
	QnaContent = qnaContent;
	HeaderNo = headerNo;
}


public Board(int qnaNo, String qnaTitle, Date qnaDate,String memNo, int count) {
	super();
	this.QnaNo = qnaNo;
	this.QnaTitle = qnaTitle;
	this.QnaDate = qnaDate;
	this.MemNo = memNo;
	this.count = count;
}






public Board(int qnaNo, String qnaTitle, String qnaContent, Date qnaDate, int count, String ansContent, Date ansDate,
		String ansYn, String delYn, int headerNo, String managerNo, String memNo, String qcategory) {
	super();
	this.QnaNo = qnaNo;
	this.QnaTitle = qnaTitle;
	this.QnaContent = qnaContent;
	this.QnaDate = qnaDate;
	this.count = count;
	this.AnsContent = ansContent;
	this.AnsDate = ansDate;
	this.AnsYn = ansYn;
	this.DelYn = delYn;
	this.HeaderNo = headerNo;
	this.ManagerNo = managerNo;
	this.MemNo = memNo;
	this.Qcategory = qcategory;
}






public int getQnaNo() {
	return QnaNo;
}






public void setQnaNo(int qnaNo) {
	QnaNo = qnaNo;
}






public String getQnaTitle() {
	return QnaTitle;
}






public void setQnaTitle(String qnaTitle) {
	QnaTitle = qnaTitle;
}






public String getQnaContent() {
	return QnaContent;
}






public void setQnaContent(String qnaContent) {
	QnaContent = qnaContent;
}






public Date getQnaDate() {
	return QnaDate;
}






public void setQnaDate(Date qnaDate) {
	QnaDate = qnaDate;
}






public int getCount() {
	return count;
}






public void setCount(int count) {
	this.count = count;
}






public String getAnsContent() {
	return AnsContent;
}






public void setAnsContent(String ansContent) {
	AnsContent = ansContent;
}






public Date getAnsDate() {
	return AnsDate;
}






public void setAnsDate(Date ansDate) {
	AnsDate = ansDate;
}






public String getAnsYn() {
	return AnsYn;
}






public void setAnsYn(String ansYn) {
	AnsYn = ansYn;
}






public String getDelYn() {
	return DelYn;
}






public void setDelYn(String delYn) {
	DelYn = delYn;
}






public int getHeaderNo() {
	return HeaderNo;
}






public void setHeaderNo(int headerNo) {
	HeaderNo = headerNo;
}






public String getManagerNo() {
	return ManagerNo;
}






public void setManagerNo(String managerNo) {
	ManagerNo = managerNo;
}






public String getMemNo() {
	return MemNo;
}






public void setMemNo(String memNo) {
	MemNo = memNo;
}






public String getQcategory() {
	return Qcategory;
}






public void setQcategory(String qcategory) {
	Qcategory = qcategory;
}






@Override
public String toString() {
	return "Board [QnaNo=" + QnaNo + ", QnaTitle=" + QnaTitle + ", QnaContent=" + QnaContent + ", QnaDate=" + QnaDate
			+ ", count=" + count + ", AnsContent=" + AnsContent + ", AnsDate=" + AnsDate + ", AnsYn=" + AnsYn
			+ ", DelYn=" + DelYn + ", HeaderNo=" + HeaderNo + ", ManagerNo=" + ManagerNo + ", MemNo=" + MemNo
			+ ", Qcategory=" + Qcategory + "]";
}












}
