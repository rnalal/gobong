package kr.gobong.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.gobong.domain.UserDTO;
import kr.gobong.domain.UserVO;
import kr.gobong.repository.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDao;
	
	@Resource(name = "loginUser")
	@Lazy
	private UserDTO loginUser;
	
	@Autowired
	HttpServletRequest request;
	
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
	public void addUserInfo(UserDTO joinUserDto) {
		
		MultipartFile upload_img = joinUserDto.getUpload_img();
		
		if(upload_img.getSize() > 0) {
			String fileName = saveUploadFile(upload_img);
			joinUserDto.setImg(fileName);
		}
		userDao.addUserInfo(joinUserDto);
	}

	@Override
	public void getUserInfo(UserDTO userInfo) {
		
		UserDTO tmpUserInfo = userDao.getUserInfo(loginUser.getId());

		userInfo.setId(tmpUserInfo.getId());
		userInfo.setName(tmpUserInfo.getName());
		userInfo.setPw(tmpUserInfo.getPw());
		userInfo.setEmail(tmpUserInfo.getEmail());
		userInfo.setTel(tmpUserInfo.getTel());
		userInfo.setRegdate(tmpUserInfo.getRegdate());
		userInfo.setImg(tmpUserInfo.getImg());
		System.out.println("userInfo : " + userInfo);
		System.out.println("tmpUserInfo : " + tmpUserInfo);
		
		return;	
	}
	
	private String saveUploadFile(MultipartFile uploadFile) {
		
		String fileName = System.currentTimeMillis() + "_" + uploadFile.getOriginalFilename();
		
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;
		try {
			uploadFile.transferTo(new File(rootPath +"resources\\upload\\" + fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
	@Override
	public void userModifyPro(UserDTO userModify) {
		System.out.println(userModify.getImg());
		System.out.println(userModify.getUpload_img());
		MultipartFile upload_img = userModify.getUpload_img();
		
		if(upload_img.getSize() > 0) {
			String fileName = saveUploadFile(upload_img);
			userModify.setImg(fileName);
		}

		userDao.userModifyPro(userModify);
	}
	
	@Override
	public List<UserVO> getUserProfile(String id) {
		return userDao.getUserProfile(id);
	}

	//탈퇴
	@Override
	public void userDel(String id) {
		userDao.userDel(id);
	}

	@Override
	public List<UserVO> searchUser(String id) {
		return userDao.searchUser(id);
	}

	//아이디 중복체크
	@Override
	public int duplicationCheckId(String id) {
		return userDao.duplicationCheckId(id);
	}

	@Override
	public void deleteReplyForUserDelete(String id) {
		userDao.deleteReplyForUserDelete(id);
	}
	@Override
	public void deleteLikeForUserDelete(String id) {
		userDao.deleteLikeForUserDelete(id);
	}
	@Override
	public List<Integer> selectBoardNoForUserDelete(String id){
		return userDao.selectBoardNoForUserDelete(id);
	}
	@Override
	public void deleteLikeForUserDeleteToBoard(int no) {
		userDao.deleteLikeForUserDeleteToBoard(no);
	}
	@Override
	public void deleteReplyForUserDeleteToBoard(int no) {
		userDao.deleteReplyForUserDeleteToBoard(no);	
	}
	
	@Override
	public void deleteBoardForUserDelete(String id) {
		userDao.deleteBoardForUserDelete(id);
	}
	@Override
	public void deleteFollowsForUserDelete(String id) {
		userDao.deleteFollowsForUserDelete(id);						
	}

	
}
