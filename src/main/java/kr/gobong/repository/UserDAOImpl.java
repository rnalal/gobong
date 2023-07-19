package kr.gobong.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.gobong.domain.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
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
	public String checkUserIdExist(String id) {
		String name = sqlSessionTemplate.selectOne("user1.checkUserIdExist", id);
		return name;
	}

	@Override
	public void addUserInfo(UserDTO joinUserDto) {
		sqlSessionTemplate.insert("user1.addUserInfo", joinUserDto);
	}

}
