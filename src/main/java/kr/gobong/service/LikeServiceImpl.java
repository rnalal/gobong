package kr.gobong.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import kr.gobong.domain.BoardDTO;
import kr.gobong.domain.LikeDTO;
import kr.gobong.domain.UserDTO;
import kr.gobong.repository.LikeDAO;

@Service
public class LikeServiceImpl implements LikeService{
	@Autowired
	LikeDAO likeDao;
	
	@Resource(name = "loginUser")
	@Lazy
	private UserDTO loginUser;
	
	// board up개수 늘리기
	@Override
	public void upLike(int no) {
		likeDao.upLike(no);
	}
	// like1테이블에 좋아요 누른사람 등록
	@Override
	public void registLike(LikeDTO likeDto) {
		likeDto.setId(loginUser.getId());
		likeDto.setUpcheck(1);
		likeDao.registLike(likeDto);
		
	}
	// board1 테이블을 삭제하기위해 좋아요테이블에서 먼저 삭제
	@Override
	public void deleteLikeForBoard(int no) {
		likeDao.deleteLikeForBoard(no);
	}
	
	// board1 테이블 up개수 줄이기
	@Override
	public void disLike(int no) {
		likeDao.disLike(no);
	}
	
	//해당 테이블의 좋아요 누른사람들 id 갖고오기
	@Override
	public List<LikeDTO> likeListInBoard(int no) {
		return likeDao.likeListInBoard(no);
	}
	@Override
	public int likeCheck(int no,String id ) {
		LikeDTO likeDto = new LikeDTO();
		likeDto.setNo(no);
		likeDto.setId(id);
		return likeDao.likeCheck(likeDto);
	}
	//테이블에서 내역삭제
	@Override
	public void deleteLikeFromId(int no, String id) {
		LikeDTO likeDto = new LikeDTO();
		likeDto.setNo(no);
		likeDto.setId(id);
		likeDao.deleteLikeFromId(likeDto);
	}
	//내가 좋아요 누른 글 목록 0724이재호
	@Override
	public List<BoardDTO> myLikeList(String id) {
		List<BoardDTO> myLikeList = likeDao.myLikeList(id);
		return myLikeList;
	}
}
