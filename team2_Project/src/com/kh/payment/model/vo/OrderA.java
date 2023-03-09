package com.kh.payment.model.vo;

import java.sql.Date;

/**
 * @author phy
 *
 */
public class OrderA {
	private int orderNo; 
	private String memNo; 
	private int orderQnt; 
	private Date orderDate; 
	private String orderStatus;
	private String rcpAddressName;
	private String rcpName;
	private String rcpPhone;
	private String rcpAddress;
	private String rcpAddressDtl; 
	private String rcpPostCode;
	private String rcpMsg;
	private int saveMileage;
	private int useMileage;
	private String memId;
	private String memName;
	private String email;
	private String phone;
	
	public OrderA() {}

	public OrderA(int orderNo, String memNo, int orderQnt, Date orderDate, String orderStatus, String rcpAddressName,
			String rcpName, String rcpPhone, String rcpAddress, String rcpAddressDtl, String rcpPostCode, String rcpMsg,
			int saveMileage, int useMileage, String memId, String memName, String email, String phone) {
		super();
		this.orderNo = orderNo;
		this.memNo = memNo;
		this.orderQnt = orderQnt;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.rcpAddressName = rcpAddressName;
		this.rcpName = rcpName;
		this.rcpPhone = rcpPhone;
		this.rcpAddress = rcpAddress;
		this.rcpAddressDtl = rcpAddressDtl;
		this.rcpPostCode = rcpPostCode;
		this.rcpMsg = rcpMsg;
		this.saveMileage = saveMileage;
		this.useMileage = useMileage;
		this.memId = memId;
		this.memName = memName;
		this.email = email;
		this.phone = phone;
	}

	public OrderA(int orderNo, String memNo, Date orderDate, String orderStatus) {
		super();
		this.orderNo = orderNo;
		this.memNo = memNo;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
	}

	public OrderA(int orderNo, int orderQnt, String orderStatus, String rcpAddressName, String rcpName, String rcpPhone,
			String rcpAddress, String rcpAddressDtl, String rcpPostCode, String rcpMsg, int saveMileage) {
		super();
		this.orderNo = orderNo;
		this.orderQnt = orderQnt;
		this.orderStatus = orderStatus;
		this.rcpAddressName = rcpAddressName;
		this.rcpName = rcpName;
		this.rcpPhone = rcpPhone;
		this.rcpAddress = rcpAddress;
		this.rcpAddressDtl = rcpAddressDtl;
		this.rcpPostCode = rcpPostCode;
		this.rcpMsg = rcpMsg;
		this.saveMileage = saveMileage;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public int getOrderQnt() {
		return orderQnt;
	}

	public void setOrderQnt(int orderQnt) {
		this.orderQnt = orderQnt;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getRcpAddressName() {
		return rcpAddressName;
	}

	public void setRcpAddressName(String rcpAddressName) {
		this.rcpAddressName = rcpAddressName;
	}

	public String getRcpName() {
		return rcpName;
	}

	public void setRcpName(String rcpName) {
		this.rcpName = rcpName;
	}

	public String getRcpPhone() {
		return rcpPhone;
	}

	public void setRcpPhone(String rcpPhone) {
		this.rcpPhone = rcpPhone;
	}

	public String getRcpAddress() {
		return rcpAddress;
	}

	public void setRcpAddress(String rcpAddress) {
		this.rcpAddress = rcpAddress;
	}

	public String getRcpAddressDtl() {
		return rcpAddressDtl;
	}

	public void setRcpAddressDtl(String rcpAddressDtl) {
		this.rcpAddressDtl = rcpAddressDtl;
	}

	public String getRcpPostCode() {
		return rcpPostCode;
	}

	public void setRcpPostCode(String rcpPostCode) {
		this.rcpPostCode = rcpPostCode;
	}

	public String getRcpMsg() {
		return rcpMsg;
	}

	public void setRcpMsg(String rcpMsg) {
		this.rcpMsg = rcpMsg;
	}

	public int getSaveMileage() {
		return saveMileage;
	}

	public void setSaveMileage(int saveMileage) {
		this.saveMileage = saveMileage;
	}

	public int getUseMileage() {
		return useMileage;
	}

	public void setUseMileage(int useMileage) {
		this.useMileage = useMileage;
	}

	public String getMemId() {
		return memId;
	}
	
	public void setMemId(String memId) {
		this.memId = memId;
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

	@Override
	public String toString() {
		return "OrderA [orderNo=" + orderNo + ", memNo=" + memNo + ", orderQnt=" + orderQnt + ", orderDate=" + orderDate
				+ ", orderStatus=" + orderStatus + ", rcpAddressName=" + rcpAddressName + ", rcpName=" + rcpName
				+ ", rcpPhone=" + rcpPhone + ", rcpAddress=" + rcpAddress + ", rcpAddressDtl=" + rcpAddressDtl
				+ ", rcpPostCode=" + rcpPostCode + ", rcpMsg=" + rcpMsg + ", saveMileage=" + saveMileage
				+ ", useMileage=" + useMileage + ", memId=" + memId + ", memName=" + memName + ", email=" + email
				+ ", phone=" + phone + "]";
	}
	
}
