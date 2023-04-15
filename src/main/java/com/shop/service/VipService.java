package com.shop.service;

import com.shop.model.Vip;

import java.util.List;

public interface VipService {

    List<Vip> findAll();
    Vip findVipById(String id);

    boolean loginPass(String id,String password);

    boolean addVip(String id,String password);
}
