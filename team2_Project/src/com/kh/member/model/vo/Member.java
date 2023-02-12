package com.kh.member.model.vo;

import java.sql.Date;

public class Member {
	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String email;
	private String phone;
	private Date enrollDate;
	private String adCheck;
	private String gender;
	private String birthday;
	private String instaId;
	private String deactYn;
	private int mileage;
	
	public Member() {
		
	}

	
	
	
	
	
	public Member(int memNo, String memId, String memPwd, String memName, String email, String phone, Date enrollDate,
			String adCheck, String gender, String birthday, String instaId, String deactYn, int mileage) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.email = email;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.adCheck = adCheck;
		this.gender = gender;
		this.birthday = birthday;
		this.instaId = instaId;
		this.deactYn = deactYn;
		this.mileage = mileage;
	}

	

	






	public Member(String memId, String email, String phone, String adCheck, String gender, String birthday,
			String instaId) {
		super();
		this.memId = memId;
		this.email = email;
		this.phone = phone;
		this.adCheck = adCheck;
		this.gender = gender;
		this.birthday = birthday;
		this.instaId = instaId;
	}






	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getAdCheck() {
		return adCheck;
	}

	public void setAdCheck(String adCheck) {
		this.adCheck = adCheck;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getInstaId() {
		return instaId;
	}

	public void setInstaId(String instaId) {
		this.instaId = instaId;
	}

	public String getDeactYn() {
		return deactYn;
	}

	public void setDeactYn(String deactYn) {
		this.deactYn = deactYn;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName
				+ ", email=" + email + ", phone=" + phone + ", enrollDate=" + enrollDate + ", adCheck=" + adCheck
				+ ", gender=" + gender + ", birthday=" + birthday + ", instaId=" + instaId + ", deactYn=" + deactYn
				+ ", mileage=" + mileage + "]";
	}
	
	
	
}
