package com.shop.service.serviceImpl;

import com.shop.DAO.VipDAO;
import com.shop.model.Vip;
import com.shop.service.VipService;
import com.shop.utils.Md5Utils;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VipImpl implements VipService {
    private final VipDAO dao;

    public List<Vip> findAll(){
        return dao.findAll();
    }

    public VipImpl(VipDAO dao) {
        this.dao = dao;
    }

    @Override
    public Vip findVipById(String id) {
        return dao.findVipById(id);
    }

    public boolean loginPass(String id, String password) {
        Vip vip1 = dao.findVipById(id);
        String cv=password+id;
        boolean pass=Md5Utils.encrypt(cv).equals(vip1.getPassword()) ;

        return pass;

    }

    public boolean addVip(String id,String password){
        dao.addVip(id,Md5Utils.encrypt((password+id)));
        return true;
    }
}
