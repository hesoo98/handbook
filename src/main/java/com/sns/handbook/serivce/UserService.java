package com.sns.handbook.serivce;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.handbook.dto.UserDto;
import com.sns.handbook.mapper.UserMapperInter;

@Service
public class UserService implements UserServiceInter{

	@Autowired
	UserMapperInter mapperInter;

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCount();
	}

	@Override
	public int loginIdPassCheck(String user_id, String user_pass) {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pass", user_pass);
		return mapperInter.loginIdPassCheck(map);
	}

	//예지
	@Override
	public UserDto getUserById(String user_id) {
		// TODO Auto-generated method stub
		return mapperInter.getUserById(user_id);
	}

	@Override
	public UserDto getUserByNum(String user_num) {
		// TODO Auto-generated method stub
		return mapperInter.getUserByNum(user_num);
	}
	
}
