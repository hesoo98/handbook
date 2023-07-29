package com.sns.handbook.mapper;

import com.sns.handbook.dto.GuestbooklikeDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface GuestbooklikeMapperInter {

    public int getTotalGuestLike(String guest_num);

    public void insertGuestLike(GuestbooklikeDto dto);

    public void deleteGuestLike(String guest_num, String user_num);

    public int checkGuestLike(Map<String, String> map);
}
