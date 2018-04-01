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

	// 新增指南不包含圖
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

	// 查詢一篇文章包含圖
	public GuideVO getOneGuide(String guideId) {
		return guideDao.findByPrimaryKey(guideId);
	}

	// 刪除文章包含圖
	public void deleteGuide(String guideId) {

		/*************************** 1.查詢文章底下的所有圖片 ***************************************/
		// 拿到一篇文章所有圖片pk的list
		GuideImgVO guideImgVO = new GuideImgVO();
		guideImgVO.setGuideId(guideId);
		List<String> ImgList = guideImgDAO.getAllImgFromId(guideId);

		/*************************** 2.刪除文章底下的所有圖片 ***************************************/
		// 迴圈跑每一個圖片pk刪除圖片
		for (int i = 0; i < ImgList.size(); i++) {
			guideImgDAO.delete(ImgList.get(i));
		}

		/*************************** 3.以上都完成才能刪除文章 ***************************************/
		guideDao.delete(guideId);
		System.out.println("Svc刪除成功");
	}

	// 後台管理人員修改文章狀態
	public GuideVO updateGuideBack(Integer guideStatus, String guideId) {

		GuideVO guideVO = new GuideVO();

		guideVO.setGuideStatus(guideStatus);
		guideVO.setGuideId(guideId);
		guideDao.updateBack(guideVO);

		return guideVO;
	}

	// 前台使用者修改文章標題.內容
	public GuideVO updateGuideFront(String guideTitle, String guideContent, String guideId) {

		GuideVO guideVO = new GuideVO();

		guideVO.setGuideTitle(guideTitle);
		guideVO.setGuideContent(guideContent);
		guideVO.setGuideId(guideId);
		guideDao.updateFront(guideVO);

		return guideVO;
	}

	// 拿到一個會員所有文章列表
	public List<GuideVO> getAllFromOneId(String memId) {
		return guideDao.getAllFromOneId(memId);
	}

}
