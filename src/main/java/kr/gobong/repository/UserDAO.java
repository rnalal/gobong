package kr.gobong.repository;

import java.util.List;

import kr.gobong.domain.UserDTO;
import kr.gobong.domain.UserVO;


public interface UserDAO {

	
	public UserDTO getUserTest(String id);
	public void addUserInfo(UserDTO joinUserDto);
	public UserDTO getUserLogin(UserDTO tmpUserLogin);	//로그인
	/* 0719 손승기 */
	public UserDTO getUserInfo(String id);	//마이페이지 정보 불러오기
	
	public void userModifyPro(UserDTO userModify); //정보수정 기능
	
	public List<UserVO> getUserProfile(String id);
	/* 0719 손승기 */
	
	/* 0721 조태정 */
	public void userDel(String id); //회원탈퇴
	
	public List<UserVO> searchUser(String id); //회원 검색
	/* 0721 조태정 */
	
	/* 0723김우주 */
	//아이디 중복체크
	public int duplicationCheckId(String id);
	/* 0723김우주 */
	
	/* 0725김우주 */
	public void deleteReplyForUserDelete(String id);
	public void deleteLikeForUserDelete(String id);
	public List<Integer> selectBoardNoForUserDelete(String id);
	public void deleteLikeForUserDeleteToBoard(int no);
	public void deleteReplyForUserDeleteToBoard(int no);
	public void deleteBoardForUserDelete(String id);
	public void deleteFollowsForUserDelete(String id);
	/* 0725김우주 */
}
