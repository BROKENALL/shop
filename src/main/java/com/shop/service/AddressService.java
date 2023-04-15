package com.shop.service;

import com.shop.model.Address;

import java.util.List;

public interface AddressService {
    public List<Address> findAllByVipId(String vipId);

    public Boolean addAddress(Address address);
}
