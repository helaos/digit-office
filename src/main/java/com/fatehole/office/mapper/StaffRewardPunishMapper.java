package com.fatehole.office.mapper;

import com.fatehole.office.model.StaffRewardPunish;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StaffRewardPunishMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(StaffRewardPunish record);

    int insertSelective(StaffRewardPunish record);

    StaffRewardPunish selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StaffRewardPunish record);

    int updateByPrimaryKey(StaffRewardPunish record);
}