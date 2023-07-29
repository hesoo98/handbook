package com.sns.handbook.mapper;

import com.sns.handbook.dto.CommentalarmDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentalarmMapperInter {
    public void insertCommentAlarm(CommentalarmDto dto);

    public List<CommentalarmDto> getAllCommentAlarm(String receiver_num);

    public int getTotalCountCommentAlarm(String receiver_num);

    public void deleteAllCommentAlarm(String receiver_num);
}
