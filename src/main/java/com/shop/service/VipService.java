package com.shop.service;

import com.shop.model.Vip;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface VipService {

    List<Vip> findAll();
    Vip findVipById(String id);

    boolean loginPass(String id,String password);

    boolean addVip(String id,String password);

    void updataPhoto(MultipartFile file, String vipId, HttpSession session);

    void updataVip(Vip vip,HttpSession session);
}
