package com.kh.Qnaboard.model.vo;

public class Header {
	private int headerNo;
	private String headerContent; 
	

public Header() {}


public Header(int headerNo, String headerContent) {
	super();
	this.headerNo = headerNo;
	this.headerContent = headerContent;
}



public int getHeaderNo() {
	return headerNo;
}


public void setHeaderNo(int headerNo) {
	this.headerNo = headerNo;
}


public String getHeaderContent() {
	return headerContent;
}


public void setHeaderContent(String headerContent) {
	this.headerContent = headerContent;
}


@Override
public String toString() {
	return "Header [headerNo=" + headerNo + ", headerContent=" + headerContent + "]";
}




}
