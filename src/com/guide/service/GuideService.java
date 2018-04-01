package com.guide.service;

import java.util.ArrayList;
import java.util.List;

import com.guide.model.GuideDAO;
import com.guide.model.GuideIndexVO;

public class GuideService {
	public static final String[] TEMPLATEARR = { "big", "small1", "small2", "small1", "small2", "small1", "small2",
			"big", "small1", "small2" };

	// 首頁的方法
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
		if (template.equals("big")) {
			result = "<div class=\"col-md-6\">" + "<div class=\"col-md-12 space-2\">"
					+ "<div class=\"guidebook-menu__card guidebook-index-page__card\">"
					+ "<div class=\"guidebook-nav-card responsive-large\"" + "style=\"background-image: url("
					+ contextPath + "/guideImg.do?action=findByPrimaryKey&guideImgId=" + guideIndexVO.getGuideImgId()
					+ ")\">" + "<div style=\"position: absolute\">" + "<div class=\"guidebook-nav-card__text-wrapper\">"
					+ "<a class=\"link-reset\" href=\"/things-to-do/san-francisco\">"
					+ "<h4 class=\"guidebook-nav-card__title\">" + guideIndexVO.getGuideArea() + "</h4>" + "</a>"
					+ "<div class=\"guidebook-nav-card__host-recommendation\">" + "<span>"
					+ guideIndexVO.getGuideReadSize() + "個人喜歡</span>" + "</div>" + "</div>" + "</div>"
					+ "<a href=\"/things-to-do/san-francisco\""
					+ "class=\"guidebook-nav-card__button-overlay col-sm-12\"></a>" + "</div>" + "</div>" + "</div>"
					+ "</div>";
		} else if (template.equals("small1") || template.equals("small2")) {
			if (template.equals("small1")) {
				result = "<div class=\"col-md-3\">";
			}
			result = result + "<div class=\"col-md-12 col-sm-6 space-2\">"
					+ "<div class=\"guidebook-menu__card guidebook-index-page__card\">"
					+ "<div class=\"guidebook-nav-card responsive-small\"" + "style=\"background-image: url("
					+ contextPath + "/guideImg.do?action=findByPrimaryKey&guideImgId=" + guideIndexVO.getGuideImgId()
					+ ")\">" + "<div style=\"position: absolute\">" + "<div class=\"guidebook-nav-card__text-wrapper\">"
					+ "<a class=\"link-reset\" href=\"/things-to-do/new-york\">"
					+ "<h4 class=\"guidebook-nav-card__title\">" + guideIndexVO.getGuideArea() + "</h4>" + "</a>"
					+ "<div class=\"guidebook-nav-card__host-recommendation\">" + "<span>"
					+ guideIndexVO.getGuideReadSize() + "個人喜歡</span>" + "</div>" + "</div>" + "</div>"
					+ "<a href=\"/things-to-do/new-york\""
					+ "class=\"guidebook-nav-card__button-overlay col-sm-12\"></a>" + "</div>" + "</div>" + "</div>";
			if (next != true || template.equals("small2")) {
				result = result + "</div>";
			}
		}
		return result;
	}

	public static void main(String[] args) {
		for (int i = 0; i < 16; i++) {
			// 是大的還是小的
			String template = "";
			template = TEMPLATEARR[i % 10];
			System.out.println(template);
		}
	}
}
