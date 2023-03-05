package com.kh.manager.model.vo;

public class Manager {
	private int managerNo;
	private String managerId;
	private String managerPwd; 
	private String managerName;
	
	public Manager() {
		
	}

	public Manager(int managerNo, String managerId, String managerPwd, String managerName) {
		super();
		this.managerNo = managerNo;
		this.managerId = managerId;
		this.managerPwd = managerPwd;
		this.managerName = managerName;
	}

	public int getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getManagerPwd() {
		return managerPwd;
	}

	public void setManagerPwd(String managerPwd) {
		this.managerPwd = managerPwd;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	@Override
	public String toString() {
		return "Manager [managerNo=" + managerNo + ", managerId=" + managerId + ", managerPwd=" + managerPwd
				+ ", managerName=" + managerName + "]";
	}

}
