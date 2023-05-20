package com.shop.DAO;

import com.shop.model.Admin;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDAO {
    Admin findByUid(String uid);
}
