package com.fatehole.office.mapper;

import com.fatehole.office.model.Appraise;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AppraiseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Appraise record);

    int insertSelective(Appraise record);

    Appraise selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Appraise record);

    int updateByPrimaryKey(Appraise record);
}