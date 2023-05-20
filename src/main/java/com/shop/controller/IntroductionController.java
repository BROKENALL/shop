package com.shop.controller;

import com.shop.service.IntroductionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("vip")
public class IntroductionController {
    IntroductionService introductionService;

    public IntroductionController(IntroductionService introductionService) {
        this.introductionService = introductionService;
    }


    @GetMapping("introduction")
    public String findByCommodityId(Integer commodityId, Map<String, Object> map, HttpSession session) {
        Map<String, Object> newMap = introductionService.findByCommodityId(commodityId, session);
        map.put("cd",newMap.get("cd"));
        map.put("temp",newMap.get("temp"));
        return "/vip/introduction";
    }
}
