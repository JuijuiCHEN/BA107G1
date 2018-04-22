package com.lineBot.model;

public class SourceModel {

	private String type;
	private String userId;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "SourceModel [type=" + type + ", userId=" + userId + "]";
	}

}
