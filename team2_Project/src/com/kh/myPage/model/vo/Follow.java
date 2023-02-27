package com.kh.myPage.model.vo;

public class Follow {
	private int followNo;
	private String followingId;
	private String followerId;
	
	public Follow() {
		
	}

	
	
	
	public Follow(int followNo, String followingId, String followerId) {
		super();
		this.followNo = followNo;
		this.followingId = followingId;
		this.followerId = followerId;
	}

	


	public int getFollowNo() {
		return followNo;
	}

	public void setFollowNo(int followNo) {
		this.followNo = followNo;
	}

	public String getFollowingId() {
		return followingId;
	}

	public void setFollowingId(String followingId) {
		this.followingId = followingId;
	}

	public String getFollowerId() {
		return followerId;
	}

	public void setFollowerId(String followerId) {
		this.followerId = followerId;
	}

	@Override
	public String toString() {
		return "Follow [followNo=" + followNo + ", followingId=" + followingId + ", followerId=" + followerId + "]";
	}

	
	
	
	}
