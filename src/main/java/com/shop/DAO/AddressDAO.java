package com.shop.DAO;

import com.shop.model.Address;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

@Mapper
public interface AddressDAO {

    public Address findAddressById(Integer id);

    public List<Address> findAllByVipId(String vipId);

    public void addAddress(Address address);

    void updataIsDefaultAddress(Integer id);

    void updataAll(Integer id);

    void deleteById(Integer id);

    Integer minId();



}
