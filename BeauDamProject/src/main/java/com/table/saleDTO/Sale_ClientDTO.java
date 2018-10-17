package com.table.saleDTO;

public class Sale_ClientDTO {

    private String sale_Code;

    private String id;

    private String name;

    private String tel;

    private String cellphone;

    private String addr;

    // 배송메세지
    private String message;

    public String getSaleCode() {
        return sale_Code;
    }

    public void setSaleCode(String sale_Code) {
        this.sale_Code = sale_Code;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }


}