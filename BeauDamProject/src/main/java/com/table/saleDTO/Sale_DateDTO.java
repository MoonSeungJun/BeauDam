package com.table.saleDTO;

public class Sale_DateDTO {

    private String sale_Code;

    // 결제수단
    private String payment_Method;

    // 결제상태
    private String pay_Status;

    // 배송상태
    private String delevery_Status;

    private String use_Coupon;

    private String saleDate;

    private int use_Point;

    private int total_Price;

    public String getSale_Code() {
        return sale_Code;
    }

    public void setSale_Code(String sale_Code) {
        this.sale_Code = sale_Code;
    }

    public String getPayment_Method() {
        return payment_Method;
    }

    public void setPayment_Method(String payment_Method) {
        this.payment_Method = payment_Method;
    }

    public String getPay_Status() {
        return pay_Status;
    }

    public void setPay_Status(String pay_Status) {
        this.pay_Status = pay_Status;
    }

    public String getDelevery_Status() {
        return delevery_Status;
    }

    public void setDelevery_Status(String delevery_Status) {
        this.delevery_Status = delevery_Status;
    }

    public String getUse_Coupon() {
        return use_Coupon;
    }

    public void setUse_Coupon(String use_Coupon) {
        this.use_Coupon = use_Coupon;
    }

    public String getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(String saleDate) {
        this.saleDate = saleDate;
    }

    public int getUse_Point() {
        return use_Point;
    }

    public void setUse_Point(int use_Point) {
        this.use_Point = use_Point;
    }

    public int getTotal_Price() {
        return total_Price;
    }

    public void setTotal_Price(int total_Price) {
        this.total_Price = total_Price;
    }


}