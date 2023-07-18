package kr.gobong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.gobong.domain.BoardDTO;
import kr.gobong.service.BoardService;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	// 글 목록 보기
	@GetMapping("/boardlist")
	public String boardList(Model model) {
		
		List<BoardDTO> boardList = boardService.getBoardList();
		model.addAttribute("boardList", boardList);
		
		return "board/board_list";
	}
	
	
}
