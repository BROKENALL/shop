package com.shop.DAO;

import com.shop.model.Category;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryDAO {
    Category findRootCategory();

    List<Integer> findChildrenId(Integer id);



}
