package com.bishe.mapper;

import com.bishe.pojo.ItemType;
import com.bishe.pojo.ItemTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ItemTypeMapper {
    int countByExample(ItemTypeExample example);

    int deleteByExample(ItemTypeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ItemType record);

    int insertSelective(ItemType record);

    List<ItemType> selectByExample(ItemTypeExample example);

    ItemType selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ItemType record, @Param("example") ItemTypeExample example);

    int updateByExample(@Param("record") ItemType record, @Param("example") ItemTypeExample example);

    int updateByPrimaryKeySelective(ItemType record);

    int updateByPrimaryKey(ItemType record);
}