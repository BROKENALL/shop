package com.shop.service;

import com.shop.model.Category;

import java.util.List;

public interface CategoryService {

    //查询一级分类
    List<Category> findLevel1Categories();


    List<Integer> findChildrenId(Integer id);
}
