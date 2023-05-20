package com.shop.model;

import lombok.Data;

import java.util.List;

@Data
public class AdminBean {
    List<Commodity> commodities;
    Integer vipNum;
    Integer orderNum;
    double total;
}
