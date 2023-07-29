package com.sns.handbook.serivce;

import com.sns.handbook.dto.PostalarmDto;

import java.util.List;

public interface PostalarmServiceInter {
    public void insertPostAlarm(PostalarmDto dto);

    public List<PostalarmDto> getAllPostAlarm(String receiver_num);

    public int getTotalCountPostAlarm(String receiver_num);

    public void deleteallPostAlarm(String receiver_num);
}
