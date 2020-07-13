package com.bishe.mapper;

import com.bishe.pojo.SeatType;
import com.bishe.pojo.SeatTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SeatTypeMapper {
    int countByExample(SeatTypeExample example);

    int deleteByExample(SeatTypeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SeatType record);

    int insertSelective(SeatType record);

    List<SeatType> selectByExample(SeatTypeExample example);

    SeatType selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SeatType record, @Param("example") SeatTypeExample example);

    int updateByExample(@Param("record") SeatType record, @Param("example") SeatTypeExample example);

    int updateByPrimaryKeySelective(SeatType record);

    int updateByPrimaryKey(SeatType record);
}