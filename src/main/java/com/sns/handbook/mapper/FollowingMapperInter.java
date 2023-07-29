package com.sns.handbook.mapper;

import com.sns.handbook.dto.FollowingDto;
import com.sns.handbook.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface FollowingMapperInter {

    public int checkFollowing(Map<String, String> map);

    public int checkFollower(Map<String, String> map);

    public int getTotalFollowing(String from_user);

    public int getTotalFollower(String to_user);

    public void insertFollowing(FollowingDto dto);

    public void deleteFollowing(Map<String, String> map);

    public List<FollowingDto> getFollowList(Map<String, Object> map);

    public int togetherFollow(Map<String, String> map);

    public List<FollowingDto> followSearch(Map<String, Object> map);

    public List<FollowingDto> followerSearch(Map<String, Object> map);

    public List<UserDto> followRecommend(Map<String, Object> map);

    public List<FollowingDto> getFollowingList(Map<String, Object> map);
}
