package com.guideComm.model;

import java.util.List;

public interface GuideCommDAO_interface {

	public void insert(GuideCommVO guideCommVO);

	public void update(GuideCommVO guideCommVO);

	public void delete(String commId);

	public GuideCommVO findByPrimaryKey(String commId);

	// 查詢一篇文章所有留言
	public List<GuideCommVO> getAllFromGuideId(String guideId);

	public void deleteAll(String guideId);

}
