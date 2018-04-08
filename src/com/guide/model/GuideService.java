package com.guide.model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import com.guideComm.model.GuideCommDAO;
import com.guideComm.model.GuideCommDAO_interface;
import com.guideComm.model.GuideCommVO;
import com.guideImg.model.GuideImgDAO;
import com.guideImg.model.GuideImgDAO_interface;
import com.guideImg.model.GuideImgVO;

public class GuideService {

	private GuideDAO_interface guideDao;
	private GuideImgDAO_interface guideImgDAO;
	private GuideCommDAO_interface guideCommDAO;

	public GuideService() {
		guideDao = new GuideDAO();
		guideImgDAO = new GuideImgDAO();
		guideCommDAO = new GuideCommDAO();

	}

	// 新增指南包含圖
	public void addGuide(String memId, String guideTitle, String guideContent, String guideArea, String guideMap,
			String guideLatLng, List<GuideImgVO> imgList) {
		GuideVO guideVO = new GuideVO();
		guideVO.setMemId(memId);
		guideVO.setGuideTitle(guideTitle);
		guideVO.setGuideContent(guideContent);
		guideVO.setGuideArea(guideArea);
		guideVO.setGuideMap(guideMap);
		guideVO.setGuideLatLng(guideLatLng);
		guideDao.insert(guideVO, imgList); // 把資料給dao去新增文章, 以及圖片list帶過去

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

		/*************************** 3.刪除該文章所有留言 ***************************************/
		GuideCommVO guideCommVO = new GuideCommVO();
		guideCommVO.setGuideId(guideId);
		guideCommDAO.deleteAll(guideId);

		/*************************** 4.以上都完成才能刪除文章 ***************************************/
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

	// 拿到一個地區所有文章列表
	public List<GuideVO> getAllGuideFromArea(String guideArea) {
		return guideDao.getAllGuideFromArea(guideArea);
	}

	public static final String[] TEMPLATEARR = { "big", "small1", "small2", "small1", "small2", "small1", "small2",
			"big", "small1", "small2" };

	// 以下都是首頁的方法
	public static List<String> getGuideIndexVO(String contextPath) {
		GuideDAO guideDAO = new GuideDAO();
		List<String> indexTemplate = new ArrayList<String>();
		List<String> guideAreaList = guideDAO.getAllArea(); // 拿到所有不重複地區
		System.out.println(guideAreaList);
		// 迴圈跑所有(不重複)地區, 拿到各地區最高訪問量那一篇的第一個欄位(欄位包含訪問量.地區.第一章圖片id), add進guideIndexVOList
		for (int i = 0; i < guideAreaList.size(); i++) {
			// 是大的還是小的
			String template = TEMPLATEARR[i % 10];
			Boolean next = true;
			// 如果是最後一個必然要div結尾
			if (i == guideAreaList.size() - 1) {
				next = false;
			}
			indexTemplate.add(atuoHtml(guideDAO.getGuideIndexVO(guideAreaList.get(i)), template, contextPath, next));
		}
		return indexTemplate;
	}

	static String atuoHtml(GuideIndexVO guideIndexVO, String template, String contextPath, Boolean next) {
		String result = "";
		String areaUrl;
		try {
			areaUrl = URLEncoder.encode(guideIndexVO.getGuideArea(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			areaUrl = "";
		}
		if (template.equals("big")) {
			result = "<div class=\"col-md-6\">" + "<div class=\"col-md-12 space-2\">"
					+ "<div class=\"guidebook-menu__card guidebook-index-page__card\">"
					+ "<div class=\"guidebook-nav-card responsive-large\"" + "style=\"background-image: url("
					+ contextPath + "/guideImg.do?action=getOne_For_Display&guideImgId=" + guideIndexVO.getGuideImgId()
					+ ")\">" + "<div style=\"position: absolute\">" + "<div class=\"guidebook-nav-card__text-wrapper\">"
					+ "<a class=\"link-reset\" href=\"" + contextPath + "/guide.do?action=getOne_Area&guideArea="
					+ areaUrl + "\">" + "<h4 class=\"guidebook-nav-card__title\">" + guideIndexVO.getGuideArea()
					+ "</h4>" + "</a>" + "<div class=\"guidebook-nav-card__host-recommendation\">" + "<span>"
					+ guideIndexVO.getGuideReadSize() + "個人喜歡</span>" + "</div>" + "</div>" + "</div>" + "<a href=\""
					+ contextPath + "/guide.do?action=getOne_Area&guideArea=" + areaUrl + "\""
					+ "class=\"guidebook-nav-card__button-overlay col-sm-12\"></a>" + "</div>" + "</div>" + "</div>"
					+ "</div>";
		} else if (template.equals("small1") || template.equals("small2")) {
			if (template.equals("small1")) {
				result = "<div class=\"col-md-3\">";
			}
			result = result + "<div class=\"col-md-12 col-sm-6 space-2\">"
					+ "<div class=\"guidebook-menu__card guidebook-index-page__card\">"
					+ "<div class=\"guidebook-nav-card responsive-small\"" + "style=\"background-image: url("
					+ contextPath + "/guideImg.do?action=getOne_For_Display&guideImgId=" + guideIndexVO.getGuideImgId()
					+ ")\">" + "<div style=\"position: absolute\">" + "<div class=\"guidebook-nav-card__text-wrapper\">"
					+ "<a class=\"link-reset\" href=\"" + contextPath + "/guide.do?action=getOne_Area&guideArea="
					+ areaUrl + "\">" + "<h4 class=\"guidebook-nav-card__title\">" + guideIndexVO.getGuideArea()
					+ "</h4>" + "</a>" + "<div class=\"guidebook-nav-card__host-recommendation\">" + "<span>"
					+ guideIndexVO.getGuideReadSize() + "個人喜歡</span>" + "</div>" + "</div>" + "</div>" + "<a href=\""
					+ contextPath + "/guide.do?action=getOne_Area&guideArea=" + areaUrl + "\""
					+ "class=\"guidebook-nav-card__button-overlay col-sm-12\"></a>" + "</div>" + "</div>" + "</div>";
			if (next != true || template.equals("small2")) {
				result = result + "</div>";
			}
		}
		return result;
	}

}
