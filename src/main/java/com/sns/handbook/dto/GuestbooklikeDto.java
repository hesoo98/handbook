package com.sns.handbook.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("GuestbooklikeDto")
public class GuestbooklikeDto {

    private String glike_unm;
    private String user_num;
    private String guest_num;
}