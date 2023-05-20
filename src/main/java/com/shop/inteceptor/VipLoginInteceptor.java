package com.shop.inteceptor;

import com.shop.config.ShopEnum;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VipLoginInteceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object obj = request.getSession().getAttribute("@vip_id");
        Object vip = request.getSession().getAttribute(ShopEnum.VIP);
        if (obj == null || vip == null) {
            response.sendRedirect(request.getContextPath() + "/vip/vipLogin");
            return false;
        }
        return true;
    }
}
