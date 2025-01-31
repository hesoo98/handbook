package com.sns.handbook.serivce;

import com.sns.handbook.dto.CommentalarmDto;

import java.util.List;

public interface CommentalarmServiceInter {
    public void insertCommentAlarm(CommentalarmDto dto);

    public List<CommentalarmDto> getAllCommentAlarm(String receiver_num);

    public int getTotalCountCommentAlarm(String receiver_num);

    public void deleteAllCommentAlarm(String receiver_num);
}
