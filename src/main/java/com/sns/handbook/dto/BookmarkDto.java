package com.sns.handbook.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("BookmarkDto")
public class BookmarkDto {

    private String book_num;
    private String owner_num;
    private String bfriend_num;
}
