package com.shop.service.serviceImpl;

import com.shop.DAO.AddressDAO;
import com.shop.config.ShopEnum;
import org.apache.commons.lang3.StringUtils;
import com.shop.DAO.CommodityDAO;
import com.shop.DAO.OrderItemDAO;
import com.shop.DAO.PayDAO;
import com.shop.model.Address;
import com.shop.model.Commodity;
import com.shop.model.Order;
import com.shop.model.OrderItem;
import com.shop.service.PayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class PayImpl implements PayService {

    private final PayDAO payDAO;

    public PayImpl(PayDAO payDAO) {
        this.payDAO = payDAO;
    }

    public OrderItemDAO orderItemDAO;
    public CommodityDAO commodityDAO;


    @Autowired
    public void setOrderItemDAO(OrderItemDAO orderItemDAO) {
        this.orderItemDAO = orderItemDAO;
    }

    @Autowired
    public void setCommodityDAO(CommodityDAO commodityDAO) {
        this.commodityDAO = commodityDAO;
    }

    @Autowired
    public AddressDAO addressDAO;

    @Override
    public String addOrder(Order order) {
        List<OrderItem> orderItems = order.getOrderItemList();
        LocalDateTime now = LocalDateTime.now();
        String code = now.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS"));
        double totle = 0;
        order.setOrderCode(code);
        order.setOrderTime(now);
        order.setOrderState(ShopEnum.NO_PAY);
        Integer id = payDAO.findId();
        if (id == null) {
            id = 1;
        } else {
            id++;
        }

        for (OrderItem od : orderItems) {
            od.setOrderId(id);
            Integer cdId = od.getCommodityId();
            Commodity commodity = commodityDAO.findById(cdId);
            od.setCommodityName(commodity.getName());
            od.setPrice(commodity.getPrice());
            od.setCommodityPhoto(commodity.getPhoto());
            totle += od.getNumber() * od.getPrice();
            orderItemDAO.addOrderItem(od);
        }
        order.setTotal(totle);
        payDAO.addOrder(order);

        return String.valueOf(id);
    }

    @Override
    public Order findById(Integer orderId) {
        return payDAO.findById(orderId);
    }

    @Override
    public List<Order> findAllByVipId(String vipId) {
        return payDAO.findAllByVipId(vipId);
    }

    /**
     * 查询订单
     *
     * @param order
     * @return
     */
    @Override
    public Order success(Order order) {
        String expressage = order.getExpressage();
        if (!expressage.equals("")){
            expressage = expressage.substring(0,2);
        }else {
            expressage="暂无留言";
        }
        order.setExpressage(expressage);
        payDAO.updataById(order);
        return payDAO.findById(order.getId());
    }

    /**
     * 更改默认地址
     *
     * @param id
     */
    @Override
    @Transactional(rollbackOn = Error.class)
    public void updataIsDefaultAddress(Integer id) {
        addressDAO.updataIsDefaultAddress(id);
        addressDAO.updataAll(id);
    }
}
