package com.bishe.mapper;

import com.bishe.pojo.SeatOrder;
import com.bishe.pojo.SeatOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SeatOrderMapper {
    int countByExample(SeatOrderExample example);

    int deleteByExample(SeatOrderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SeatOrder record);

    int insertSelective(SeatOrder record);

    List<SeatOrder> selectByExample(SeatOrderExample example);

    SeatOrder selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SeatOrder record, @Param("example") SeatOrderExample example);

    int updateByExample(@Param("record") SeatOrder record, @Param("example") SeatOrderExample example);

    int updateByPrimaryKeySelective(SeatOrder record);

    int updateByPrimaryKey(SeatOrder record);
}