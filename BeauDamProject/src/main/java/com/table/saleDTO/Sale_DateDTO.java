package com.table.saleDTO;

public class Sale_DateDTO {

    private String sale_Code;

    // ��������
    private String payment_Method;

    // ��������
    private String pay_Status;

    // ��ۻ���
    private String delevery_Status;

    private String use_Coupon;

    private String saleDate;

    private int use_Point;

    private int total_Price;

    public String getSaleCode() {
        return sale_Code;
    }

    public void setSaleCode(String sale_Code) {
        this.sale_Code = sale_Code;
    }

    public String getPaymentMethod() {
        return payment_Method;
    }

    public void setPaymentMethod(String payment_Method) {
        this.payment_Method = payment_Method;
    }

    public String getPayStatus() {
        return pay_Status;
    }

    public void setPayStatus(String pay_Status) {
        this.pay_Status = pay_Status;
    }

    public String getDeleveryStatus() {
        return delevery_Status;
    }

    public void setDeleveryStatus(String delevery_Status) {
        this.delevery_Status = delevery_Status;
    }

    public String getUseCoupon() {
        return use_Coupon;
    }

    public void setUseCoupon(String use_Coupon) {
        this.use_Coupon = use_Coupon;
    }

    public String getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(String saleDate) {
        this.saleDate = saleDate;
    }

    public int getUsePoint() {
        return use_Point;
    }

    public void setUsePoint(int use_Point) {
        this.use_Point = use_Point;
    }

    public int getTotal_Price() {
        return total_Price;
    }

    public void setTotal_Price(int total_Price) {
        this.total_Price = total_Price;
    }


}