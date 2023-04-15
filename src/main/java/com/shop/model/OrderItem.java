package com.shop.model;

import java.math.BigDecimal;

/**
 * 购物车项
 */
public class OrderItem {
    private Integer id;
    private String orderId;//订单编号
    private String commodityName;
    private String commodityPhoto;
    private Integer commodityId;//商品id
    private double price;
    private Integer number;

    private double total;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCommodityName() {
        return commodityName;
    }

    public void setCommodityName(String productName) {
        this.commodityName = productName;
    }

    public String getCommodityPhoto() {
        return commodityPhoto;
    }

    public void setCommodityPhoto(String productImgUrl) {
        this.commodityPhoto = productImgUrl;
    }

    public Integer getCommodityId() {
        return commodityId;
    }

    public void setProductId(Integer commodityId) {
        this.commodityId = commodityId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public void setCommodityId(Integer commodityId) {
        this.commodityId = commodityId;
    }

    //获取小计价格
    public double getTotal() {
        return this.price*number;
    }
}

