package kr.gobong.service;

import java.util.List;

import kr.gobong.domain.BoardDTO;
import kr.gobong.domain.LikeDTO;

public interface LikeService {
	public void upLike(int no);
	public void registLike(LikeDTO likeDto);
	public void deleteLikeForBoard(int no);
	public void disLike(int no);
	public List<LikeDTO> likeListInBoard(int no);
	public int likeCheck(int no,String id);
	public void deleteLikeFromId(int no, String id);
	public List<BoardDTO> myLikeList(String id);
}
