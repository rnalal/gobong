package kr.gobong.repository;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.gobong.domain.BoardDTO;
import kr.gobong.domain.ReplyDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	List<BoardDTO> boardList = new ArrayList<BoardDTO>();
	
	@Override
	public List<BoardDTO> getBoardList(){

		return sqlSessionTemplate.selectList("board1.getBoardList");
	}
	

	@Override
	public void boardInsert(BoardDTO boardDTO) {
		sqlSessionTemplate.insert("board1.boardInsert",boardDTO);

	}
	
	//조태정 0719 글 삭제
	@Override
	public void boardDel(int no) {
		sqlSessionTemplate.delete("board1.boardDel", no);
	}
	//조태정 0719 친구 게시글 목록 보기
	@Override
	public List<BoardDTO> getFriendBoardList(String id) {
		return sqlSessionTemplate.selectList("board1.getFriendBoardList",id);
	}
	
	/* 전재영0719 */
	// 글 상세보기
	@Override
	public BoardDTO getBoardDetail(int no) {
		return sqlSessionTemplate.selectOne("board1.getBoardDetail", no);
	}
	
	// 글 수정하기
	@Override
	public void boardEdit(BoardDTO boardDTO) {
		sqlSessionTemplate.update("board1.boardEdit", boardDTO);
	}
	
	/*//전재영0719 */
	  //박지현,전재영
   //상세페이지에서 댓글보기
   @Override
   public List<ReplyDTO> getReplyList(int no) {
      return sqlSessionTemplate.selectList("reply.getReplyList", no);
   }
   
   /* 김우주0723 */
	@Override
	public List<BoardDTO> getBoardListByHashtag(String hashtag) {
		return sqlSessionTemplate.selectList("user1.getBoardListByHashtag", hashtag);
	}
	/* 김우주0723 */
   	/* 김우주0724 */
	@Override
	public int getReplyNo() {
		return sqlSessionTemplate.selectOne("board1.getReplyNo");
	}
   	/*//김우주0724 */
}
