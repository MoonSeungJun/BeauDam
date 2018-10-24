package com.file.upload;

import org.springframework.web.multipart.*;


public class ProductUpload {

	private String brand;
	private String category;
	private String type;
	private String count;
	private String code;
	private String productName;
	private String price;
	private String colorCode;
	private String color;
	private MultipartFile thumbImg;
	private MultipartFile detailImg;
	private String thumbOriginalFileName;
	private String thumbSaveFileName;
	private String detailOriginalFileName;
	private String detailSaveFileName;

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getColorCode() {
		return colorCode;
	}

	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public MultipartFile getThumbImg() {
		return thumbImg;
	}

	public void setThumbImg(MultipartFile thumbImg) {
		this.thumbImg = thumbImg;
	}

	public MultipartFile getDetailImg() {
		return detailImg;
	}

	public void setDetailImg(MultipartFile detailImg) {
		this.detailImg = detailImg;
	}

	public String getThumbOriginalFileName() {
		return thumbOriginalFileName;
	}

	public void setThumbOriginalFileName(String thumbOriginalFileName) {
		this.thumbOriginalFileName = thumbOriginalFileName;
	}

	public String getThumbSaveFileName() {
		return thumbSaveFileName;
	}

	public void setThumbSaveFileName(String thumbSaveFileName) {
		this.thumbSaveFileName = thumbSaveFileName;
	}

	public String getDetailOriginalFileName() {
		return detailOriginalFileName;
	}

	public void setDetailOriginalFileName(String detailOriginalFileName) {
		this.detailOriginalFileName = detailOriginalFileName;
	}

	public String getDetailSaveFileName() {
		return detailSaveFileName;
	}

	public void setDetailSaveFileName(String detailSaveFileName) {
		this.detailSaveFileName = detailSaveFileName;
	}

}
