package com.shop.service;

import com.shop.model.Order;
import com.shop.model.OrderItem;

import java.util.List;

public interface PayService {
   String addOrder(Order order);

   Order findById(String orderId);

   List<Order> findAllByVipId(String vipId);
}
