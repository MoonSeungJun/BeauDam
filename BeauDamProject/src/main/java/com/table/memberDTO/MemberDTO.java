package com.table.memberDTO;

public class MemberDTO {

    private String id;

    private String pwd;

    private String nickName;

    // Ε»Επ½Γ 1
    private int isleave;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getNickname() {
        return nickName;
    }

    public void setNickname(String nickName) {
        this.nickName = nickName;
    }

    public int getIsleave() {
        return isleave;
    }

    public void setIsleave(int isleave) {
        this.isleave = isleave;
    }


}