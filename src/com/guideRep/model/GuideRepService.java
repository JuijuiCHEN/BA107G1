package com.guideRep.model;

import java.util.List;

public class GuideRepService {

	private GuideRepDAO_interface guideRepDAO;

	public GuideRepService() {
		guideRepDAO = new GuideRepDAO();

	}

	public void addGuideRep(String guideId, String memId, String guideRepContent) {
		GuideRepVO guideRepVO = new GuideRepVO();
		guideRepVO.setGuideId(guideId);
		guideRepVO.setMemId(memId);
		guideRepVO.setGuideRepContent(guideRepContent);
		guideRepDAO.insert(guideRepVO);

	}

	public void update(String guideRepId, Integer guideRepStatus) {
		GuideRepVO guideRepVO = new GuideRepVO();
		guideRepVO.setGuideRepId(guideRepId);
		guideRepVO.setGuideRepStatus(guideRepStatus);
		guideRepDAO.update(guideRepVO);
	}

	public List<GuideRepVO> getAllStatus1() {
		return guideRepDAO.getAllStatus1();
	}

	public GuideRepVO getOneGuideRep(String guideRepId) {
		return guideRepDAO.findByPrimaryKey(guideRepId);
	}

}
