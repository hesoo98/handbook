package com.sns.handbook.serivce;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.handbook.dto.MessageDto;
import com.sns.handbook.mapper.MessageMapperInter;

@Service
public class MessageService implements MessageServiceInter {
	
	@Autowired
	MessageMapperInter mapperInter;

	@Override
	public List<Map<String, Object>> selectAllChatMemeber(String user_num) {
		// 나를 제외한 다른 사용자와 해당 메시지의 그룹만 뽑아서 넘겨준다
		
		//상대방 중복 피하기 위한 배열
		ArrayList<String> member=new ArrayList<>();
		
		//나와 대화했던 사용자(나를 포함)와 메시지 그룹을 뽑는다.
		List<MessageDto> list=mapperInter.selectAllChatMemeber(user_num);
		
		//상대와 그룹을 저장한다
		List<Map<String, Object>> chatMember=new ArrayList<>();
		
		for(MessageDto dto:list)
		{
			Map<String, Object> map=new HashMap<>();
			
			//내가 아닌 상대방을 구하기(sender나 receiver)
			if(!dto.getSender_num().equals(user_num)) {
				//만약 sender가 내가 아니라면(=상대라는 의미)
				String other=dto.getSender_num();
				
				//이미 그 상대가 멤버 배열에 저장돼있다면 넘어간다.(이미 저장한 상대)
				if(member.contains(other)) {
					continue;
				}
				
				else {
					member.add(other); //상대 목록에 추가(중복방지)
					
					//상대와 가장 최근 대화와 시간을 가져온다
					MessageDto messageTalk=selectRecentMessage(user_num, other);
					
					map.put("member_num", other); 
					map.put("group", dto.getMess_group());
					map.put("content", messageTalk.getMess_content()); //최근 대화 내용
					map.put("writeday", messageTalk.getMess_writeday()); //최근 대화 시간(날짜)
					
					chatMember.add(map); //상대와 그룹 저장
				}
			}else if(!dto.getReceiver_num().equals(user_num)){
				//만약 receiver가 내가 아니라면(=상대라는 의미)
				String other=dto.getReceiver_num();
				
				//이미 그 상대가 멤버 배열에 저장돼있다면 넘어간다.(이미 저장한 상대)
				if(member.contains(other)) {
					continue;
				}
				
				else {
					member.add(other); //상대 목록에 추가(중복방지)
					
					//상대와 가장 최근 대화와 시간을 가져온다
					MessageDto messageTalk=selectRecentMessage(user_num, other);
					
					map.put("member_num", other); 
					map.put("group", dto.getMess_group());
					map.put("content", messageTalk.getMess_content()); //최근 대화 내용
					map.put("writeday", messageTalk.getMess_writeday()); //최근 대화 시간(날짜)
					
					chatMember.add(map); //상대와 그룹 저장
				}
			}
		}
		
		return chatMember;
	}

	@Override
	public MessageDto selectRecentMessage(String user_num,String other) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		
		map.put("user_num", user_num);
		map.put("other", other);
		
		return mapperInter.selectRecentMessage(map);
	}

}
