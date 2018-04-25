package com.guidecommrep.model;

import java.util.*;



public interface GuideCommRepDAO_interface {
	public void insert (GuideCommRepVO guideCommRepVO);
	public void update (GuideCommRepVO guideCommRepVO);
	public void delete(String g_comm_rep_id);
	public GuideCommRepVO findByPrimaryKey(String g_comm_rep_id);
	public List<GuideCommRepVO> getAll();
	public List<GuideCommRepVO> getAllStatus(String guide_comm_rep_status);
}
