package com.shop.service.serviceImpl;

import com.shop.DAO.CartDAO;
import com.shop.model.Cart;
import com.shop.service.CartService;
import org.checkerframework.checker.units.qual.C;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartImpl implements CartService {

    CartDAO dao;

    public CartImpl(CartDAO dao) {
        this.dao = dao;
    }

    @Override
    public List<Cart> findById(String vipId) {


        return dao.findById(vipId);
    }

    @Override
    public Boolean add(Cart cart) {
        return dao.add(cart);
    }

    @Override
    public Boolean deleteById(Integer id) {
        return dao.deleteById(id);
    }

    @Override
    public Boolean updateByNumber(Integer number,Integer id) {
        return dao.updateByNumber(number,id);
    }
}
