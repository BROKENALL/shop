package com.shop.service;

import com.shop.model.Admin;
import com.shop.model.AdminBean;

public interface AdminService {
    Admin login(Admin admin);

    AdminBean findAll();
}
