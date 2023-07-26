package kr.gobong.service;

import java.util.List;

import kr.gobong.domain.BoardDTO;
import kr.gobong.domain.ReplyDTO;

public interface ReplyService {


	// 이재호0721
	// 댓글 쓰기
	public void addReply(ReplyDTO replyDTO);

	// 댓글 삭제
	public void deleteReply(int rno);
	
	/* 0724김우주 */
	//글삭제시 댓글비워주기
	public void deleteReplyForBoard(int no);
	/* 0724김우주 */
	
	//이재호0725
	//내가 쓴 댓글보기
//	public List<BoardDTO> myReply(String id);
	
	/* 0726김우주 */
	//내가 쓴 댓글보기
	public List<ReplyDTO> myReply(String id);
	/* 0726김우주 */
}
