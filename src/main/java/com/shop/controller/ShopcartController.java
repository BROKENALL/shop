package com.shop.controller;


import com.shop.model.Cart;
import com.shop.model.Commodity;
import com.shop.service.CartService;
import com.shop.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("vip")
public class ShopcartController {
    CartService cartService;
    CommodityService commodityService;

    @Autowired
    public void setCommodityService(CommodityService commodityService) {
        this.commodityService = commodityService;
    }

    @Autowired
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }


    @RequestMapping("shopcart")
    public String shopcart(String root,
                           Integer commodityId,
                           Integer number,
                           HttpSession session,
                           Map<String, Object> map
    ) {
        if(root!=null){
            List<Cart> carts = cartService.findById((String) session.getAttribute("vipId"));
            for (Cart ct : carts) {
                if (ct.getCommodityId().equals(commodityId)) {
                    String error = "该商品已被加入购物车";
                    session.setAttribute("@carterror",error);
                    return "redirect:/vip/" + root + "?commodityId=" + commodityId;
                }
            }
            Commodity cd = commodityService.findById(commodityId);
            System.out.println(cd.getName());
            Cart cart = new Cart();
            cart.setCommodityId(commodityId);
            cart.setCommodityName(cd.getName());
            cart.setPrice(cd.getPrice());
            cart.setPhoto(cd.getPhoto());
            cart.setVipId((String) session.getAttribute("vipId"));
            cart.setNumber(number);

            Boolean success = cartService.add(cart);
            if (success) {
                session.setAttribute("@cartsuccess", "添加成功");
                return "redirect:/vip/" + root + "?commodityId=" + commodityId;
            }
        }else {
         List<Cart> carts = cartService.findById((String) session.getAttribute("vipId"));
         map.put("carts",carts);
        }
        return "/vip/shopcart";
    }
    @PostMapping(value = "shopcart/deleteItem",produces = "application/json;charset=utf-8")
    @ResponseBody
    public ResponseEntity<Map<String,Object>> delete(Integer id){
        boolean success = cartService.deleteById(id);
        return ResponseEntity.ok(Map.of("success",success));


    }
   @PostMapping(value = "shopcart/update",produces = "application/json;charset=utf-8")
    @ResponseBody
    public ResponseEntity<Map<String,Object>> update(Integer number,Integer id){
    boolean success = cartService.updateByNumber(number,id);
    return ResponseEntity.ok(Map.of("success",success));
    }

}
