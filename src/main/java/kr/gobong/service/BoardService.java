package kr.gobong.service;

import java.util.List;

import kr.gobong.domain.BoardDTO;
import kr.gobong.domain.ReplyVO;

public interface BoardService {
	
	//전재영0718
	// 글 목록 보기 
	public List<BoardDTO> getBoardList();
	//이재호0718
	public void boardInsert(BoardDTO boardDTO);
	//조태정 0719 
	//글삭제
	public void boardDel(int no);
	//친구 게시글 목록 보기
	public List<BoardDTO> getFriendBoardList(String id);
	
	
	//전재영0719
	//글상세보기
	public BoardDTO getBoardDetail(int no);

	//글수정하기
	public void boardEdit(BoardDTO boardEdit);
	
	//박지현,전재영
   //상세페이지에서 댓글보기
	/* 0726김우주 */
   public List<ReplyVO> getReplyList(int no);
	/* 0726김우주 */
   /* 김우주0723 */
   public List<BoardDTO> getBoardListByHashtag(String hashtag);
   /* 김우주0723 */
}
