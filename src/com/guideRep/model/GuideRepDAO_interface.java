package com.guideRep.model;

import java.util.List;

public interface GuideRepDAO_interface {
	public void insert(GuideRepVO guideRepVO);

	public void update(GuideRepVO guideRepVO);

	public void delete(String guideRepId);

	public GuideRepVO findByPrimaryKey(String guideRepId);

	public List<GuideRepVO> getAllStatus(Integer guideRepStatus); // 查詢所有被檢舉文章

}
