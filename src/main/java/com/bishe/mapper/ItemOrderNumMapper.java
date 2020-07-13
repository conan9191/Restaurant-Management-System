package com.bishe.mapper;

import com.bishe.pojo.ItemOrderNum;
import com.bishe.pojo.ItemOrderNumExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ItemOrderNumMapper {
    int countByExample(ItemOrderNumExample example);

    int deleteByExample(ItemOrderNumExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ItemOrderNum record);

    int insertSelective(ItemOrderNum record);

    List<ItemOrderNum> selectByExample(ItemOrderNumExample example);

    ItemOrderNum selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ItemOrderNum record, @Param("example") ItemOrderNumExample example);

    int updateByExample(@Param("record") ItemOrderNum record, @Param("example") ItemOrderNumExample example);

    int updateByPrimaryKeySelective(ItemOrderNum record);

    int updateByPrimaryKey(ItemOrderNum record);
}