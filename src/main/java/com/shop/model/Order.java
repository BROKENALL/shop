package com.shop.model;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class Order {
    private Integer id;
    private String orderCode;
    private String vipId;
    private LocalDateTime orderTime;
    private double total;

    private String payType;

    private String orderState;

    private String expressage;

    private List<OrderItem> orderItemList;

    private Integer addressId;

    private Address address;

    private String leaveMessage;


}
