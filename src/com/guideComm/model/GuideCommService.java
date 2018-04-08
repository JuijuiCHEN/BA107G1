package com.guideComm.model;

import java.util.List;

public class GuideCommService {

	private GuideCommDAO_interface guideCommDao;

	public GuideCommService() {
		guideCommDao = new GuideCommDAO();
	}

	public List<GuideCommVO> getAllFromGuideId(String guideId) {
		return guideCommDao.getAllFromGuideId(guideId);
	}

	public void deleteAll(String guideId) {
		guideCommDao.deleteAll(guideId);
	}
}
