package com.sns.handbook.serivce;

import com.sns.handbook.dto.FollowalarmDto;

import java.util.List;

public interface FollowalarmServiceInter {

    public void insertFollowalarm(FollowalarmDto dto);

    public List<FollowalarmDto> getAllFollowalarm(String reciever_num);

    public int getAllCountFollowalarm(String receiver_num);

    public int findSameFollowalarm(String receiver_num, String sender_num);

    public FollowalarmDto getFollowalarmByNum(String receiver_num, String sender_num);

    public void deleteFollowalarm(String followal_num);

    public void deleteAllFollowalarm(String receiver_num);
}
