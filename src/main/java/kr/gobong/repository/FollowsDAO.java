package kr.gobong.repository;

import java.util.List;

import kr.gobong.domain.FollowsDTO;

public interface FollowsDAO {

	// 자신이 팔로우 한 사람이 몇명인지 조회하기
	public int followingCnt(String id);

	// 자신을 팔로우 한 사람이 몇명인지 조회하기
	public int followerCnt(String id);
	
	// 자신이 팔로우 한 사람의 ID 목록 조회하기
	public List<FollowsDTO> followingList(String id);
	
	// 자신을 팔로우 한 사람의 ID 목록 조회하기
	public List<FollowsDTO> followerList(String id);
	
	// 다른 사용자 팔로우 하기
	public void doFollow(FollowsDTO followsDto);
	
	// 다른 사용자 팔로우 취소하기
	public void unFollow(FollowsDTO followsDto);
}
