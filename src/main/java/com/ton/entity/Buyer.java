package com.ton.entity;

public class Buyer {
    private  int buyerid;
    private String buyerpass;
    private  String buyername;

    public String getBuyername() {
        return buyername;
    }

    public void setBuyername(String buyername) {
        this.buyername = buyername;
    }

    public int getBuyerid() {
        return buyerid;
    }

    public void setBuyerid(int buyerid) {
        this.buyerid = buyerid;
    }

    public String getBuyerpass() {
        return buyerpass;
    }

    public void setBuyerpass(String buyerpass) {
        this.buyerpass = buyerpass;
    }
}
