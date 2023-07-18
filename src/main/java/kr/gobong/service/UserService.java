package kr.gobong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gobong.domain.UserDTO;
import kr.gobong.repository.UserDAO;

@Service
public class UserService {
	@Autowired
	private UserDAO userDAO;
	
	public UserDTO getUserTest(String id) {
		return userDAO.getUserTest(id);
	}
}
