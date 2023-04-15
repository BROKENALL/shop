package com.shop.service;

import com.shop.model.Cart;
import com.shop.model.Commodity;

import java.util.List;

public interface CartService {
    List<Cart> findById(String vipId);

    Boolean add(Cart cart);

    Boolean deleteById(Integer id);

    Boolean updateByNumber(Integer number,Integer id);
}
