package com.guide.model;

import java.util.List;

public interface GuideDAO_interface {

	public void insert(GuideVO guideVO);

	public void updateFront(GuideVO guideVO);

	public void updateBack(GuideVO guideVO);

	public void delete(String guideId);

	public GuideVO findByPrimaryKey(String guideId);

	public List<GuideVO> getAllFromOneId(String memId);

	public List<String> getAllArea(); // 取得指南裡不重複地區

	public GuideIndexVO getGuideIndexVO(String guideArea); // 使用傳入地區, 取得指南首頁所需資訊

}
