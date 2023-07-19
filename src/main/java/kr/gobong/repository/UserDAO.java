package kr.gobong.repository;

import kr.gobong.domain.UserDTO;


public interface UserDAO {

	
	public UserDTO getUserTest(String id);
	public String checkUserIdExist(String id);
	public void addUserInfo(UserDTO joinUserDto);
	public UserDTO getUserLogin(UserDTO tmpUserLogin);	//로그인
}
