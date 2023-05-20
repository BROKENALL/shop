package com.shop.service;

import com.shop.model.Commodity;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

public interface IntroductionService {
    /**
     * 通过商品id查询商品
     * @return
     */
    HashMap<String,Object> findByCommodityId(Integer commodityId, HttpSession session);
}
