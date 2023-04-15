package com.shop.controller;

import com.shop.model.Address;
import com.shop.model.Order;
import com.shop.model.OrderItem;
import com.shop.service.AddressService;
import com.shop.service.OrderItemService;
import com.shop.service.PayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("vip/pay")
public class PayController {

    private PayService payService;

    private OrderItemService orderItemService;

    private AddressService addressService;


    @Autowired
    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }

    @Autowired
    public void setPayService(PayService payService) {
        this.payService = payService;
    }

    @GetMapping("")
    public String pay(Map<String, Object> map, String orderId, HttpSession session) {
        if (orderId == null) {
            return "redirect:index";
        } else {
           String vipId =  (String) session.getAttribute("vipId");
            Order order = payService.findById(orderId);
            List<Address> address = addressService.findAllByVipId(vipId);
            map.put("address",address);
            map.put("order", order);
            return "vip/pay";
        }

    }


    @PostMapping(value = "/add", produces = "application/json;charset=utf-8")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> checkout(@RequestBody List<OrderItem> items, HttpSession session) {
        Map<String, Object> result = new HashMap<>();
        Order order = new Order();
        order.setOrderItemList(items);
        order.setVipId((String) session.getAttribute("vipId"));
        String orderId = payService.addOrder(order);
        result.put("orderId", orderId);
        result.put("success", "成功！！");
        return ResponseEntity.ok(result);


    }
}