package kr.gobong.domain;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TestBoardDTO {
    private int no;
    
	@NotBlank
    private String content;
    private MultipartFile upload_img1;
    private String img1;

    
}
