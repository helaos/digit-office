package com.fatehole.office.mapper;

import com.fatehole.office.model.AdjustSalary;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdjustSalaryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AdjustSalary record);

    int insertSelective(AdjustSalary record);

    AdjustSalary selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AdjustSalary record);

    int updateByPrimaryKey(AdjustSalary record);
}