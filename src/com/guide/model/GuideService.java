package com.guide.model;

import java.util.List;

import com.guideImg.model.GuideImgDAO;
import com.guideImg.model.GuideImgDAO_interface;
import com.guideImg.model.GuideImgVO;

public class GuideService {

	private GuideDAO_interface guideDao;
	private GuideImgDAO_interface guideImgDAO;

	public GuideService() {
		guideDao = new GuideDAO();
		guideImgDAO = new GuideImgDAO();
	}

	// �s�W���n���]�t��
	public GuideVO addGuide(String memId, String guideTitle, String guideContent, String guideArea, String guideMap) {

		GuideVO guideVO = new GuideVO();

		guideVO.setMemId(memId);
		guideVO.setGuideTitle(guideTitle);
		guideVO.setGuideContent(guideContent);
		guideVO.setGuideArea(guideArea);
		guideVO.setGuideMap(guideMap);

		guideDao.insert(guideVO);

		return guideVO;
	}

	// �d�ߤ@�g�峹�]�t��
	public GuideVO getOneGuide(String guideId) {
		return guideDao.findByPrimaryKey(guideId);
	}

	// �R���峹�]�t��
	public void deleteGuide(String guideId) {

		/*************************** 1.�d�ߤ峹���U���Ҧ��Ϥ� ***************************************/
		// ����@�g�峹�Ҧ��Ϥ�pk��list
		GuideImgVO guideImgVO = new GuideImgVO();
		guideImgVO.setGuideId(guideId);
		List<String> ImgList = guideImgDAO.getAllImgFromId(guideId);

		/*************************** 2.�R���峹���U���Ҧ��Ϥ� ***************************************/
		// �j��]�C�@�ӹϤ�pk�R���Ϥ�
		for (int i = 0; i < ImgList.size(); i++) {
			guideImgDAO.delete(ImgList.get(i));
		}

		/*************************** 3.�H�W�������~��R���峹 ***************************************/
		guideDao.delete(guideId);
		System.out.println("Svc�R�����\");
	}

	// ��x�޲z�H���ק�峹���A
	public GuideVO updateGuideBack(Integer guideStatus, String guideId) {

		GuideVO guideVO = new GuideVO();

		guideVO.setGuideStatus(guideStatus);
		guideVO.setGuideId(guideId);
		guideDao.updateBack(guideVO);

		return guideVO;
	}

	// �e�x�ϥΪ̭ק�峹���D.���e
	public GuideVO updateGuideFront(String guideTitle, String guideContent, String guideId) {

		GuideVO guideVO = new GuideVO();

		guideVO.setGuideTitle(guideTitle);
		guideVO.setGuideContent(guideContent);
		guideVO.setGuideId(guideId);
		guideDao.updateFront(guideVO);

		return guideVO;
	}

	// ����@�ӷ|���Ҧ��峹�C��
	public List<GuideVO> getAllFromOneId(String memId) {
		return guideDao.getAllFromOneId(memId);
	}

}
