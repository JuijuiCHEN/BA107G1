package com.guide.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import com.guideImg.model.GuideImgVO;

public class GuideVO implements Serializable {
	private String guideId;
	private String memId;
	private String guideContent;
	private Timestamp guideCreateTime;
	private String guideTitle;
	private Integer guideReadSize;
	private Integer guideCommSize;
	private Integer guideVoteSize;
	private Integer guideStatus;
	private String guideArea;
	private String guideMap;
	private List<GuideImgVO> guideImgList;

	public GuideVO() {
	}

	public String getGuideId() {
		return guideId;
	}

	public void setGuideId(String guideId) {
		this.guideId = guideId;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getGuideContent() {
		return guideContent;
	}

	public void setGuideContent(String guideContent) {
		this.guideContent = guideContent;
	}

	public Timestamp getGuideCreateTime() {
		return guideCreateTime;
	}

	public void setGuideCreateTime(Timestamp guideCreateTime) {
		this.guideCreateTime = guideCreateTime;
	}

	public String getGuideTitle() {
		return guideTitle;
	}

	public void setGuideTitle(String guideTitle) {
		this.guideTitle = guideTitle;
	}

	public Integer getGuideReadSize() {
		return guideReadSize;
	}

	public void setGuideReadSize(Integer guideReadSize) {
		this.guideReadSize = guideReadSize;
	}

	public Integer getGuideCommSize() {
		return guideCommSize;
	}

	public void setGuideCommSize(Integer guideCommSize) {
		this.guideCommSize = guideCommSize;
	}

	public Integer getGuideVoteSize() {
		return guideVoteSize;
	}

	public void setGuideVoteSize(Integer guideVoteSize) {
		this.guideVoteSize = guideVoteSize;
	}

	public Integer getGuideStatus() {
		return guideStatus;
	}

	public void setGuideStatus(Integer guideStatus) {
		this.guideStatus = guideStatus;
	}

	public String getGuideArea() {
		return guideArea;
	}

	public void setGuideArea(String guideArea) {
		this.guideArea = guideArea;
	}

	public String getGuideMap() {
		return guideMap;
	}

	public void setGuideMap(String guideMap) {
		this.guideMap = guideMap;
	}

	public List<GuideImgVO> getGuideImgList() {
		return guideImgList;
	}

	public void setGuideImgList(List<GuideImgVO> guideImgList) {
		this.guideImgList = guideImgList;
	}

	@Override
	public String toString() {
		return "GuideVO [guideId=" + guideId + ", memId=" + memId + ", guideContent=" + guideContent
				+ ", guideCreateTime=" + guideCreateTime + ", guideTitle=" + guideTitle + ", guideReadSize="
				+ guideReadSize + ", guideCommSize=" + guideCommSize + ", guideVoteSize=" + guideVoteSize
				+ ", guideStatus=" + guideStatus + ", guideArea=" + guideArea + ", guideMap=" + guideMap
				+ ", guideImgList=" + guideImgList + "]";
	}

}
