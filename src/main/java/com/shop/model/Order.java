package com.shop.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

public class Order {
    private Integer id;
    private String orderCode;
    private String vipId;
    private LocalDateTime orderTime;
    private double total;

    private PayType payType;

    private OrderState orderState = OrderState.CREATED;

    private Expressage expressage;

    private List<OrderItem> orderItemList;

    private Address address;

    public List<OrderItem> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public String getVipId() {
        return vipId;
    }

    public void setVipId(String vipId) {
        this.vipId = vipId;
    }

    public LocalDateTime getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(LocalDateTime orderTime) {
        this.orderTime = orderTime;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }


    public PayType getPayType() {
        return payType;
    }

    public void setPayType(PayType payType) {
        this.payType = payType;
    }

    public OrderState getOrderState() {
        return orderState;
    }

    public void setOrderState(OrderState orderState) {
        this.orderState = orderState;
    }

    public Expressage getExpressage() {
        return expressage;
    }

    public void setExpressage(Expressage expressage) {
        this.expressage = expressage;
    }

    public enum PayType {
        ALI_PAY("支付宝"),
        TENCENT_PAY("微信支付"),
        YINLIAN_PAY("银联支付");
        private final String name;

        PayType(String name) {
            this.name = name;
        }

        public String getName() {
            return name;
        }

        @Override
        public String toString() {
            return this.name;
        }
    }


    public enum OrderState {
        CREATED("未支付"),
        PAIED("已支付"),
        SEND("已发货"),
        CONFIRMED("确认收货"),
        REEOR("交易失败");

        private final String name;

        OrderState(String name) {
            this.name = name;
        }

        public String getOrderState() {
            return name;
        }

        @Override
        public String toString() {
            return this.name;
        }
    }

    public enum Expressage {
        YUANTONG("圆通"), SHENTONG("申通"), YUNDA("韵达"), ZHONGTONG("中通"), SHUNFENG("顺丰");
        private final String name;

        Expressage(String name) {
            this.name = name;
        }

        public String getExpressage() {
            return name;
        }

        public String toString() {
            return name;
        }

        ;
    }
}
