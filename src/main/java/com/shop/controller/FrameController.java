package com.shop.controller;

import com.shop.config.BusinessException;
import com.shop.config.ShopEnum;
import com.shop.model.Address;
import com.shop.model.Order;
import com.shop.model.Vip;
import com.shop.service.AddressService;
import com.shop.service.PayService;
import com.shop.service.VipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("vip/frame")
public class FrameController {
    private PayService payService;
    private AddressService addressService;

    private VipService vipService;

    @Autowired
    public void setPayService(PayService payService, AddressService addressService, VipService vipService) {
        this.payService = payService;
        this.addressService = addressService;
        this.vipService = vipService;
    }


    @GetMapping("index")
    public String frameIndex(Map<String, Object> map, HttpSession session) {
        Vip vip = (Vip) session.getAttribute(ShopEnum.VIP);
        map.put(ShopEnum.ORDER, payService.findAllByVipId(vip.getId()));
        map.put(ShopEnum.VIP, vip);
        return "vip/frame/index";
    }

    @GetMapping("order")
    public String orderList(Map<String, Object> map, HttpSession session) {
        String vipId = (String) session.getAttribute("vipId");
        List<Order> orderList = payService.findAllByVipId(vipId);
        map.put("order", orderList);
        return "vip/frame/order";
    }

    @GetMapping("address")
    public String address(Map<String, Object> map, HttpSession session) {
        String vipId = (String) session.getAttribute("vipId");
        List<Address> addresses = addressService.findAllByVipId(vipId);
        map.put("address", addresses);
        return "vip/frame/address";
    }

    @PostMapping("saveAddress")
    public String saveAddress(Address address, Map<String, Object> map, HttpSession session) {
        String vipId = (String) session.getAttribute("vipId");
        address.setVipId(vipId);
        addressService.saveAddress(address);
        return address(map, session);
    }

    @GetMapping("deleteAddress")
    public String deleteAddress(Map<String, Object> map, HttpSession session, @RequestParam(required = false) Integer id) {
        addressService.deleteAddress(id);
        return address(map, session);
    }

    @GetMapping("information")
    public String information(Map<String, Object> map, HttpSession session) {
        Vip vip = (Vip) session.getAttribute(ShopEnum.VIP);
        map.put(ShopEnum.VIP, vip);
        return "vip/frame/information";
    }

    @PostMapping("information/updataPhoto")
    public String updataPhoto(HttpSession session, MultipartFile file) {
        String vipId = (String) session.getAttribute(ShopEnum.VIP_ID);
        vipService.updataPhoto(file,vipId,session);
        return "redirect:http://localhost:8080/vip/frame/information";
    }

    @PostMapping("information/vipUpdata")
    public String updataVip(Vip vip,HttpSession session){
        vipService.updataVip(vip,session);
        return "redirect:http://localhost:8080/vip/frame/information";
    }
}
