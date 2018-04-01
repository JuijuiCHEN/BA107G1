package com.guideImg.model;

import java.util.List;

public class GuideImgService {

	private GuideImgDAO_interface guideImgDao;

	public GuideImgService() {
		guideImgDao = new GuideImgDAO();
	}

	public GuideImgVO addGuideImg(String guideId, byte[] guideImgContent) {

		GuideImgVO guideImgVO = new GuideImgVO();

		guideImgVO.setGuideId(guideId);
		guideImgVO.setGuideImgContent(guideImgContent);

		guideImgDao.insert(guideImgVO);

		return guideImgVO;

	}

	public void deleteGuideImg(String guideImgId) {
		guideImgDao.delete(guideImgId);
	}

	public GuideImgVO getOneGuideImg(String guideImgId) {
		return guideImgDao.findByPrimaryKey(guideImgId);
	}

	public List<String> getAllImgFromId(String guideId) {
		return guideImgDao.getAllImgFromId(guideId);
	}

}
