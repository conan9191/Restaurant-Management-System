package com.bishe.mapper;

import com.bishe.pojo.ItemItemMaterial;
import com.bishe.pojo.ItemItemMaterialExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ItemItemMaterialMapper {
    int countByExample(ItemItemMaterialExample example);

    int deleteByExample(ItemItemMaterialExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ItemItemMaterial record);

    int insertSelective(ItemItemMaterial record);

    List<ItemItemMaterial> selectByExample(ItemItemMaterialExample example);

    ItemItemMaterial selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ItemItemMaterial record, @Param("example") ItemItemMaterialExample example);

    int updateByExample(@Param("record") ItemItemMaterial record, @Param("example") ItemItemMaterialExample example);

    int updateByPrimaryKeySelective(ItemItemMaterial record);

    int updateByPrimaryKey(ItemItemMaterial record);
}