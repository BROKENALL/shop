package com.shop.service;

import com.shop.model.Address;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface AddressService {
    public List<Address> findAllByVipId(String vipId);


    public void saveAddress(Address address);

    public void deleteAddress(Integer id);


}
