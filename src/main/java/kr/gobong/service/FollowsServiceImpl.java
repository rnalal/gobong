package kr.gobong.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import kr.gobong.domain.FollowsDTO;
import kr.gobong.domain.UserDTO;
import kr.gobong.repository.FollowsDAO;

@Service
public class FollowsServiceImpl implements FollowsService {

	@Autowired
	private FollowsDAO followsDao;
	
	/*
	 * @Resource(name = "loginUser")
	 * 
	 * @Lazy private UserDTO loginUser;
	 */
	
	// 자신이 팔로우 한 사람이 몇명인지 조회하기
	@Override
	public int followingCnt(String id) {
		return followsDao.followingCnt(id);
	}
	
	// 자신을 팔로우 한 사람이 몇명인지 조회하기	
	@Override
	public int followerCnt(String id) {
		return followsDao.followerCnt(id);
	}
	
	// 자신이 팔로우 한 사람의 ID 목록 보기
	@Override
	public List<FollowsDTO> followingList(String id) {
		return followsDao.followingList(id);
	}
	
	// 자신을 팔로우 한 사람의 ID 목록 보기
	@Override
	public List<FollowsDTO> followerList(String id) {
		return followsDao.followerList(id);
	}
	
	// 다른 사용자 팔로우 하기
	@Override
	public void doFollow(FollowsDTO followsDto) {
		followsDao.doFollow(followsDto);
	}
	
	// 다른 사용자 팔로우 취소하기
	@Override
	public void unFollow(FollowsDTO followsDto) {
		followsDao.unFollow(followsDto);
	}

}
