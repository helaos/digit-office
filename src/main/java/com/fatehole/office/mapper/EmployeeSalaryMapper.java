package com.fatehole.office.mapper;

import com.fatehole.office.model.EmployeeSalary;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeSalaryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EmployeeSalary record);

    int insertSelective(EmployeeSalary record);

    EmployeeSalary selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EmployeeSalary record);

    int updateByPrimaryKey(EmployeeSalary record);
}