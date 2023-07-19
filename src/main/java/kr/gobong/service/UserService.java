package kr.gobong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gobong.domain.UserDTO;
import kr.gobong.repository.UserDAO;


public interface UserService {

	public UserDTO getUserTest(String id);

	public boolean checkUserIdExist(String id);

	public void addUserInfo(UserDTO joinUserDto);
	
	public void getUserLogin(UserDTO tmpUserLogin);	//로그인
}
