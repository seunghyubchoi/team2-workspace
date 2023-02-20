package com.kh.product.model.vo;

public class ProductImage {
	private int productImgNo;
	private String productImgName;
	private String productImgSrc;
	private int productNo;
	private int imgType;
	
	public ProductImage() {}


	public ProductImage(int productImgNo, String productImgName, String productImgSrc, int productNo, int imgType) {
		super();
		this.productImgNo = productImgNo;
		this.productImgName = productImgName;
		this.productImgSrc = productImgSrc;
		this.productNo = productNo;
		this.imgType = imgType;
	}

	public int getProductImgNo() {
		return productImgNo;
	}

	public void setProductImgNo(int productImgNo) {
		this.productImgNo = productImgNo;
	}

	public String getProductImgName() {
		return productImgName;
	}

	public void setProductImgName(String productImgName) {
		this.productImgName = productImgName;
	}

	public String getProductImgSrc() {
		return productImgSrc;
	}

	public void setProductImgSrc(String productImgSrc) {
		this.productImgSrc = productImgSrc;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	

	public int getImgType() {
		return imgType;
	}


	public void setImgType(int imgType) {
		this.imgType = imgType;
	}


	@Override
	public String toString() {
		return "ProductImage [productImgNo=" + productImgNo + ", productImgName=" + productImgName + ", productImgSrc="
				+ productImgSrc + ", productNo=" + productNo + ", imgType=" + imgType + "]";
	}


	
	
}
