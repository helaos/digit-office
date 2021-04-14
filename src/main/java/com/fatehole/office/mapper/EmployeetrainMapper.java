package com.fatehole.office.mapper;

import com.fatehole.office.model.Employeetrain;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeetrainMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Employeetrain record);

    int insertSelective(Employeetrain record);

    Employeetrain selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Employeetrain record);

    int updateByPrimaryKey(Employeetrain record);
}