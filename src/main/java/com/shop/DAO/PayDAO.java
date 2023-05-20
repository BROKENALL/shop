package com.shop.DAO;

import com.shop.model.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PayDAO{
    void addOrder(@Param("order") Order order);

    Order findById(Integer orderId);

    List<Order> findAllByVipId(String vipId);

    void updataById(Order order);

    Integer findId();

    Double findTotal();

    Integer findNum();


}
