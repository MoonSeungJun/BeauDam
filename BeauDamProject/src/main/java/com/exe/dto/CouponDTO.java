package com.exe.dto;

public class CouponDTO {

    private String id;

    // 10%
    private int coupon1;

    // 사용기간
    private String coupon1Period;

    // 20%
    private int coupon2;

    // 사용기간
    private String coupon2Period;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getCoupon1() {
        return coupon1;
    }

    public void setCoupon1(int coupon1) {
        this.coupon1 = coupon1;
    }

    public String getCoupon1Period() {
        return coupon1Period;
    }

    public void setCoupon1Period(String coupon1Period) {
        this.coupon1Period = coupon1Period;
    }

    public int getCoupon2() {
        return coupon2;
    }

    public void setCoupon2(int coupon2) {
        this.coupon2 = coupon2;
    }

    public String getCoupon2Period() {
        return coupon2Period;
    }

    public void setCoupon2Period(String coupon2Period) {
        this.coupon2Period = coupon2Period;
    }


}