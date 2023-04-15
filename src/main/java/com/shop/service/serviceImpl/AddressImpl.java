package com.shop.service.serviceImpl;

import com.shop.DAO.AddressDAO;
import com.shop.model.Address;
import com.shop.service.AddressService;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AddressImpl implements AddressService {

    AddressDAO dao;

    public AddressImpl(AddressDAO dao) {
        this.dao = dao;
    }

    @Override
    public List<Address> findAllByVipId(String VipId) {
        return dao.findAllByVipId(VipId);
    }

    @Override
    public Boolean addAddress(Address address) {
        return dao.addAddress(address);
    }
}
