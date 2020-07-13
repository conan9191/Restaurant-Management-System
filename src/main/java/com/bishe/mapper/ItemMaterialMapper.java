package com.bishe.mapper;

import com.bishe.pojo.ItemMaterial;
import com.bishe.pojo.ItemMaterialExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ItemMaterialMapper {
    int countByExample(ItemMaterialExample example);

    int deleteByExample(ItemMaterialExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ItemMaterial record);

    int insertSelective(ItemMaterial record);

    List<ItemMaterial> selectByExample(ItemMaterialExample example);

    ItemMaterial selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ItemMaterial record, @Param("example") ItemMaterialExample example);

    int updateByExample(@Param("record") ItemMaterial record, @Param("example") ItemMaterialExample example);

    int updateByPrimaryKeySelective(ItemMaterial record);

    int updateByPrimaryKey(ItemMaterial record);
}