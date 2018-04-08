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

	// �s�W���n�]�t��
	public void addGuide(String memId, String guideTitle, String guideContent, String guideArea, String guideMap,
			String guideLatLng, List<GuideImgVO> imgList) {
		GuideVO guideVO = new GuideVO();
		guideVO.setMemId(memId);
		guideVO.setGuideTitle(guideTitle);
		guideVO.setGuideContent(guideContent);
		guideVO.setGuideArea(guideArea);
		guideVO.setGuideMap(guideMap);
		guideVO.setGuideLatLng(guideLatLng);
		guideDao.insert(guideVO, imgList); // ���Ƶ�dao�h�s�W�峹, �H�ιϤ�list�a�L�h

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

		/*************************** 3.�R���Ӥ峹�Ҧ��d�� ***************************************/
		GuideCommVO guideCommVO = new GuideCommVO();
		guideCommVO.setGuideId(guideId);
		guideCommDAO.deleteAll(guideId);

		/*************************** 4.�H�W�������~��R���峹 ***************************************/
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

	// ����@�Ӧa�ϩҦ��峹�C��
	public List<GuideVO> getAllGuideFromArea(String guideArea) {
		return guideDao.getAllGuideFromArea(guideArea);
	}

	public static final String[] TEMPLATEARR = { "big", "small1", "small2", "small1", "small2", "small1", "small2",
			"big", "small1", "small2" };

	// �H�U���O��������k
	public static List<String> getGuideIndexVO(String contextPath) {
		GuideDAO guideDAO = new GuideDAO();
		List<String> indexTemplate = new ArrayList<String>();
		List<String> guideAreaList = guideDAO.getAllArea(); // ����Ҧ������Ʀa��
		System.out.println(guideAreaList);
		// �j��]�Ҧ�(������)�a��, ����U�a�ϳ̰��X�ݶq���@�g���Ĥ@�����(���]�t�X�ݶq.�a��.�Ĥ@���Ϥ�id), add�iguideIndexVOList
		for (int i = 0; i < guideAreaList.size(); i++) {
			// �O�j���٬O�p��
			String template = TEMPLATEARR[i % 10];
			Boolean next = true;
			// �p�G�O�̫�@�ӥ��M�ndiv����
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
					+ guideIndexVO.getGuideReadSize() + "�ӤH���w</span>" + "</div>" + "</div>" + "</div>" + "<a href=\""
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
					+ guideIndexVO.getGuideReadSize() + "�ӤH���w</span>" + "</div>" + "</div>" + "</div>" + "<a href=\""
					+ contextPath + "/guide.do?action=getOne_Area&guideArea=" + areaUrl + "\""
					+ "class=\"guidebook-nav-card__button-overlay col-sm-12\"></a>" + "</div>" + "</div>" + "</div>";
			if (next != true || template.equals("small2")) {
				result = result + "</div>";
			}
		}
		return result;
	}

}
