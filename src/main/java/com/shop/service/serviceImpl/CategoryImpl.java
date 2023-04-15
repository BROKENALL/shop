package com.shop.service.serviceImpl;

import com.shop.DAO.CategoryDAO;
import com.shop.model.Category;
import com.shop.service.CategoryService;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CategoryImpl implements CategoryService {
    CategoryDAO dao;

    public CategoryImpl(CategoryDAO dao) {
        this.dao = dao;
    }

    @Override
    public List<Category> findLevel1Categories() {
        Category gc=dao.findRootCategory();
        List<Category> li=gc.getChildren();
        return li;
    }

    @Override
    public List<Integer> findChildrenId(Integer id) {
        return dao.findChildrenId(id);
    }
}
