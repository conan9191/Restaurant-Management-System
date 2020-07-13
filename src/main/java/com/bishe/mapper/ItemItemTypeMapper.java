package com.bishe.mapper;

import com.bishe.pojo.ItemItemType;
import com.bishe.pojo.ItemItemTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ItemItemTypeMapper {
    int countByExample(ItemItemTypeExample example);

    int deleteByExample(ItemItemTypeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ItemItemType record);

    int insertSelective(ItemItemType record);

    List<ItemItemType> selectByExample(ItemItemTypeExample example);

    ItemItemType selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ItemItemType record, @Param("example") ItemItemTypeExample example);

    int updateByExample(@Param("record") ItemItemType record, @Param("example") ItemItemTypeExample example);

    int updateByPrimaryKeySelective(ItemItemType record);

    int updateByPrimaryKey(ItemItemType record);
}