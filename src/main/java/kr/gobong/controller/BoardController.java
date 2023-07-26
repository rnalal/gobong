package kr.gobong.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.gobong.domain.BoardDTO;
import kr.gobong.domain.ReplyDTO;
import kr.gobong.domain.ReplyVO;
import kr.gobong.domain.UserDTO;
import kr.gobong.service.BoardService;
import kr.gobong.service.LikeService;
import kr.gobong.service.ReplyService;
import kr.gobong.validator.BoardCustomValidator;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private ReplyService replyService;
	
	@Resource(name = "loginUser")
	@Lazy
	private UserDTO loginUser;
	
	/* 전재영0718 */
	// 글 목록 보기
	@GetMapping("/boardlist")
	public String boardList(Model model) {
		
		List<BoardDTO> boardList = boardService.getBoardList();
		model.addAttribute("boardList", boardList);

		return "board/board_list";
	}
	/*//전재영0718 */
	
	/* 이재호0718 */
	//글쓰기페이지
	@GetMapping("/boardInsert")
	public String boardInsert(@ModelAttribute BoardDTO boardInsert, Model model) {
		
		model.addAttribute("boardInsert",boardInsert);
		return "board/boardInsert";
	}
	
	//글쓰기
	@PostMapping("/boardInsertPro")
	public String boardInsertPro(@Valid @ModelAttribute("boardInsert") BoardDTO boardInsert,BindingResult result) {
		if(result.hasErrors()) {
			return "board/boardInsert";
		}
		boardService.boardInsert(boardInsert);
		
		return "index";
	}

	/*//이재호0718 */
	
	/* 0719 조태정*/
	//글 삭제
	 @GetMapping("/boardDel") 
	 public String boardDel(@RequestParam("no") int no, Model model) {
		 /* 0719김우주 */
		 likeService.deleteLikeForBoard(no);
		 /* 0719김우주 */
		 /* 0724김우주 */
		 replyService.deleteReplyForBoard(no);
		 /* 0724김우주 */
		 boardService.boardDel(no);
		 model.addAttribute("no", no);
		 return "board/board_del";
	 }
	 
	 //친구 글 목록 보기
	@GetMapping("/friendboardlist")
	public String friendboardList(Model model) {
		String id = loginUser.getId();
		List<BoardDTO> boardList = boardService.getFriendBoardList(id);
		model.addAttribute("boardList", boardList);
		
		return "board/board_list";
	}
	 
	/* 0719 조태정 */
	
	
	/* 전재영0719 */
	// 글 상세보기
	   // 박지현,전재영 0721  - 상세페이지에서 댓글보기
	   @GetMapping("/boarddetail")
	   public String boardDetail(HttpServletRequest request, Model model) {
	      
	      int no = Integer.parseInt(request.getParameter("no"));
	  	/* 0726김우주 */
	      BoardDTO boardDTO = boardService.getBoardDetail(no);
	      List<ReplyVO> replyList = boardService.getReplyList(no);
	  	/* 0726김우주 */
	      model.addAttribute("boardDTO", boardDTO);
	      model.addAttribute("replyList", replyList);
	      return "board/board_detail";
	   }
	
	// 글 수정하기
	@GetMapping("/boardEdit")
	public String boardEdit(@RequestParam("no") int no, 
													@ModelAttribute("boardEdit") BoardDTO boardEdit,
                    			Model model) {
		
		model.addAttribute("no", no);
		
		BoardDTO boardDTO = boardService.getBoardDetail(no);
		model.addAttribute("boardDTO", boardDTO);
		
		
		return "board/board_edit";
	}
	
	@PostMapping("/boardEditPro")
	public String boardEditPro(@RequestParam("no") int no, 
							               @ModelAttribute("boardEdit") BoardDTO boardEdit,
							               BindingResult result,
							               Model model) {
		
		model.addAttribute("no", no);
		
		if(result.hasErrors()) {
			return "board/boardedit";
		}
		boardService.boardEdit(boardEdit);
		
		//no추가
		return "redirect:/board/boarddetail?no="+no;
	}
	/* //0719전재영*/
	
	
	//댓글 쓰기
	@GetMapping("/replyInsert")
	public String replyInsert(@ModelAttribute("replyDto") ReplyDTO replyDto,@RequestParam("no") int no,Model model) {
		model.addAttribute("no", no);
		return "board/replyInsert";
	}

	
	@PostMapping("/replyInsertPro")
	public String replyInsertPro(@RequestParam("no") int no,@ModelAttribute("replyDto") ReplyDTO replyDto,Model model) {
		replyService.addReply(replyDto);
		
		return "board/board_detail";
	}
	
	/* 김우주0723 */
	@GetMapping("replyDel")
	public String replyDel(@RequestParam("rno") int rno,@RequestParam("no") int no) {
		replyService.deleteReply(rno);
		return "redirect:/board/boarddetail?no="+no;
	}
	
	/* 김우주0724 */
	//댓글쓰기 ajax로 사용
	@PostMapping("/replyInsert.do")
	@ResponseBody
	public void replyInsertAjax(@ModelAttribute("replyDto") ReplyDTO replyDto) {
		replyService.addReply(replyDto);
	}
	
	
	/*//김우주0724 */
	
	
	//커스텀밸리데이션
	/* 
	 * 발리데이션에 여러개 등록할 시
	 * @InitBinder({"boardInsert","reply"})
	 * 이런식의 배열로 써주면됩니다 ""안에 들어가는값은 DTO의 이름입니다
	 * 글쓰기 DTO의 클래스명을 선언한것을 참조(71번째줄)
	 * 
	 */
	@InitBinder("boardInsert")
	public void initBinder(WebDataBinder binder) {
		BoardCustomValidator bcv = new BoardCustomValidator();
		binder.addValidators(bcv);
		
	}
	/* 김우주0723 */
}
