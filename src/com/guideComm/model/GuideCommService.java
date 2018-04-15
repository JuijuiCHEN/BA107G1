package com.guideComm.model;

import java.util.List;

import com.guide.model.GuideDAO;
import com.guide.model.GuideDAO_interface;

public class GuideCommService {

	private GuideCommDAO_interface guideCommDao;
	private GuideDAO_interface guideDao;

	public GuideCommService() {
		guideCommDao = new GuideCommDAO();
		guideDao = new GuideDAO();
	}

	public List<GuideCommVO> getAllFromGuideId(String guideId) {
		return guideCommDao.getAllFromGuideId(guideId);
	}

	public void deleteAll(String guideId) {
		guideCommDao.deleteAll(guideId);
	}

	public void addComm(GuideCommVO guideCommVO) {
		guideCommDao.insert(guideCommVO);
	}

}
