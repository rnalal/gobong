package kr.gobong.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import kr.gobong.domain.UserDTO;
import kr.gobong.repository.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDao;
	
	@Resource(name = "loginUser")
	@Lazy
	private UserDTO loginUser;
	
	@Override
	public void getUserLogin(UserDTO tmpUserLogin) {
		
		UserDTO tmpUserLogin2 = userDao.getUserLogin(tmpUserLogin);
		
		if(tmpUserLogin2 != null) {
			loginUser.setId(tmpUserLogin2.getId());
			loginUser.setName(tmpUserLogin2.getName());
			loginUser.setUserLogin(true);
		}
		return;
	}
	
	@Override
	public UserDTO getUserTest(String id) {
		return userDao.getUserTest(id);
	}
	
	@Override
	public boolean checkUserIdExist(String id) {
		String name = userDao.checkUserIdExist(id);
		if (name == null) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public void addUserInfo(UserDTO joinUserDto) {
		userDao.addUserInfo(joinUserDto);
	}

}
