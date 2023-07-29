package com.sns.handbook.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("CommentlikeDto")
public class CommentlikeDto {

    private String clike_num;
    private String user_num;
    private String comment_num;
}
