package com.shop.DAO;

import com.shop.model.Vip;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface VipDAO {
    List<Vip> findAll();
    Vip findVipById(String id);

    boolean addVip(@Param("id") String id,@Param("password") String password);

    void updataPhoto(Vip vip);

    void updataVip(Vip vip);

    Integer findNum();
}
