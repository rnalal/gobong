package kr.gobong.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.gobong.domain.BoardDTO;
import kr.gobong.domain.ReplyVO;
import kr.gobong.repository.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	@Autowired
	private HttpServletRequest request;
	
	//글 목록 보기 
	@Override
	public List<BoardDTO> getBoardList(){
		List<BoardDTO> boardList = boardDAO.getBoardList();
		return boardList;
	}
	
	// 좋아요 많은 순 3위
	@Override
	public List<BoardDTO> getLikeboardList(){
		List<BoardDTO> boardList = boardDAO.getLikeboardList();
		return boardList;
	}

	private int boardNoGenerator() {
		System.out.println(boardDAO.getReplyNo());
	   	
		if(boardDAO.getReplyNo()==0) {
			return 0;
		}else {
			return boardDAO.getReplyNo();
		}
	}
	
	private String saveUploadFile(MultipartFile uploadFile) {
		 
		String fileName = System.currentTimeMillis() + "_" + uploadFile.getOriginalFilename();
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;
		try {
			uploadFile.transferTo(new File(rootPath +"resources\\upload\\" + fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
	@Override
	public void boardInsert(BoardDTO boardDTO) {
		System.out.println(boardNoGenerator());
		boardDTO.setNo(boardNoGenerator()+1);
		MultipartFile upload_img1 = boardDTO.getUpload_img1();
		
		if(upload_img1.getSize()>0) {
			String fileName1 = saveUploadFile(upload_img1);
			boardDTO.setImg1(fileName1);
		}
		MultipartFile upload_img2 = boardDTO.getUpload_img2();
		if(upload_img2.getSize()>0) {
			String fileName2 = saveUploadFile(upload_img2);
			boardDTO.setImg2(fileName2);
		}
		MultipartFile upload_img3 = boardDTO.getUpload_img3();
		if(upload_img3.getSize()>0) {
			String fileName3 = saveUploadFile(upload_img3);
			boardDTO.setImg3(fileName3);
		} 
		boardDAO.boardInsert(boardDTO);
	}

	//글 삭제
	@Override
	public void boardDel(int no) {
		boardDAO.boardDel(no);
	}
	//친구 게시글 목록 보기
	@Override
	public List<BoardDTO> getFriendBoardList(String id) {
		List<BoardDTO> boardList = boardDAO.getFriendBoardList(id);
		return boardList;
	}
	
	// 글 상세보기
	@Override
	public BoardDTO getBoardDetail(int no) {
		return boardDAO.getBoardDetail(no);
	}
	
	
	// 글 수정하기
	@Override
	public void boardEdit(BoardDTO boardDTO) {
	
		MultipartFile upload_img1 = boardDTO.getUpload_img1();
		if(upload_img1.getSize()>0) {
			String fileName1 = saveUploadFile(upload_img1);
			boardDTO.setImg1(fileName1);
		}
		MultipartFile upload_img2 = boardDTO.getUpload_img2();
		if(upload_img2.getSize()>0) {
			String fileName2 = saveUploadFile(upload_img2);
			boardDTO.setImg2(fileName2);
		}
		MultipartFile upload_img3 = boardDTO.getUpload_img3();
		if(upload_img3.getSize()>0) {
			String fileName3 = saveUploadFile(upload_img3);
			boardDTO.setImg3(fileName3);
		}
		
		boardDAO.boardEdit(boardDTO);
	}
	
   //상세페이지에서 댓글보기
   @Override
   public List<ReplyVO> getReplyList(int no) {
      List<ReplyVO> replyList = boardDAO.getReplyList(no);
      return replyList;
   }

   	@Override
	public List<BoardDTO> getBoardListByHashtag(String hashtag) {
		return boardDAO.getBoardListByHashtag(hashtag);
		
	}

}
