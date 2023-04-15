package com.shop.DAO;

import com.shop.model.Commodity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface CommodityDAO {

    Commodity findById(Integer id);

    List<Commodity> findAll();

    List<Commodity> findByParentId(Integer parentId);

    List<Commodity> findByName(@Param("name") String name);

    List<Commodity> findByBean(@Param("childrenId") List<Integer> childrenId,@Param("commodityBean") Map<String,Object> commodityBean);
}
