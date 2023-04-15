package com.shop.service.serviceImpl;

import com.shop.DAO.OrderItemDAO;
import com.shop.model.OrderItem;
import com.shop.service.OrderItemService;

import java.util.List;

public class OrderItemImpl implements OrderItemService {
    OrderItemDAO orderItemDAO;

    public OrderItemImpl(OrderItemDAO orderItemDAO) {
        this.orderItemDAO = orderItemDAO;
    }

    @Override
    public boolean addOrderitem(OrderItem orderItem) {
        return orderItemDAO.addOrderItem(orderItem);
    }
}
