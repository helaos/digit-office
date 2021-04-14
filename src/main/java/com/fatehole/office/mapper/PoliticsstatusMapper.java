package com.fatehole.office.mapper;

import com.fatehole.office.model.PoliticsStatus;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PoliticsStatusMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PoliticsStatus record);

    int insertSelective(PoliticsStatus record);

    PoliticsStatus selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PoliticsStatus record);

    int updateByPrimaryKey(PoliticsStatus record);
}