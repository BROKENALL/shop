package com.shop.controller;

import com.shop.model.Vip;
import com.shop.service.VipService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/vip")
public class VipLoginController {
    private VipService sev;

    public VipLoginController(VipService sev) {
        this.sev = sev;
    }

    @GetMapping("/vipLogin")
    public String loginGet(Vip vip) {
        return "vip/login";
    }


    //登录
    @PostMapping("/vipLogin")
    public String loginPost(Vip vip, Map<String, Object> map,
                        HttpServletRequest req,
                        HttpServletResponse resp) {
        Vip dbvip = sev.findVipById(vip.getId());
        if (dbvip == null) {
            map.put("error", "账户不存在");
            return "vip/login";
        } else {
            req.getSession().setAttribute("vip",dbvip);
            req.getSession().setAttribute("vipName", dbvip.getName());
            loginPass(vip.getId(), vip.getPassword());
            map.put("vipId", vip.getId());
            if (loginSuccess != null) {
                req.getSession().setAttribute("vipId",vip.getId());
                req.getSession().setAttribute("@vip_id", "logined");
                loginSuccess = null;
                return "redirect:index";
            } else {
                map.put("error", loginError);
                loginError = null;
                return "vip/login";
            }
        }
    }



    //注册页面
    @GetMapping("/register")
            public String registerGet(){
        return "vip/register";
    }

    @PostMapping("/register")
            public String registerPost(Vip vip,Map<String,Object>map){

        List<Vip> vips=sev.findAll();
        for (Vip v:vips){
            if (v.getId().equals(vip.getId())){
                map.put("error","用户已存在");
                return "vip/register";
            }
        }

            sev.addVip(vip.getId(),vip.getPassword());
        map.put("success","注册成功");
        return "vip/register";

    }


    String loginSuccess;
    String loginError;

    //登录判断
    public void loginPass(String id, String password) {
        boolean pass = sev.loginPass(id, password);

        if (pass) {
            loginSuccess = "@vip_id";
        } else {
            loginError = "用户名或密码错误";
        }
    }


}
