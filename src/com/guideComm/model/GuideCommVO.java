package com.guideComm.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class GuideCommVO implements Serializable {
	private String commId;
	private String guideId;
	private String memId;
	private String commContent;
	private Timestamp guideCommTime;
	private Integer commStatus;

	public GuideCommVO() {
	}

	public String getCommId() {
		return commId;
	}

	public void setCommId(String commId) {
		this.commId = commId;
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

	public String getCommContent() {
		return commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	public Timestamp getGuideCommTime() {
		return guideCommTime;
	}

	public void setGuideCommTime(Timestamp guideCommTime) {
		this.guideCommTime = guideCommTime;
	}

	public Integer getCommStatus() {
		return commStatus;
	}

	public void setCommStatus(Integer commStatus) {
		this.commStatus = commStatus;
	}

	@Override
	public String toString() {
		return "GuideCommVO [commId=" + commId + ", guideId=" + guideId + ", memId=" + memId + ", commContent="
				+ commContent + ", guideCommTime=" + guideCommTime + ", commStatus=" + commStatus + "]";
	}

}
