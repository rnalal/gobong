package kr.gobong.service;

import java.util.List;

import kr.gobong.domain.UserDTO;
import kr.gobong.domain.UserVO;


public interface UserService {

	public UserDTO getUserTest(String id);

	public void addUserInfo(UserDTO joinUserDto); // 회원가입
	
	public void getUserLogin(UserDTO tmpUserLogin);	//로그인

	public void getUserInfo(UserDTO userInfo);	//마이페이지 나의 정보 불러오기
	
	public void userModifyPro(UserDTO userModify);	//정보수정 기능
	
	public List<UserVO> getUserProfile(String id);	//나의 프로필 불러오기

	public void userDel(String id); //회원탈퇴
	
	public List<UserVO> searchUser(String id); //회원 검색

	//아이디 중복체크
	public int duplicationCheckId(String id);
		
	public void deleteReplyForUserDelete(String id);
	public void deleteLikeForUserDelete(String id);
	public List<Integer> selectBoardNoForUserDelete(String id);
	public void deleteLikeForUserDeleteToBoard(int no);
	public void deleteReplyForUserDeleteToBoard(int no);
	public void deleteBoardForUserDelete(String id);
	public void deleteFollowsForUserDelete(String id);

}
