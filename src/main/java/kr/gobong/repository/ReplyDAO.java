package kr.gobong.repository;

import java.util.List;

import kr.gobong.domain.ReplyDTO;

public interface ReplyDAO {

	//댓글 쓰기
	public void addReply(ReplyDTO replyDto);
	
	//댓글 삭제
	public void deleteReply(int rno);

	//글삭제시 댓글비워주기
	public void deleteReplyForBoard(int no);
	//댓글 번호 자동화
	public List<Integer> getReplyRno();
	
	//내가 쓴 댓글보기
	public List<ReplyDTO> myReply(String id);
}
