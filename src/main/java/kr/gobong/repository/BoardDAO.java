package kr.gobong.repository;

import java.util.List;

import kr.gobong.domain.BoardDTO;
import kr.gobong.domain.ReplyVO;

public interface BoardDAO {

	//글 목록 보기 
	public List<BoardDTO> getBoardList();
	
	//좋아요 많은 순으로 3개 게시글 보기
	public List<BoardDTO> getLikeboardList();
		
	//글쓰기
	public void boardInsert(BoardDTO boardDTO);
	
	//글삭제
	public void boardDel(int no);
	
	//친구 게시글 목록 보기
	public List<BoardDTO> getFriendBoardList(String id);
	
	 
	//글 상세보기
	public BoardDTO getBoardDetail(int no);
	
	//글 수정하기
	public void boardEdit(BoardDTO boardDTO);

   //상세페이지에서 댓글보기
   public List<ReplyVO> getReplyList(int no);

   public List<BoardDTO> getBoardListByHashtag(String hashtag);

	public int getReplyNo();

	
	
}
