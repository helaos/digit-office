package com.fatehole.office.mapper;

import com.fatehole.office.model.JobLevel;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JobLevelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(JobLevel record);

    int insertSelective(JobLevel record);

    JobLevel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(JobLevel record);

    int updateByPrimaryKey(JobLevel record);
}