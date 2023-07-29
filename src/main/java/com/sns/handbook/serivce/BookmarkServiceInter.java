package com.sns.handbook.serivce;

import com.sns.handbook.dto.BookmarkDto;
import com.sns.handbook.dto.PostDto;

import java.util.List;

public interface BookmarkServiceInter {
    public void insertBookmark(BookmarkDto dto);

    public void deleteBookmark(String owner_num, String bfriend_num);

    public int bookmarkCheck(String owner_num, String bfriend_num);

    public List<PostDto> bookmarkPost(String owner_num, int offset);
}
