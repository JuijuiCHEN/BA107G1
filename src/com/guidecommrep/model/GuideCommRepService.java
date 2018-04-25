package com.guidecommrep.model;

import java.util.List;

public class GuideCommRepService {

	private GuideCommRepDAO_interface dao;

	public GuideCommRepService() {
		dao = new GuideCommRepDAO();
	}

	public GuideCommRepVO addGuideCommRep(String comm_id, String mem_id, String guide_comm_rep_content) {

		GuideCommRepVO guideCommRepVO = new GuideCommRepVO();
		guideCommRepVO.setComm_id(comm_id);
		guideCommRepVO.setMem_id(mem_id);
		guideCommRepVO.setGuide_comm_rep_content(guide_comm_rep_content);

		dao.insert(guideCommRepVO);
		return guideCommRepVO;
	}

	public GuideCommRepVO updateGuideCommRep(String g_comm_rep_id, String guide_comm_rep_status) {
		GuideCommRepVO guideCommRepVO = new GuideCommRepVO();

		guideCommRepVO.setG_comm_rep_id(g_comm_rep_id);
		guideCommRepVO.setGuide_comm_rep_status(guide_comm_rep_status);

		dao.update(guideCommRepVO);

		return guideCommRepVO;
	}

	public void deleteGuideCommRep(String g_comm_rep_id) {
		dao.delete(g_comm_rep_id);
	}

	public GuideCommRepVO getOneGuideCommRep(String g_comm_rep_id) {
		return dao.findByPrimaryKey(g_comm_rep_id);
	}

	public List<GuideCommRepVO> getAll() {
		return dao.getAll();
	}

	public List<GuideCommRepVO> getAllStatus(String guide_comm_rep_status) {
		return dao.getAllStatus(guide_comm_rep_status);
	}

}
