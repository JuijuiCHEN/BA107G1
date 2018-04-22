package com.guide.model;

import java.util.List;

import com.guideImg.model.GuideImgVO;

public interface GuideDAO_interface {

	public String insert(GuideVO guideVO, List<GuideImgVO> imgList);

	public void updateFront(GuideVO guideVO);

	public void updateBack(GuideVO guideVO);

	public void updateVote(GuideVO guideVO);

	public void updateRead(GuideVO guideVO);

	public void delete(String guideId);

	public GuideVO findByPrimaryKey(String guideId);

	public List<GuideVO> getAllFromOneId(String memId);

	public List<String> getAllArea(); // ���o���n�̤����Ʀa��

	public GuideIndexVO getGuideIndexVO(String guideArea); // �ϥζǤJ�a��, ���o���n�����һݸ�T

	public List<GuideVO> getAllGuideFromArea(String guideArea); // �ϥζǤJ�a��, ���o�Ӧa�Ҧ��峹
}
