package com.kh.product.model.vo;

public class ProductImage {
	private int productImgNo;
	private String productImgName;
	private String changeName;
	private String filePath;
	private int productNo;
	private int imgType;
	
	public ProductImage() {}

	
	
	public ProductImage(int productImgNo, String changeName, String filePath, int productNo, int imgType) {
		super();
		this.productImgNo = productImgNo;
		this.changeName = changeName;
		this.filePath = filePath;
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

	

	public String getChangeName() {
		return changeName;
	}



	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}



	public String getFilePath() {
		return filePath;
	}



	public void setFilePath(String filePath) {
		this.filePath = filePath;
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
		return "ProductImage [productImgNo=" + productImgNo + ", productImgName=" + productImgName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", productNo=" + productNo + ", imgType=" + imgType + "]";
	}


	

	
	
}
