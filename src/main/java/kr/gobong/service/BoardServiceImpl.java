package kr.gobong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gobong.domain.BoardDTO;
import kr.gobong.repository.BoardRepository;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardRepository boardRepository;
	
	// 글 목록 보기 
	public List<BoardDTO> getBoardList(){
		List<BoardDTO> boardList = boardRepository.getBoardList();
		return boardList;
	}
	
}
