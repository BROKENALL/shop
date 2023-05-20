package com.shop.service;

import com.shop.model.Order;
import com.shop.model.OrderItem;

import java.util.HashMap;
import java.util.List;

public interface PayService {
   String addOrder(Order order);

   Order findById(Integer orderId);

   List<Order> findAllByVipId(String vipId);

   Order success(Order order);

   void updataIsDefaultAddress(Integer id);
}
