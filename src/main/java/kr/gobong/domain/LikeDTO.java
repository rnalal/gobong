package kr.gobong.domain;


public class LikeDTO {
	private int no;
	private String id;
	private int upcheck = 1;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getUpcheck() {
		return upcheck;
	}
	public void setUpcheck(int upcheck) {
		this.upcheck = upcheck;
	}
	
	
}
