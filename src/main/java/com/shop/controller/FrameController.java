package com.shop.controller;

import com.shop.model.Order;
import com.shop.service.PayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("vip/frame")
public class FrameController {
    private PayService payService;

    @Autowired
    public void setPayService(PayService payService) {
        this.payService = payService;
    }


    @GetMapping("index")
    public String frameIndex(){
        return "vip/frame/frame";
    }

    @GetMapping("order")
    public String orderList(Map<String,Object> map, HttpSession session) {
            String vipId=(String) session.getAttribute("vipId");
            List<Order> orderList=payService.findAllByVipId(vipId);
            map.put("order",orderList);
        return "vip/frame/order";
    }

}
