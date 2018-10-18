package com.table.otherDTO;

public class BasketDTO {

    private int basket_Num;

    private String id;

    private String code;

    private String color_Code;

    private String product_Name;

    private int product_Price;

    private int qty;

    public int getBasketNum() {
        return basket_Num;
    }

    public void setBasketNum(int basket_Num) {
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

    public String getColorCode() {
        return color_Code;
    }

    public void setColorCode(String color_Code) {
        this.color_Code = color_Code;
    }

    public String getProductName() {
        return product_Name;
    }

    public void setProductName(String product_Name) {
        this.product_Name = product_Name;
    }

    public int getProductPrice() {
        return product_Price;
    }

    public void setProductPrice(int product_Price) {
        this.product_Price = product_Price;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

}