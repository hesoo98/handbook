package com.sns.handbook.mapper;

import com.sns.handbook.dto.BookmarkDto;
import com.sns.handbook.dto.PostDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BookmarkMapperInter {

    public void insertBookmark(BookmarkDto dto);

    public void deleteBookmark(Map<String, String> map);

    public int bookmarkCheck(Map<String, String> map);

    public List<PostDto> bookmarkPost(Map<String, Object> map);
}
