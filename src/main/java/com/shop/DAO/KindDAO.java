package com.shop.DAO;

import com.shop.model.Kind;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface KindDAO {
    public List<Kind> findAll();
}
