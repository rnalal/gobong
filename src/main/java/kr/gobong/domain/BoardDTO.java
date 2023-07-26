package kr.gobong.domain;

import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDTO {
	private int no;
	private String id;
	private String content;
	private String hashtag;
	private int up;
	private String regdate;
	private MultipartFile upload_img1;
	private MultipartFile upload_img2;
	private MultipartFile upload_img3;
	private String img1;
	private String img2;
	private String img3;
	private String name;
	private int prv;
	private String img;
	//댓글개수
	//0723전재영
	private String reply_cnt;
	
	
	@Override
	public String toString() {
		return "BoardDTO [no=" + no + ", id=" + id + ", content=" + content + ", hashtag=" + hashtag + ", up=" + up
				+ ", regdate=" + regdate + ", upload_img1=" + upload_img1 + ", upload_img2=" + upload_img2
				+ ", upload_img3=" + upload_img3 + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3 + ", name="
				+ name + ", prv=" + prv + ", img=" + img + "]";
	}
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public int getUp() {
		return up;
	}
	public void setUp(int up) {
		this.up = up;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public MultipartFile getUpload_img1() {
		return upload_img1;
	}
	public void setUpload_img1(MultipartFile upload_img1) {
		this.upload_img1 = upload_img1;
	}
	public MultipartFile getUpload_img2() {
		return upload_img2;
	}
	public void setUpload_img2(MultipartFile upload_img2) {
		this.upload_img2 = upload_img2;
	}
	public MultipartFile getUpload_img3() {
		return upload_img3;
	}
	public void setUpload_img3(MultipartFile upload_img3) {
		this.upload_img3 = upload_img3;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrv() {
		return prv;
	}
	public void setPrv(int prv) {
		this.prv = prv;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getReply_cnt() {
		return reply_cnt;
	}
	public void setReply_cnt(String reply_cnt) {
		this.reply_cnt = reply_cnt;
	}
	
	
	
}
