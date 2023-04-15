package com.shop.DAO;


import com.shop.model.Cart;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CartDAO {
    List<Cart> findById(String vipId);

    Boolean add(@Param("cart") Cart cart);

    Boolean deleteById(Integer id);

    Boolean updateByNumber(@Param("number") Integer number,@Param("id") Integer id);
}
