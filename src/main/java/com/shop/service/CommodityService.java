package com.shop.service;

import com.shop.model.Commodity;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CommodityService {

    Commodity findById(Integer id);
    List<Commodity> findAll();

    List<Commodity> findByParentId(Integer parentId);

    List<Commodity> findByName(String name);

    List<Commodity> findByBean(List<Integer> childrenId,Map<String,Object> commodityBean);

}
