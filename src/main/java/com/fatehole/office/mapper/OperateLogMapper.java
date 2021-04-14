package com.fatehole.office.mapper;

import com.fatehole.office.model.OperateLog;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OperateLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OperateLog record);

    int insertSelective(OperateLog record);

    OperateLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OperateLog record);

    int updateByPrimaryKey(OperateLog record);
}