package com.guideImg.model;

import java.io.Serializable;

public class GuideImgVO implements Serializable {
	private String guideImgId;
	private String guideId;
	private byte[] guideImgContent;

	public GuideImgVO() {
	}

	public String getGuideImgId() {
		return guideImgId;
	}

	public void setGuideImgId(String guideImgId) {
		this.guideImgId = guideImgId;
	}

	public String getGuideId() {
		return guideId;
	}

	public void setGuideId(String guideId) {
		this.guideId = guideId;
	}

	public byte[] getGuideImgContent() {
		return guideImgContent;
	}

	public void setGuideImgContent(byte[] guideImgContent) {
		this.guideImgContent = guideImgContent;
	}

}
