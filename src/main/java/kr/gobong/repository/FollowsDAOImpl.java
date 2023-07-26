package kr.gobong.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.gobong.domain.FollowsDTO;

@Repository
public class FollowsDAOImpl implements FollowsDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int followingCnt(String id) {
		return sqlSessionTemplate.selectOne("follows.followingCnt", id);
	}
	
	@Override
	public int followerCnt(String id) {
		return sqlSessionTemplate.selectOne("follows.followerCnt", id);
	}
	
	@Override
	public List<FollowsDTO> followingList(String id) {
		return sqlSessionTemplate.selectList("follows.followingList", id);
	}
	
	@Override
	public List<FollowsDTO> followerList(String id) {
		return sqlSessionTemplate.selectList("follows.followerList", id);
	}

	@Override
	public void doFollow(FollowsDTO followsDto) {
		sqlSessionTemplate.insert("follows.doFollow", followsDto);
	}
	
	@Override
	public void unFollow(FollowsDTO followsDto) {
		sqlSessionTemplate.delete("follows.unFollow", followsDto);
		
	}
}
