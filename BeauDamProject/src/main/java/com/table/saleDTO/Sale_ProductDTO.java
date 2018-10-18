package com.table.saleDTO;

public class Sale_ProductDTO {

    private String sale_Code;

    private String code;

    private String brand;

    private String product_Name;

    private int product_Price;

    private String color_Code;

    private int qty;

    public String getSaleCode() {
        return sale_Code;
    }

    public void setSaleCode(String sale_Code) {
        this.sale_Code = sale_Code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
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

    public String getColorCode() {
        return color_Code;
    }

    public void setColorCode(String color_Code) {
        this.color_Code = color_Code;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }


}