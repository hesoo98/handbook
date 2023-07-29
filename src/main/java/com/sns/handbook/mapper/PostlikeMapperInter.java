package com.sns.handbook.mapper;

import com.sns.handbook.dto.PostlikeDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface PostlikeMapperInter {
    public int getTotalLike(String post_num);

    public void insertLike(PostlikeDto dto);

    public void deleteLike(String post_num, String user_num);

    public int checklike(Map<String, String> map);
}
