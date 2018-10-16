package com.exe.dto;

public class Sale_DateDTO {

    private String saleCode;

    // 결제수단
    private String paymentMethod;

    // 결제상태
    private String payStatus;

    // 배송상태
    private String deleveryStatus;

    private String useCoupon;

    private String saleString;

    private int usePoint;

    private int totalPrice;

    public String getSaleCode() {
        return saleCode;
    }

    public void setSaleCode(String saleCode) {
        this.saleCode = saleCode;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }

    public String getDeleveryStatus() {
        return deleveryStatus;
    }

    public void setDeleveryStatus(String deleveryStatus) {
        this.deleveryStatus = deleveryStatus;
    }

    public String getUseCoupon() {
        return useCoupon;
    }

    public void setUseCoupon(String useCoupon) {
        this.useCoupon = useCoupon;
    }

    public String getSaleString() {
        return saleString;
    }

    public void setSaleString(String saleString) {
        this.saleString = saleString;
    }

    public int getUsePoint() {
        return usePoint;
    }

    public void setUsePoint(int usePoint) {
        this.usePoint = usePoint;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }


}