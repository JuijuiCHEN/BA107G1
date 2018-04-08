package com.guideImg.model;

import java.sql.Connection;
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

	// 新增文章後新增圖片, 在同一條連線進行
	public void addGuideImgList(String guideId, List<GuideImgVO> imgList, Connection con) {
		guideImgDao.insertList(guideId, imgList, con);
	}

	public void deleteGuideImg(String guideImgId) {
		guideImgDao.delete(guideImgId);
	}

	public GuideImgVO getOneGuideImg(String guideImgId) {
		return guideImgDao.findByPrimaryKey(guideImgId);
	}

	// 從一篇文章拿到所有圖片
	public List<String> getAllImgFromId(String guideId) {
		return guideImgDao.getAllImgFromId(guideId);
	}

}
