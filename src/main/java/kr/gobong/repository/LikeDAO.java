package kr.gobong.repository;

import java.util.List;

import kr.gobong.domain.BoardDTO;
import kr.gobong.domain.LikeDTO;

public interface LikeDAO {
	public void upLike(int no);
	public void registLike(LikeDTO likeDto);
	public void deleteLikeForBoard(int no);
	public void disLike(int no);
	public List<LikeDTO> likeListInBoard(int no);
	public int likeCheck(LikeDTO likeDto);
	public void deleteLikeFromId(LikeDTO likeDto);
	public List<BoardDTO> myLikeList(String id);
}
