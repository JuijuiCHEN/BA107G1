package com.lineBot.model;

import com.alibaba.fastjson.annotation.JSONField;

public class LineBotModel {

	private String replyToken;
	private String type;
	@JSONField(name = "message") // 在JSON裡的message指定給messageModel
	private MessageModel messageModel;
	@JSONField(name = "source")
	private SourceModel sourceModel;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public MessageModel getMessageModel() {
		return messageModel;
	}

	public void setMessageModel(MessageModel messageModel) {
		this.messageModel = messageModel;
	}

	public String getReplyToken() {
		return replyToken;
	}

	public void setReplyToken(String replyToken) {
		this.replyToken = replyToken;
	}

	public SourceModel getSourceModel() {
		return sourceModel;
	}

	public void setSourceModel(SourceModel sourceModel) {
		this.sourceModel = sourceModel;
	}

	@Override
	public String toString() {
		return "LineBotModel [replyToken=" + replyToken + ", type=" + type + ", messageModel=" + messageModel
				+ ", sourceModel=" + sourceModel + "]";
	}

}
