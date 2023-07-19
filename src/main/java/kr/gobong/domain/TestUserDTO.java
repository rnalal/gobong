package kr.gobong.domain;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;


public class TestUserDTO {
	@Size(min=2,max=10)
	private String id;
	
	@Size(min=2,max=10)
	@NotBlank
	private String pw;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	
	
}
