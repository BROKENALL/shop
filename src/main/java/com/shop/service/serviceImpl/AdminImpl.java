package com.shop.service.serviceImpl;

import com.shop.DAO.AdminDAO;
import com.shop.DAO.CommodityDAO;
import com.shop.DAO.PayDAO;
import com.shop.DAO.VipDAO;
import com.shop.config.BusinessException;
import com.shop.model.Admin;
import com.shop.model.AdminBean;
import com.shop.service.AdminService;
import com.shop.utils.Md5Utils;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminImpl implements AdminService {
    @Autowired
    public AdminDAO adminDAO;
    @Autowired
    public CommodityDAO commodityDAO;

    @Autowired
    public  VipDAO vipDAO;

    @Autowired
    public PayDAO orderDAO;

    @Override
    public Admin login(Admin testAdmin) {
        String uid = testAdmin.getUid();
        Admin admin=adminDAO.findByUid(uid);
        boolean pass = Md5Utils.encrypt(testAdmin.getPassword()).equals(admin.getPassword());
        if (!pass){
            throw new BusinessException("账号或密码不对");
        }else {
            return admin;
        }
    }

    @Override
    public AdminBean findAll() {
        AdminBean adminBean = new AdminBean();
        adminBean.setCommodities(commodityDAO.findAll());
        adminBean.setTotal(orderDAO.findTotal());
        adminBean.setOrderNum(orderDAO.findNum());
        adminBean.setVipNum(vipDAO.findNum());
        return adminBean;
    }
}
