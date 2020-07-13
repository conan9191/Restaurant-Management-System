package com.bishe.mapper;

import com.bishe.pojo.SeatSchedule;
import com.bishe.pojo.SeatScheduleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SeatScheduleMapper {
    int countByExample(SeatScheduleExample example);

    int deleteByExample(SeatScheduleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SeatSchedule record);

    int insertSelective(SeatSchedule record);

    List<SeatSchedule> selectByExample(SeatScheduleExample example);

    SeatSchedule selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SeatSchedule record, @Param("example") SeatScheduleExample example);

    int updateByExample(@Param("record") SeatSchedule record, @Param("example") SeatScheduleExample example);

    int updateByPrimaryKeySelective(SeatSchedule record);

    int updateByPrimaryKey(SeatSchedule record);
}