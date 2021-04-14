package com.fatehole.office.mapper;

import com.fatehole.office.model.HrRole;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HrRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(HrRole record);

    int insertSelective(HrRole record);

    HrRole selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HrRole record);

    int updateByPrimaryKey(HrRole record);
}