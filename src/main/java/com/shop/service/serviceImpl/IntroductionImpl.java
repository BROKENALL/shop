package com.shop.service.serviceImpl;

import com.shop.DAO.CommodityDAO;
import com.shop.config.BusinessException;
import com.shop.config.ShopEnum;
import com.shop.model.Commodity;
import com.shop.service.IntroductionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.rmi.server.LogStream.log;

@Service
@Slf4j
public class IntroductionImpl implements IntroductionService {

    @Autowired
    private RedisTemplate<Object, Object> redisTemplate;
    @Autowired
    private CommodityDAO commodityDAO;


    @Override
    public HashMap<String, Object> findByCommodityId(Integer commodityId, HttpSession session) {
        HashMap<String, Object> map = new HashMap<>();
        String key = String.valueOf(commodityId);
        Commodity cd = null;
        try {
            cd = (Commodity) redisTemplate.opsForValue().get(key);
            if (cd == null) {
                cd = commodityDAO.findById(commodityId);
                redisTemplate.opsForValue().set(key, cd);
            }
        } catch (Exception e) {
            throw new BusinessException("未开启redis");

        }
        map.put("cd",cd);
        map.put("temp",ShopEnum.temp(session));

        return map;
    }
}
