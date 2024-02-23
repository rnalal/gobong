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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public MultipartFile getUpload_img() {
		return upload_img;
	}
	public void setUpload_img(MultipartFile upload_img) {
		this.upload_img = upload_img;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public MultipartFile getUpload_img1() {
		return upload_img1;
	}
	public void setUpload_img1(MultipartFile upload_img1) {
		this.upload_img1 = upload_img1;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", name=" + name + ", img=" + img + ", upload_img=" + upload_img + ", img1=" + img1
				+ ", upload_img1=" + upload_img1 + ", no=" + no + "]";
	} 	
	
}
