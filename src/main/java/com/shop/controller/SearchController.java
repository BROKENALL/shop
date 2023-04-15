package com.shop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shop.model.Category;
import com.shop.model.Commodity;
import com.shop.model.CommodityBean;
import com.shop.model.Kind;
import com.shop.service.CategoryService;
import com.shop.service.CommodityService;
import com.shop.service.KindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("vip")
public class SearchController{
    public final CategoryService categoryService;


    public final KindService kindService;

    public final CommodityService commodityService;

    @Autowired
    public SearchController(CategoryService categoryService, CommodityService commodityService, KindService kindService) {
        this.kindService = kindService;
        this.categoryService = categoryService;
        this.commodityService = commodityService;
    }


    @RequestMapping("search")
    public String search(HttpSession session,
                         Map<String, Object> map,
                         String name,
                         CommodityBean commodityBean,
                         @RequestParam(defaultValue = "1", required = false) Integer pageNo) {
        String vipName = (String) session.getAttribute("vipName");
        map.put("vipName", vipName);
        List<Commodity> cm;
        List<Integer> childrenId = new ArrayList<>();
        if (commodityBean.getCategory() != null && !commodityBean.getCategory().equals("")) {
            childrenId = categoryService.findChildrenId(Integer.valueOf(commodityBean.getCategory()));
        }


        PageHelper.startPage(pageNo, 12);
        if (commodityBean.getClear() != null && !commodityBean.getClear().equals("")) {
            if (commodityBean.getClear().equals("1")) {
                commodityBean.setKind(null);
            } else if (commodityBean.getClear().equals("2")) {
                commodityBean.setCategory(null);
            } else if (commodityBean.getClear().equals("3")) {
                commodityBean.setPrice(null);
            }
        }
        if ((commodityBean.newGetKind() != null && !commodityBean.newGetKind().equals("")) || (commodityBean.getCategory() != null && !commodityBean.getCategory().equals("")) || (commodityBean.getPrice() != null && !commodityBean.getPrice().equals(""))) {
            Map<String, Object> bean = new HashMap<>();

            if (commodityBean.newGetKind() != null && !commodityBean.newGetKind().equals("")) {
                bean.put("kind", commodityBean.newGetKind());
                map.put("kind", commodityBean.newGetKind());
            } else {
                bean.put("kind", null);
            }
            if (commodityBean.getCategory() != null && !commodityBean.getCategory().equals("")) {
                bean.put("category", Integer.valueOf(commodityBean.getCategory()));
                map.put("category", commodityBean.getCategory());
            } else {
                bean.put("category", null);
            }
            if (commodityBean.getPrice() != null && !commodityBean.getPrice().equals("")) {

                if (commodityBean.getPrice().equals("1")) {
                    bean.put("price1", 0);
                    bean.put("price2", 50);
                } else if (commodityBean.getPrice().equals("2")) {
                    bean.put("price1", 51);
                    bean.put("price2", 150);
                } else if (commodityBean.getPrice().equals("3")) {
                    bean.put("price1", 151);
                    bean.put("price2", 250);
                } else if (commodityBean.getPrice().equals("4")) {
                    bean.put("price1", 251);
                    bean.put("price2", 9999999);
                }
            } else {
                bean.put("price1", null);
                bean.put("price2", null);
            }
            cm = commodityService.findByBean(childrenId, bean);


        } else if (commodityBean.getParentId() != null) {
            cm = commodityService.findByParentId(commodityBean.getParentId());
        } else if (name != null) {
            cm = commodityService.findByName(name);
        } else {
            cm = commodityService.findAll();
        }


        PageInfo<Commodity> pi = new PageInfo<>(cm);


        pi.calcByNavigatePages(5);

        List<Kind> kd = kindService.findAll();
        List<Category> cg = categoryService.findLevel1Categories();
        if (cm.size() == 0) {
            map.put("commodityNULL", "目前没有该类商品，您可以查看其它商品");
        }

        map.put("commodityBean", commodityBean);

        map.put("pi", pi);

        map.put("cm", cm);

        map.put("kd", kd);

        map.put("cg", cg);

        return "/vip/search";
    }


}
