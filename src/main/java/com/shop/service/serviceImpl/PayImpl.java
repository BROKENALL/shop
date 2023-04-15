package com.shop.service.serviceImpl;

import com.shop.DAO.CommodityDAO;
import com.shop.DAO.OrderItemDAO;
import com.shop.DAO.PayDAO;
import com.shop.model.Commodity;
import com.shop.model.Order;
import com.shop.model.OrderItem;
import com.shop.service.OrderItemService;
import com.shop.service.PayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.OptionalDouble;

@Service
public class PayImpl implements PayService {

    private final PayDAO payDAO;

    public PayImpl(PayDAO payDAO) {
        this.payDAO = payDAO;
    }

    public OrderItemDAO orderItemDAO;
    public CommodityDAO commodityDAO;


    @Autowired
    public void setOrderItemDAO(OrderItemDAO orderItemDAO) {
        this.orderItemDAO = orderItemDAO;
    }

    @Autowired
    public void setCommodityDAO(CommodityDAO commodityDAO) {
        this.commodityDAO = commodityDAO;
    }

    @Override
    public String addOrder(Order order) {
        List<OrderItem> orderItems = order.getOrderItemList();
        LocalDateTime now = LocalDateTime.now();
        String code = now.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS"));
        double totle = 0;
        for (OrderItem od : orderItems) {
           od.setOrderId(code);
            Integer cdId = od.getCommodityId();
            Commodity commodity = commodityDAO.findById(cdId);
            od.setCommodityName(commodity.getName());
            od.setPrice(commodity.getPrice());
            od.setCommodityPhoto(commodity.getPhoto());
            totle += od.getNumber() * od.getPrice();
            orderItemDAO.addOrderItem(od);
        }

        order.setOrderCode(code);
        order.setTotal(totle);
        order.setOrderTime(now);
        payDAO.addOrder(order);
        return code;
    }

    @Override
    public Order findById(String orderId) {
        return payDAO.findById(orderId);
    }

    @Override
    public List<Order> findAllByVipId(String vipId) {
        return payDAO.findAllByVipId(vipId);
    }
}
