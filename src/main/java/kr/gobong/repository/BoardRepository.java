package kr.gobong.repository;

import java.util.List;

import kr.gobong.domain.BoardDTO;

public interface BoardRepository {

  // 글 목록 보기 
	List<BoardDTO> getBoardList();

}
