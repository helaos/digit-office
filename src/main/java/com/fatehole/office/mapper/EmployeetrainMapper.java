package com.fatehole.office.mapper;

import com.fatehole.office.model.EmployeeTrain;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeTrainMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EmployeeTrain record);

    int insertSelective(EmployeeTrain record);

    EmployeeTrain selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EmployeeTrain record);

    int updateByPrimaryKey(EmployeeTrain record);
}