package com.guideComm.model;

import java.util.List;

public interface GuideComm_interface {

	public void insert(GuideCommVO guideCommVO);

	public void update(GuideCommVO guideCommVO);

	public void delete(String commId);

	public GuideCommVO findByPrimaryKey(String commId);

	public List<GuideCommVO> getAll();

}
