package kr.gobong.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.gobong.domain.UserDTO;
import kr.gobong.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 회원가입
	@Override
	public void addUserInfo(UserDTO joinUserDto) {
		sqlSessionTemplate.insert("user1.addUserInfo", joinUserDto);
	}
	
	@Override
	public UserDTO getUserLogin(UserDTO tmpUserLogin) {
		UserDTO user =sqlSessionTemplate.selectOne("user1.getUserLogin", tmpUserLogin);
		return user;
	}
	
	@Override
	public UserDTO getUserTest(String id) {
		return sqlSessionTemplate.selectOne("user1.getUserTest", id);
	}

	@Override
	public UserDTO getUserInfo(String id) {
		return sqlSessionTemplate.selectOne("user1.getUserInfo", id);
	}

	@Override
	public void userModifyPro(UserDTO userModify) {
		sqlSessionTemplate.update("user1.userModifyPro", userModify);
	}
	
	@Override
	public List<UserVO> getUserProfile(String id) {
		return sqlSessionTemplate.selectList("user1.getUserProfile", id);
	}

	@Override
	public void userDel(String id) {
		sqlSessionTemplate.delete("user1.userDel", id);
	}

	@Override
	public List<UserVO> searchUser(String id) {
		return sqlSessionTemplate.selectList("user1.searchUser", id);
	}

	@Override
	public int duplicationCheckId(String id) {
		return sqlSessionTemplate.selectOne("user1.duplicationCheckId", id);
	}

	@Override
	public void deleteReplyForUserDelete(String id) {
		sqlSessionTemplate.delete("deleteUser.deleteReplyForUserDelete", id);
	}
	@Override
	public void deleteLikeForUserDelete(String id) {
		sqlSessionTemplate.delete("deleteUser.deleteLikeForUserDelete", id);
	}
	@Override
	public List<Integer> selectBoardNoForUserDelete(String id){
		return sqlSessionTemplate.selectList("deleteUser.selectBoardNoForUserDelete", id);
	}
	@Override
	public void deleteLikeForUserDeleteToBoard(int no) {
		sqlSessionTemplate.delete("deleteUser.deleteLikeForUserDeleteToBoard", no);
	}
	@Override
	public void deleteReplyForUserDeleteToBoard(int no) {
		sqlSessionTemplate.delete("deleteUser.deleteReplyForUserDeleteToBoard", no);	
	}
	@Override
	public void deleteBoardForUserDelete(String id) {
		sqlSessionTemplate.delete("deleteUser.deleteBoardForUserDelete", id);
	}
	@Override
	public void deleteFollowsForUserDelete(String id) {
		sqlSessionTemplate.delete("deleteUser.deleteFollowsForUserDelete", id);						
	}

}
