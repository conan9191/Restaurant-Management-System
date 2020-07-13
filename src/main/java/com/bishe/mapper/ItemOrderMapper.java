package com.bishe.mapper;

import com.bishe.pojo.ItemOrder;
import com.bishe.pojo.ItemOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ItemOrderMapper {
    int countByExample(ItemOrderExample example);

    int deleteByExample(ItemOrderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ItemOrder record);

    int insertSelective(ItemOrder record);

    List<ItemOrder> selectByExample(ItemOrderExample example);

    ItemOrder selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ItemOrder record, @Param("example") ItemOrderExample example);

    int updateByExample(@Param("record") ItemOrder record, @Param("example") ItemOrderExample example);

    int updateByPrimaryKeySelective(ItemOrder record);

    int updateByPrimaryKey(ItemOrder record);
}