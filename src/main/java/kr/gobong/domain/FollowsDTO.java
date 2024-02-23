package kr.gobong.domain;

import lombok.Data;

@Data
public class FollowsDTO {

	private String id;
	private String following_id;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFollowing_id() {
		return following_id;
	}
	public void setFollowing_id(String following_id) {
		this.following_id = following_id;
	}
	@Override
	public String toString() {
		return "FollowsDTO [id=" + id + ", following_id=" + following_id + "]";
	}
	
}
