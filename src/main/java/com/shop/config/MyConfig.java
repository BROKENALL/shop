package com.shop.config;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

@Configuration

public class MyConfig {

    @Bean
    public RedisTemplate<Object, Object> redisTemplate(RedisConnectionFactory factory, ObjectMapper mapper) {
        RedisTemplate<Object, Object> template = new RedisTemplate<>();
        //设置连接工厂
        template.setConnectionFactory(factory);

        //克隆一个新的ObjectMapper实例
        ObjectMapper om = mapper.copy();
        //添加对jdk8日期类型的支持，需要在pom文件中引入jackson-datatype-jsr310
        om.registerModule(new JavaTimeModule());
        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        //必须进行以下配置，否则会出现java.lang.ClassCastException: java.util.LinkedHashMap cannot be cast to xxx的异常
        //详见：https://knife.blog.csdn.net/article/details/122427607
        om.activateDefaultTyping(om.getPolymorphicTypeValidator(), ObjectMapper.DefaultTyping.NON_FINAL, JsonTypeInfo.As.PROPERTY);


        //这个序列化器比较简单，就是直接强转成字符串，如果源类型是对象，则无法进行转换，会异常
        StringRedisSerializer keySerializer = new StringRedisSerializer();
        //使用Jackson2JsonRedisSerializer来序列化和反序列化redis的value值（默认使用JDK的序列化方式：JdkSerializationRedisSerializer）
        Jackson2JsonRedisSerializer<Object> valueSerializer = new Jackson2JsonRedisSerializer<>(Object.class);
        valueSerializer.setObjectMapper(om);

        //指定key的序列化器为StringRedisSerializer，也就意味着Redis存储值的时候，key必须为字符串类型
        template.setKeySerializer(keySerializer);
        //值的序列化器为Jackson2JsonRedisSerializer，也就是可以将一个对象序列化成json字符串，这意味着值可以是任意类型
        template.setValueSerializer(valueSerializer);
        template.setHashKeySerializer(keySerializer);
        template.setHashValueSerializer(valueSerializer);
        template.afterPropertiesSet();

        return template;
    }

}
