package com.bishe.mapper;

import com.bishe.pojo.SeatSeatOrder;
import com.bishe.pojo.SeatSeatOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SeatSeatOrderMapper {
    int countByExample(SeatSeatOrderExample example);

    int deleteByExample(SeatSeatOrderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SeatSeatOrder record);

    int insertSelective(SeatSeatOrder record);

    List<SeatSeatOrder> selectByExample(SeatSeatOrderExample example);

    SeatSeatOrder selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SeatSeatOrder record, @Param("example") SeatSeatOrderExample example);

    int updateByExample(@Param("record") SeatSeatOrder record, @Param("example") SeatSeatOrderExample example);

    int updateByPrimaryKeySelective(SeatSeatOrder record);

    int updateByPrimaryKey(SeatSeatOrder record);
}