package kr.gobong.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.gobong.domain.TestBoardDTO;
import kr.gobong.repository.TestDAO;

@Service
public class TestServiceImpl implements TestService {
	@Autowired
	private TestDAO testDAO;
	@Autowired
	private HttpServletRequest request;
	
	//파일 업로드 테스트를 위한
	//전처리과정
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
 
	//파일업로드 테스트보드
	@Override
	public void insertBoardTest(TestBoardDTO testBoardDTO) {
		System.out.println("no" + testBoardDTO.getNo());
		System.out.println("content" + testBoardDTO.getContent());
		System.out.println("img1" + testBoardDTO.getImg1());
		MultipartFile uploadFile = testBoardDTO.getUpload_img1();
		if(uploadFile.getSize()>0) {
			String fileName = saveUploadFile(uploadFile);
			testBoardDTO.setImg1(fileName);
		}
		
		testDAO.insertBoardTest(testBoardDTO);
	}
/*
	MultipartFile uploadFile = writeContentBean.getUpload_file();
	if(uploadFile.getSize()>0) {
	String fileName = saveUploadFile(uploadFile);
	System.out.println("파일명" + fileName);
	writeContentBean.setContent_file(fileName);
	}
	writeContentBean.setContent_writer_idx(loginUserBean.getUser_idx());
*/
	@Override
	public String getTest() {
		return testDAO.getTest();
	}
}
