package com.sns.handbook.serivce;

import com.sns.handbook.dto.CommentalarmDto;
import com.sns.handbook.mapper.CommentalarmMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentalarmService implements CommentalarmServiceInter {

    @Autowired
    CommentalarmMapperInter mapperInter;

    @Override
    public void insertCommentAlarm(CommentalarmDto dto) {
        // TODO Auto-generated method stub
        mapperInter.insertCommentAlarm(dto);
    }

    @Override
    public List<CommentalarmDto> getAllCommentAlarm(String receiver_num) {
        // TODO Auto-generated method stub
        return mapperInter.getAllCommentAlarm(receiver_num);
    }

    @Override
    public int getTotalCountCommentAlarm(String receiver_num) {
        // TODO Auto-generated method stub
        return mapperInter.getTotalCountCommentAlarm(receiver_num);
    }

    @Override
    public void deleteAllCommentAlarm(String receiver_num) {
        // TODO Auto-generated method stub
        mapperInter.deleteAllCommentAlarm(receiver_num);
    }
}
