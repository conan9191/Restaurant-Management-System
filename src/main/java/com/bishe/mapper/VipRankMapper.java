package com.bishe.mapper;

import com.bishe.pojo.VipRank;
import com.bishe.pojo.VipRankExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface VipRankMapper {
    int countByExample(VipRankExample example);

    int deleteByExample(VipRankExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(VipRank record);

    int insertSelective(VipRank record);

    List<VipRank> selectByExample(VipRankExample example);

    VipRank selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") VipRank record, @Param("example") VipRankExample example);

    int updateByExample(@Param("record") VipRank record, @Param("example") VipRankExample example);

    int updateByPrimaryKeySelective(VipRank record);

    int updateByPrimaryKey(VipRank record);
}