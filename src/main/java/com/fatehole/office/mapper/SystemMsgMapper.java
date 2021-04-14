package com.fatehole.office.mapper;

import com.fatehole.office.model.SystemMsg;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SystemMsgMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SystemMsg record);

    int insertSelective(SystemMsg record);

    SystemMsg selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SystemMsg record);

    int updateByPrimaryKey(SystemMsg record);
}