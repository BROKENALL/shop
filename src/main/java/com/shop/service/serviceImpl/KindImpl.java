package com.shop.service.serviceImpl;


import com.shop.DAO.KindDAO;
import com.shop.model.Kind;
import com.shop.service.KindService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KindImpl implements KindService {
   public final KindDAO dao;
    public KindImpl(KindDAO dao) {
        this.dao = dao;
    }

    public List<Kind> findAll(){
        return dao.findAll();
    }


}
