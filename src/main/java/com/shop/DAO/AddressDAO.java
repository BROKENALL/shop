package com.shop.DAO;

import com.shop.model.Address;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AddressDAO {

    public Address findAddressById(Integer id);

    public List<Address> findAllByVipId(String vipId);

    public Boolean addAddress(Address address);

}
