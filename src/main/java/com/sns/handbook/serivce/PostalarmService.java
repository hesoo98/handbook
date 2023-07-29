package com.sns.handbook.serivce;

import com.sns.handbook.dto.PostalarmDto;
import com.sns.handbook.mapper.PostalarmMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostalarmService implements PostalarmServiceInter {

    @Autowired
    PostalarmMapperInter mapperInter;

    @Override
    public void insertPostAlarm(PostalarmDto dto) {
        // TODO Auto-generated method stub
        mapperInter.insertPostAlarm(dto);
    }

    @Override
    public List<PostalarmDto> getAllPostAlarm(String receiver_num) {
        // TODO Auto-generated method stub
        return mapperInter.getAllPostAlarm(receiver_num);
    }

    @Override
    public int getTotalCountPostAlarm(String receiver_num) {
        // TODO Auto-generated method stub
        return mapperInter.getTotalCountPostAlarm(receiver_num);
    }

    @Override
    public void deleteallPostAlarm(String receiver_num) {
        // TODO Auto-generated method stub
        mapperInter.deleteallPostAlarm(receiver_num);
    }
}
