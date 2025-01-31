package com.sns.handbook.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@Data
@Alias("MessageDto")
public class MessageDto {

    private String mess_num;
    private String sender_num;
    private String receiver_num;
    private int mess_group;
    private String mess_content;
    private Timestamp mess_writeday;

    private String mess_time;
    private String sender_name;
    private String receiver_name;

    private String sender_photo;
}