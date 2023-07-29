package com.sns.handbook.mapper;

import com.sns.handbook.dto.PlikealarmDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface PlikealarmMapperInter {

    public void insertPlikealarm(PlikealarmDto dto);

    public int getTotalCountPlikealarm(String receiver_num);

    public List<PlikealarmDto> getAllPlikealarm(String receiver_num);

    public int findSamePlikealarm(Map<String, String> map);

    public void deletePlikealarm(String plikeal_num);

    public PlikealarmDto getOnePlikealarm(Map<String, String> map);

    public void deleteAllPlikeAlarm(String receiver_num);
}
