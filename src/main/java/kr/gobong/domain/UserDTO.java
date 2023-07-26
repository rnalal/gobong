package kr.gobong.domain;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserDTO {
	@Size(min = 4, max = 20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String id;

	/* 김우주0720	*/
	@Size(min = 2, max = 6)
	@Pattern(regexp = "[가-힣]*")
	private String name;
	/*//김우주0720	*/
	
	@Size(min = 4, max = 20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String pw;
	
	@NotBlank
	@Email
	private String email;
	
	private String tel;
	private String regdate;
	
	//0719 손승기
	private MultipartFile upload_img;
	//0719 손승기
	
	private String img;

	@Size(min = 4, max = 20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String pw2;

    //0718손승기
    private boolean userLogin; // 로그인 상태인지 아닌지 여부를 저장하는 멤버변수
    //0718손승기

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

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public MultipartFile getUpload_img() {
		return upload_img;
	}

	public void setUpload_img(MultipartFile upload_img) {
		this.upload_img = upload_img;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getPw2() {
		return pw2;
	}

	public void setPw2(String pw2) {
		this.pw2 = pw2;
	}

	public boolean isUserLogin() {
		return userLogin;
	}

	public void setUserLogin(boolean userLogin) {
		this.userLogin = userLogin;
	}


    
}
