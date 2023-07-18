package kr.gobong.service;

import java.util.List;

import kr.gobong.domain.BoardDTO;

public interface BoardService {

	// 글 목록 보기 
	List<BoardDTO> getBoardList();
	
}
