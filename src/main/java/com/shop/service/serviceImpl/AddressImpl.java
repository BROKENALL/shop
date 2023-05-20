package com.shop.service.serviceImpl;

import com.shop.DAO.AddressDAO;
import com.shop.DAO.VipDAO;
import com.shop.model.Address;
import com.shop.model.Vip;
import com.shop.service.AddressService;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
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
    public void saveAddress(Address address) {
        address.setIsDefault(false);
        dao.addAddress(address);
    }

    @Override
    public void deleteAddress(Integer id) {
        Address address = dao.findAddressById(id);
        dao.deleteById(id);
        if (address.getIsDefault()) {
            Integer newId = dao.minId();
            if ((newId != null)){
                dao.updataIsDefaultAddress(newId);
            }

        }
    }
}
