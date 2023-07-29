package com.sns.handbook.mapper;

import com.sns.handbook.dto.PostalarmDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostalarmMapperInter {
    public void insertPostAlarm(PostalarmDto dto);

    public List<PostalarmDto> getAllPostAlarm(String receiver_num);

    public int getTotalCountPostAlarm(String receiver_num);

    public void deleteallPostAlarm(String receiver_num);
}
