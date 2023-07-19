package kr.gobong.service;

import java.util.List;

import kr.gobong.domain.BoardDTO;

public interface BoardService {
	
	//전재영0718
	// 글 목록 보기 
	public List<BoardDTO> getBoardList();
	
	//이재호0718
	public void boardInsert(BoardDTO boardDTO);
	
	//전재영0719
	//글상세보기
	public BoardDTO getBoardDetail(int no);

	//글수정하기
	public void boardEdit(BoardDTO boardEdit);
}
