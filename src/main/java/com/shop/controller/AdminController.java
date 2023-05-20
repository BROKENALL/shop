package com.shop.controller;

import com.shop.config.ShopEnum;
import com.shop.model.Admin;
import com.shop.service.AdminService;
import com.shop.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    public AdminService adminService;

    @GetMapping("")
    public String login() {
        return "admin/login";
    }

    @PostMapping("login")
    public String login(Admin admin, HttpSession session) {
        Admin newAdmin = adminService.login(admin);
        session.setAttribute(ShopEnum.ADMIN, newAdmin);
        return "redirect:index";
    }

    @GetMapping("home")
    public String home(Map<String, Object> map) {
        map.put(ShopEnum.ADMINBean,adminService.findAll());
        return "admin/home";
    }
    @GetMapping("index")
    public String index(Map<String, Object> map) {
        return "admin/index";
    }


}
