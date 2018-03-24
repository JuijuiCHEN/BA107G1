package com.guideRep.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class GuideRepVO implements Serializable {
	private String guideRepId;
	private String guideId;
	private String memId;
	private Timestamp guideRepDate;
	private String guideRepContent;
	private Integer guideRepStatus;

	public GuideRepVO() {
	}

	public String getGuideRepId() {
		return guideRepId;
	}

	public void setGuideRepId(String guideRepId) {
		this.guideRepId = guideRepId;
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

	public Timestamp getGuideRepDate() {
		return guideRepDate;
	}

	public void setGuideRepDate(Timestamp guideRepDate) {
		this.guideRepDate = guideRepDate;
	}

	public String getGuideRepContent() {
		return guideRepContent;
	}

	public void setGuideRepContent(String guideRepContent) {
		this.guideRepContent = guideRepContent;
	}

	public Integer getGuideRepStatus() {
		return guideRepStatus;
	}

	public void setGuideRepStatus(Integer guideRepStatus) {
		this.guideRepStatus = guideRepStatus;
	}

	@Override
	public String toString() {
		return "GuideRepVO [guideRepId=" + guideRepId + ", guideId=" + guideId + ", memId=" + memId + ", guideRepDate="
				+ guideRepDate + ", guideRepContent=" + guideRepContent + ", guideRepStatus=" + guideRepStatus + "]";
	}

}
