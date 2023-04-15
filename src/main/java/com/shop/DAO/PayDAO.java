package com.shop.DAO;

import com.shop.model.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PayDAO{
    Boolean addOrder(@Param("order") Order order);

    Order findById(String orderId);

    List<Order> findAllByVipId(String vipId);
}
