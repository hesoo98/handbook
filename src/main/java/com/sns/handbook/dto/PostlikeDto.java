package com.sns.handbook.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("PostlikeDto")
public class PostlikeDto {

    private String plike_num;
    private String user_num;
    private String post_num;
}