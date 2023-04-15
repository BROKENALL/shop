package com.shop.service.serviceImpl;

import com.shop.DAO.CommodityDAO;
import com.shop.model.Commodity;
import com.shop.service.CommodityService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CommodityImpl implements CommodityService {
    CommodityDAO dao;
    public CommodityImpl(CommodityDAO dao) {
        this.dao=dao;
    }

    @Override
    public Commodity findById(Integer id) {
        return dao.findById(id);
    }

    @Override
    public List<Commodity> findAll() {
        return dao.findAll();
    }

    @Override
    public List<Commodity> findByParentId(Integer parentId) {
        return dao.findByParentId(parentId);
    }


    public List<Commodity> findByName(String name) {
        return dao.findByName(name);
    }

    public List<Commodity> findByBean(List<Integer> childrenId,Map<String, Object> commodityBean) {
        return dao.findByBean(childrenId,commodityBean);
    }




}
