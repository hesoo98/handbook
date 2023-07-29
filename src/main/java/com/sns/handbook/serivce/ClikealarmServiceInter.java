package com.sns.handbook.serivce;

import com.sns.handbook.dto.ClikealarmDto;

import java.util.List;

public interface ClikealarmServiceInter {

    public void insertClikealarm(ClikealarmDto dto);

    public int getTotalCountClikealarm(String receiver_num);

    public List<ClikealarmDto> getAllClikealarm(String receiver_num);

    public int findSameClikealarm(String receiver_num, String sender_num, String comment_num);

    public void deleteClikealarm(String clikeal_num);

    public ClikealarmDto getOneClikealarm(String receiver_num, String sender_num, String comment_num);

    public void deleteAllClikealarm(String receiver_num);
}
