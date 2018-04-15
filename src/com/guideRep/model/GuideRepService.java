package com.guideRep.model;

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

}
