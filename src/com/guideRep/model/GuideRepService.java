package com.guideRep.model;

import java.util.List;

import com.guide.model.GuideDAO;
import com.guide.model.GuideDAO_interface;
import com.guide.model.GuideVO;

public class GuideRepService {

	private GuideRepDAO_interface guideRepDAO;
	private GuideDAO_interface guideDAO;

	public GuideRepService() {
		guideRepDAO = new GuideRepDAO();
		guideDAO = new GuideDAO();

	}

	public void addGuideRep(String guideId, String memId, String guideRepContent) {
		GuideRepVO guideRepVO = new GuideRepVO();
		guideRepVO.setGuideId(guideId);
		guideRepVO.setMemId(memId);
		guideRepVO.setGuideRepContent(guideRepContent);
		guideRepDAO.insert(guideRepVO);

	}

	public void update(String guideRepId, Integer guideRepStatus, String guideId) {
		GuideRepVO guideRepVO = new GuideRepVO();
		guideRepVO.setGuideRepId(guideRepId);
		guideRepVO.setGuideRepStatus(guideRepStatus);
		guideRepDAO.update(guideRepVO);

		GuideVO guideVO = new GuideVO();
		guideVO.setGuideId(guideId);
		if (guideRepStatus == 3) { // 如果檢舉狀態為有效
			guideVO.setGuideStatus(1); // 文章狀態
		} else {
			guideVO.setGuideStatus(2);
		}
		guideDAO.updateBack(guideVO);

	}

	public List<GuideRepVO> getAllStatus(Integer guideRepStatus) {
		return guideRepDAO.getAllStatus(guideRepStatus);
	}

	public GuideRepVO getOneGuideRep(String guideRepId) {
		return guideRepDAO.findByPrimaryKey(guideRepId);
	}

}
