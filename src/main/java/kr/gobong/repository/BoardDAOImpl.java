package kr.gobong.repository;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.gobong.domain.BoardDTO;
import kr.gobong.domain.ReplyVO;

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
	public List<BoardDTO> getLikeboardList(){
		return sqlSessionTemplate.selectList("board1.getLikeboardList");
	}
	
	@Override
	public void boardInsert(BoardDTO boardDTO) {
		sqlSessionTemplate.insert("board1.boardInsert",boardDTO);

	}
	
	//글 삭제
	@Override
	public void boardDel(int no) {
		sqlSessionTemplate.delete("board1.boardDel", no);
	}
	//친구 게시글 목록 보기
	@Override
	public List<BoardDTO> getFriendBoardList(String id) {
		return sqlSessionTemplate.selectList("board1.getFriendBoardList",id);
	}
	


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
	

   //상세페이지에서 댓글보기

   @Override
   public List<ReplyVO> getReplyList(int no) {
      return sqlSessionTemplate.selectList("reply.getReplyList", no);
   }

	@Override
	public List<BoardDTO> getBoardListByHashtag(String hashtag) {
		return sqlSessionTemplate.selectList("user1.getBoardListByHashtag", hashtag);
	}

	@Override
	public int getReplyNo() {
		return sqlSessionTemplate.selectOne("board1.getReplyNo");
	}
 
}
