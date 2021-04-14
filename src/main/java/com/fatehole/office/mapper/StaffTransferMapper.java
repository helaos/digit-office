package com.fatehole.office.mapper;

import com.fatehole.office.model.StaffTransfer;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StaffTransferMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(StaffTransfer record);

    int insertSelective(StaffTransfer record);

    StaffTransfer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StaffTransfer record);

    int updateByPrimaryKey(StaffTransfer record);
}