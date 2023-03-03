package com.kh.community.model.vo;

import oracle.sql.DATE;

public class AnswerInstagram {
	
	// 필드부 선언
	private int ansNo;
	private String ansContent;
	private String ansDate;
	private String addAnsYn;
	private int ogAnsNo;
	private String delYn;
	private int comNo;
	private String memNo;
	
	// 기본 생성자
	public AnswerInstagram() {}

	// 매개변수 생성자
	public AnswerInstagram(int ansNo, String ansContent, String ansDate, String addAnsYn, int ogAnsNo, String delYn,
			int comNo, String memNo) {
		super();
		this.ansNo = ansNo;
		this.ansContent = ansContent;
		this.ansDate = ansDate;
		this.addAnsYn = addAnsYn;
		this.ogAnsNo = ogAnsNo;
		this.delYn = delYn;
		this.comNo = comNo;
		this.memNo = memNo;
	}
	
	public AnswerInstagram(int ansNo, String ansContent, String ansDate, String memNo) {
		super();
		this.ansNo = ansNo;
		this.ansContent = ansContent;
		this.ansDate = ansDate;
		this.memNo = memNo;
	}

	// setter/getter
	public int getAnsNo() {
		return ansNo;
	}
	
	public void setAnsNo(int ansNo) {
		this.ansNo = ansNo;
	}
	
	public String getAnsContent() {
		return ansContent;
	}
	
	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}
	
	public String getAnsDate() {
		return ansDate;
	}
	
	public void setAnsDate(String ansDate) {
		this.ansDate = ansDate;
	}
	
	public String getAddAnsYn() {
		return addAnsYn;
	}
	
	public void setAddAnsYn(String addAnsYn) {
		this.addAnsYn = addAnsYn;
	}
	
	public int getOgAnsNo() {
		return ogAnsNo;
	}
	
	public void setOgAnsNo(int ogAnsNo) {
		this.ogAnsNo = ogAnsNo;
	}
	
	public String getDelYn() {
		return delYn;
	}
	
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	
	public int getComNo() {
		return comNo;
	}
	
	public void setComNo(int comNo) {
		this.comNo = comNo;
	}
	
	public String getMemNo() {
		return memNo;
	}
	
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	
	// toString
	@Override
	public String toString() {
		return "AnswerInstagram [ansNo=" + ansNo + ", ansContent=" + ansContent + ", ansDate=" + ansDate + ", addAnsYn="
				+ addAnsYn + ", ogAnsNo=" + ogAnsNo + ", delYn=" + delYn + ", comNo=" + comNo + ", memNo=" + memNo
				+ "]";
	}

}
