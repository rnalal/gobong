package kr.gobong.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserVO {
	private String id;
	private String name;
	
	//user1 테이블의 img
	private String img;
	private MultipartFile upload_img;
	
	//board1 테이블의 img1
	private String img1;
	private MultipartFile upload_img1;
	private int no; 
	
	
	
}
