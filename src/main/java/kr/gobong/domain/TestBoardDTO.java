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
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public MultipartFile getUpload_img1() {
		return upload_img1;
	}
	public void setUpload_img1(MultipartFile upload_img1) {
		this.upload_img1 = upload_img1;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	@Override
	public String toString() {
		return "TestBoardDTO [no=" + no + ", content=" + content + ", upload_img1=" + upload_img1 + ", img1=" + img1
				+ "]";
	}
    

    
}
