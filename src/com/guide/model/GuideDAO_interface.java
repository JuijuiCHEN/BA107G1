package com.guide.model;

import java.util.List;

public interface GuideDAO_interface {

	public void insert(GuideVO guideVO);

	public void update(GuideVO guideVO);

	public void delete(String guideId);

	public GuideVO findByPrimaryKey(String guideId);

	public List<GuideVO> getAll();

}
