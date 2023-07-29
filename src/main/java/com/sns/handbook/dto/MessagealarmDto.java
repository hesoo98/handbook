package com.sns.handbook.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("MessagealarmDto")
public class MessagealarmDto {

    private String messal_num;
    private String receiver_num;
    private String sender_num;
    private int mess_group;
    private int chkcount;
}