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

	// �s�W�峹��s�W�Ϥ�, �b�P�@���s�u�i��
	public void addGuideImgList(String guideId, List<GuideImgVO> imgList, Connection con) {
		guideImgDao.insertList(guideId, imgList, con);
	}

	public void deleteGuideImg(String guideImgId) {
		guideImgDao.delete(guideImgId);
	}

	public GuideImgVO getOneGuideImg(String guideImgId) {
		return guideImgDao.findByPrimaryKey(guideImgId);
	}

	// �q�@�g�峹����Ҧ��Ϥ�
	public List<String> getAllImgFromId(String guideId) {
		return guideImgDao.getAllImgFromId(guideId);
	}

}
