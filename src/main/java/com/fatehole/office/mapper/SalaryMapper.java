package com.fatehole.office.mapper;

import com.fatehole.office.model.Salary;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SalaryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Salary record);

    int insertSelective(Salary record);

    Salary selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Salary record);

    int updateByPrimaryKey(Salary record);
}