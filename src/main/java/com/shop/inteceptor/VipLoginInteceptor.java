package com.shop.inteceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VipLoginInteceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object obj = request.getSession().getAttribute("@vip_id");
        if (obj == null) {
            response.sendRedirect(request.getContextPath() + "/vip/vipLogin");
            return false;
        }
        return true;
    }
}
