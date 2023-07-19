package kr.gobong.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.gobong.domain.BoardDTO;
import kr.gobong.repository.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	@Autowired
	private HttpServletRequest request;
	
	//전재영0718 글 목록 보기 
	@Override
	public List<BoardDTO> getBoardList(){
		List<BoardDTO> boardList = boardDAO.getBoardList();
		return boardList;
	}
	
	/* 김우주0719 */
	private int boardNoGenerator() {
		List<BoardDTO> boardList = boardDAO.getBoardList();
		if(boardList.size()==0) {
			return 0;
		}else {
			return boardList.get(0).getNo();
		}
	}
	//재호씨 boardInsert에 연계됩니다
	//각주 달아놓은거 참고해주세요
	/*//김우주0719 */
	
	
	/* 이재호0718 */
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
		System.out.println("no" + boardDTO.getNo());
		System.out.println("content" + boardDTO.getContent());
		System.out.println("img1" + boardDTO.getImg1());
		/* 김우주0719 */
		System.out.println(boardNoGenerator());
		boardDTO.setNo(boardNoGenerator()+1);
		/*//김우주0719 */
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
	/*//이재호0718 */
	
	
	// 전재영 0719
	// 글 상세보기
	@Override
	public BoardDTO getBoardDetail(int no) {
		return boardDAO.getBoardDetail(no);
	}
	// 글 수정하기
	@Override
	public void boardEdit(BoardDTO boardDTO) {
		
		MultipartFile upload_img1 = boardDTO.getUpload_img1();
		MultipartFile upload_img2 = boardDTO.getUpload_img2();
		MultipartFile upload_img3 = boardDTO.getUpload_img3();
		
		boardDAO.boardEdit(boardDTO);
	}

}
