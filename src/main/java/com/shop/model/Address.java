package com.shop.model;


import lombok.Data;

@Data
public class Address {

    private Integer id;


    private String vipId;
    private String name;
    private String phone;


    private String provinceName;

    private String cityName;

    private String areaName;

    private String streetName;

    private Boolean isDefault;//是否默认



    public String getFullName() {
        return this.provinceName + " " + this.cityName + " " + this.areaName + " " + this.streetName;
    }
}


