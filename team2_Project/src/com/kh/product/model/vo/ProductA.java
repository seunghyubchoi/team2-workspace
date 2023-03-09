package com.kh.product.model.vo;

import java.sql.Date;

public class ProductA {
	private int productNo;
	private String productName;
	private String productDesc;
	private int productDiscount;
	private int productPrice;
	private Date productEnrollDate;
	private int productViewCount;
	private String delYn;
	private String categoryNo;
	private String brandNo;
	
	public ProductA() {}

	public ProductA(int productNo, String productName, String productDesc, int productDiscount, int productPrice,
			Date productEnrollDate, int productViewCount, String delYn, String categoryNo, String brandNo) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productDesc = productDesc;
		this.productDiscount = productDiscount;
		this.productPrice = productPrice;
		this.productEnrollDate = productEnrollDate;
		this.productViewCount = productViewCount;
		this.delYn = delYn;
		this.categoryNo = categoryNo;
		this.brandNo = brandNo;
	}

	public ProductA(int productNo, String productName, int productPrice, int productViewCount, String categoryNo,
			String brandNo) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productViewCount = productViewCount;
		this.categoryNo = categoryNo;
		this.brandNo = brandNo;
	}
	
	public ProductA(int productNo, String productName, String productDesc, int productDiscount, int productPrice,
			String categoryNo, String brandNo) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productDesc = productDesc;
		this.productDiscount = productDiscount;
		this.productPrice = productPrice;
		this.categoryNo = categoryNo;
		this.brandNo = brandNo;
	}

	public ProductA(int productNo, String productName, int productDiscount, int productPrice, String brandNo) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productDiscount = productDiscount;
		this.productPrice = productPrice;
		this.brandNo = brandNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public int getProductDiscount() {
		return productDiscount;
	}

	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public Date getProductEnrollDate() {
		return productEnrollDate;
	}

	public void setProductEnrollDate(Date productEnrollDate) {
		this.productEnrollDate = productEnrollDate;
	}

	public int getProductViewCount() {
		return productViewCount;
	}

	public void setProductViewCount(int productViewCount) {
		this.productViewCount = productViewCount;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getBrandNo() {
		return brandNo;
	}

	public void setBrandNo(String brandNo) {
		this.brandNo = brandNo;
	}

	@Override
	public String toString() {
		return "Product2 [productNo=" + productNo + ", productName=" + productName + ", productDesc=" + productDesc
				+ ", productDiscount=" + productDiscount + ", productPrice=" + productPrice + ", productEnrollDate="
				+ productEnrollDate + ", productViewCount=" + productViewCount + ", delYn=" + delYn + ", categoryNo="
				+ categoryNo + ", brandNo=" + brandNo + "]";
	}
	
}
