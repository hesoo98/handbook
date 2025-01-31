package com.sns.handbook.serivce;

import com.sns.handbook.dto.PlikealarmDto;

import java.util.List;

public interface PlikealarmServiceInter {

    public void insertPlikealarm(PlikealarmDto dto);

    public int getTotalCountPlikealarm(String receiver_num);

    public List<PlikealarmDto> getAllPlikealarm(String receiver_num);

    public int findSamePlikealarm(String receiver_num, String sender_num, String post_num, String guest_num);

    public void deletePlikealarm(String plikeal_num);

    public PlikealarmDto getOnePlikealarm(String receiver_num, String sender_num, String post_num, String guest_num);

    public void deleteAllPlikeAlarm(String receiver_num);
}
