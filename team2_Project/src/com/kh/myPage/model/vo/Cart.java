package com.kh.myPage.model.vo;

public class Cart {
	private int cartNo;
	private int cartQnt;
	private int productNo;
	private int memNo;
	private String cartSize;
	private String delYn;
	private String productName;
	private int productDiscount;
	private int productPrice;
	private int mileage;
	private String brandName;
	private String productImgSrc;
	
	public Cart() {
		
	}

	

	public Cart(int cartNo, int cartQnt, int productNo, int memNo, String cartSize, String delYn) {
		super();
		this.cartNo = cartNo;
		this.cartQnt = cartQnt;
		this.productNo = productNo;
		this.memNo = memNo;
		this.cartSize = cartSize;
		this.delYn = delYn;
	}

	

	public Cart(String productName, int productDiscount, int productPrice, int cartNo, int cartQnt, String cartSize,
			int mileage, String brandName, String productImgSrc) {
		super();
		this.productName = productName;
		this.productDiscount = productDiscount;
		this.productPrice = productPrice;
		this.cartNo = cartNo;
		this.cartQnt = cartQnt;
		this.cartSize = cartSize;
		this.mileage = mileage;
		this.brandName = brandName;
		this.productImgSrc = productImgSrc;
	}



	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getCartQnt() {
		return cartQnt;
	}

	public void setCartQnt(int cartQnt) {
		this.cartQnt = cartQnt;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	
	public String getCartSize() {
		return cartSize;
	}



	public void setCartSize(String cartSize) {
		this.cartSize = cartSize;
	}
	
	
	public String getDelYn() {
		return delYn;
	}



	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	
	


	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
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



	public int getMileage() {
		return mileage;
	}



	public void setMileage(int mileage) {
		this.mileage = mileage;
	}



	public String getBrandName() {
		return brandName;
	}



	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	

	public String getProductImgSrc() {
		return productImgSrc;
	}



	public void setProductImgSrc(String productImgSrc) {
		this.productImgSrc = productImgSrc;
	}



	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", cartQnt=" + cartQnt + ", productNo=" + productNo + ", memNo=" + memNo
				+ ", cartSize=" + cartSize + ", delYn=" + delYn + ", productName=" + productName + ", productDiscount="
				+ productDiscount + ", productPrice=" + productPrice + ", mileage=" + mileage + ", brandName="
				+ brandName + ", productImgSrc=" + productImgSrc + "]";
	}




}
