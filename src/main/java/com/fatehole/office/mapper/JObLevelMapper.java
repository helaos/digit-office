package com.fatehole.office.mapper;

import com.fatehole.office.model.JObLevel;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JObLevelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(JObLevel record);

    int insertSelective(JObLevel record);

    JObLevel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(JObLevel record);

    int updateByPrimaryKey(JObLevel record);
}