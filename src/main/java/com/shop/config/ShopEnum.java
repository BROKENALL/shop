package com.shop.config;

import javax.servlet.http.HttpSession;

public class ShopEnum {
    public final static String ADMINBean = "admin";
    public final static String ADMIN = "admin";
    public final static String VIP_ID = "vipId";
    public final static String VIP = "vip";
    public final static String COMMODITY_RIDES_KEY = "commodityId";
    public final static String ORDER = "order";
    public final static String COMMODITY = "COMMODITY";
    public final static String NO_PAY = "待付款";
    public static String temp(HttpSession session) {
        String temp = null;
        if (session.getAttribute("@cartsuccess") != null) {
            temp = String.valueOf(session.getAttribute("@cartsuccess"));
            session.removeAttribute("@cartsuccess");
        }
        if (session.getAttribute("@carterror") != null) {
            temp = String.valueOf(session.getAttribute("@cartsuccess"));
            session.removeAttribute("@carterror");
        }
        return temp;
    }
}
