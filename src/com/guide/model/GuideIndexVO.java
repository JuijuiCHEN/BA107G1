package com.guide.model;

import java.io.Serializable;

// 包裝首頁會顯示的內容(包含單一圖片.地區.訪問量)
public class GuideIndexVO implements Serializable {
	private String guideImgId;
	private String guideArea;
	private Integer guideReadSize;

	public String getGuideImgId() {
		return guideImgId;
	}

	public void setGuideImgId(String guideImgId) {
		this.guideImgId = guideImgId;
	}

	public String getGuideArea() {
		return guideArea;
	}

	public void setGuideArea(String guideArea) {
		this.guideArea = guideArea;
	}

	public Integer getGuideReadSize() {
		return guideReadSize;
	}

	public void setGuideReadSize(Integer guideReadSize) {
		this.guideReadSize = guideReadSize;
	}

}
