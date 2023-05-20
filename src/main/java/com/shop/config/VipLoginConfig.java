package com.shop.config;

import com.shop.inteceptor.VipLoginInteceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.HandlerAdapter;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.ArrayList;
import java.util.List;

@Configuration
@EnableTransactionManagement
public class VipLoginConfig implements WebMvcConfigurer {
    HandlerInterceptor interceptor=new VipLoginInteceptor();
    public void addInterceptors(InterceptorRegistry registry){
        List<String> patterns = new ArrayList<>();
        patterns.add("controller/vip/buy");
        patterns.add("controller/vip/love");
        patterns.add("/vip/shopcart");
        patterns.add("controller/vip/setting");
        patterns.add("/vip/frame/*");
        patterns.add("/vip/pay/*");
        registry.addInterceptor(interceptor).addPathPatterns(patterns);
    }
}
