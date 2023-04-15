package com.shop.model;

public class Cart {
    private Integer id;
    private String vipId;
    private Integer commodityId;
    private Integer number;
    private double price;
    private String photo;

    private double totle;

    public double getTotle() {
        return number*price;
    }

    public void setTotle(double totle) {
        this.totle = totle;
    }

    public String getVipId() {
        return vipId;
    }

    private String commodityName;

    public String getCommodityName() {
        return commodityName;
    }

    public void setCommodityName(String commodityName) {
        this.commodityName = commodityName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getViptId() {
        return vipId;
    }

    public void setVipId(String viptId) {
        this.vipId = viptId;
    }

    public Integer getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(Integer commodityId) {
        this.commodityId = commodityId;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
}
