package com.table.otherDTO;

public class BasketDTO {

	private int basket_Num;

	private String id;

	private String code;

	private String color_Name;

	private String color_Code;

	private String product_Name;

	private String thumb_Img;

	private int product_Price;

	private int qty; // 사용자가 주문한 수량

	private int qty_Max; // 재고수량

	public int getBasket_Num() {
		return basket_Num;
	}

	public void setBasket_Num(int basket_Num) {
		this.basket_Num = basket_Num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getColor_Name() {
		return color_Name;
	}

	public void setColor_Name(String color_Name) {
		this.color_Name = color_Name;
	}

	public String getColor_Code() {
		return color_Code;
	}

	public void setColor_Code(String color_Code) {
		this.color_Code = color_Code;
	}

	public String getProduct_Name() {
		return product_Name;
	}

	public void setProduct_Name(String product_Name) {
		this.product_Name = product_Name;
	}

	public String getThumb_Img() {
		return thumb_Img;
	}

	public void setThumb_Img(String thumb_Img) {
		this.thumb_Img = thumb_Img;
	}

	public int getProduct_Price() {
		return product_Price;
	}

	public void setProduct_Price(int product_Price) {
		this.product_Price = product_Price;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getQty_Max() {
		return qty_Max;
	}

	public void setQty_Max(int qty_Max) {
		this.qty_Max = qty_Max;
	}

}