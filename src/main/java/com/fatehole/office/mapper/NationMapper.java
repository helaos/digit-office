package com.fatehole.office.mapper;

import com.fatehole.office.model.Nation;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Nation record);

    int insertSelective(Nation record);

    Nation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Nation record);

    int updateByPrimaryKey(Nation record);
}