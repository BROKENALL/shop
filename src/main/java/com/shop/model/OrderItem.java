package com.shop.model;

import lombok.Data;

import javax.persistence.Entity;
import java.math.BigDecimal;

/**
 * 购物车项
 */
@Data
public class OrderItem {
    private Integer id;
    private Integer orderId;//订单编号
    private String commodityName;
    private String commodityPhoto;
    private Integer commodityId;//商品id
    private double price;
    private Integer number;

    private double total;


    //获取小计价格
    public double getTotal() {
        return this.price*number;
    }
}

