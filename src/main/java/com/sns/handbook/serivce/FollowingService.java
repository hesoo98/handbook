package com.sns.handbook.serivce;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.sns.handbook.dto.FollowingDto;
import com.sns.handbook.mapper.FollowingMapperInter;

@Service
public class FollowingService implements FollowingServiceInter {

	@Autowired
	FollowingMapperInter mapper;
	
	@Override
	public int checkFollowing(String from_user, String to_user) {
		// TODO Auto-generated method stub
		
		Map<String, String> map=new HashMap<>();
		
		map.put("from_user", from_user);
		map.put("to_user", to_user);
		
		return mapper.checkFollowing(map);
	}
	
	@Override
	public int checkFollower(String to_user, String from_user) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		
		map.put("to_user", to_user);
		map.put("from_user", from_user);
		
		
		return mapper.checkFollower(map);
	}
	
	@Override
	public void deleteFollowing(String to_user) {
		// TODO Auto-generated method stub
		mapper.deleteFollowing(to_user);
	}
	
	@Override
	public int getTotalFollowing(String from_user) {
		// TODO Auto-generated method stub
		return mapper.getTotalFollowing(from_user);
	}
	
	@Override
	public int getTotalFollower(String to_user) {
		// TODO Auto-generated method stub
		return mapper.getTotalFollower(to_user);
	}
	
	@Override
	public void insertFollowing(FollowingDto dto) {
		// TODO Auto-generated method stub
		mapper.insertFollowing(dto);
	}
}