
package com.shop.DAO;

import com.shop.model.Order;
import com.shop.model.OrderItem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OrderItemDAO {

    boolean addOrderItem(@Param("orderItem") OrderItem orderItemList);
    List<OrderItem> findOrderItem(Integer orderId);


}

