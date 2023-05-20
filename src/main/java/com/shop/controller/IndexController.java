package com.shop.controller;

import com.shop.model.Cart;
import com.shop.model.Category;
import com.shop.model.Commodity;
import com.shop.service.CartService;
import com.shop.service.CategoryService;
import com.shop.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("vip")
public class IndexController {
    public CommodityService cs;

    public CategoryService categoryService;

    public CartService cartService;


    @Autowired
    public void setCs(CommodityService cs) {
        this.cs = cs;
    }


    @Autowired
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @Autowired
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }


    //首页
    @GetMapping("index")
    public String index(Map<String, Object> map, HttpSession session){
        String vipName = (String) session.getAttribute("vipName");
        map.put("vipName", vipName);

        List<Category> cg = categoryService.findLevel1Categories();
        if (session.getAttribute("vipId") != null) {
            List<Cart> carts = cartService.findById((String) session.getAttribute("vipId"));

            Integer cartNum = carts.size();

            map.put("cartNum", cartNum);
        }
        map.put("cg", cg);

        List<Commodity> cd = cs.findAll();

        map.put("cd", cd);


        return "vip/index";

    }



    //收藏
    @GetMapping("collection")
    public String collection(Map<String, Object> map) {

        return "/vip/collection";
    }


}
