package com.guide.model;

import java.util.List;

public interface GuideDAO_interface {

	public void insert(GuideVO guideVO);

	public void updateFront(GuideVO guideVO);

	public void updateBack(GuideVO guideVO);

	public void delete(String guideId);

	public GuideVO findByPrimaryKey(String guideId);

	public List<GuideVO> getAllFromOneId(String memId);

	public List<String> getAllArea(); // ���o���n�̤����Ʀa��

	public GuideIndexVO getGuideIndexVO(String guideArea); // �ϥζǤJ�a��, ���o���n�����һݸ�T

}
