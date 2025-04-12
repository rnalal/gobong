package kr.gobong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gobong.domain.BoardDTO;
import kr.gobong.domain.ReplyDTO;
import kr.gobong.repository.BoardDAO;
import kr.gobong.repository.ReplyDAO;


@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyDAO replyDAO;
	
	@Autowired
	BoardDAO boardDAO;

	//댓글번호 자동화
	private int replyRNoGenerator() {
		List<Integer> replyList = replyDAO.getReplyRno();
		if(replyList.size()==0) {
			return 0;
		}else {
			return replyList.get(0);
		}
	}
	
	@Override
	public void addReply(ReplyDTO replyDTO) {
		replyDTO.setRno(replyRNoGenerator()+1);
		replyDAO.addReply(replyDTO);
	}

	@Override
	public void deleteReply(int rno) {
		replyDAO.deleteReply(rno);
	}

	//글삭제시 댓글비워주기
	public void deleteReplyForBoard(int no) {
		replyDAO.deleteReplyForBoard(no);
	}
	
	//내가 쓴 댓글보기
	@Override
	public List<ReplyDTO> myReply(String id){
		return replyDAO.myReply(id);
	}

}
