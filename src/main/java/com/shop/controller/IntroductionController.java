package com.shop.controller;

import com.shop.config.MyConfig;
import com.shop.model.Commodity;
import com.shop.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("vip")
public class IntroductionController {
    private RedisTemplate<Object, Object> redisTemplate;

    @Autowired
    public void setRedisTemplate(RedisTemplate<Object, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }


    public final CommodityService dao;

    public IntroductionController(CommodityService dao) {
        this.dao = dao;
    }


    @GetMapping("introduction")
    public String introductionGet(Integer commodityId, Map<String, Object> map, HttpSession session) {
        String key = "001";
        Commodity cd = null;
        try {
            cd = (Commodity) redisTemplate.opsForValue().get(key);
            if (cd == null) {
                cd = dao.findById(commodityId);
                redisTemplate.opsForValue().set(key, cd);
            }
        } catch (Exception e) {
            System.out.println("未开启rdies");
        }
        if (cd == null) {
            cd = dao.findById(commodityId);
        }

        if (session.getAttribute("@cartsuccess") != null) {
            map.put("success", session.getAttribute("@cartsuccess"));
            session.removeAttribute("@cartsuccess");
        }
        if (session.getAttribute("@carterror") != null) {
            map.put("error", session.getAttribute("@carterror"));
            session.removeAttribute("@carterror");
        }
        map.put("cd", cd);
        return "/vip/introduction";
    }
}
