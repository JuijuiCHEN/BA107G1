package com.guideImg.model;

import java.util.List;

public interface GuideImgDAO_interface {
	public void insert(GuideImgVO guideImgVO);

	// public void update(GuideImgVO guideImgVO);

	public void delete(String guideImgId);

	public GuideImgVO findByPrimaryKey(String guideImgId);

	public List<String> getAllImgFromId(String guideId);

	// public List<GuideImgVO> oneIdGetAll(String guideId);

}
