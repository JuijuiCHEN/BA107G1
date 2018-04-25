package com.guidecommrep.model;

import java.sql.Date;

public class GuideCommRepVO {
	private String g_comm_rep_id;
	private String comm_id;
	private String mem_id;
	private Date guide_comm_rep_date;
	private String guide_comm_rep_content;
	private String guide_comm_rep_status;
	
	public GuideCommRepVO(){
		super();
	}
	
	public String getG_comm_rep_id() {
		return g_comm_rep_id;
	}
	public void setG_comm_rep_id(String g_comm_rep_id) {
		this.g_comm_rep_id = g_comm_rep_id;
	}
	public String getComm_id() {
		return comm_id;
	}
	public void setComm_id(String comm_id) {
		this.comm_id = comm_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Date getGuide_comm_rep_date() {
		return guide_comm_rep_date;
	}
	public void setGuide_comm_rep_date(Date guide_comm_rep_date) {
		this.guide_comm_rep_date = guide_comm_rep_date;
	}
	public String getGuide_comm_rep_content() {
		return guide_comm_rep_content;
	}
	public void setGuide_comm_rep_content(String guide_comm_rep_content) {
		this.guide_comm_rep_content = guide_comm_rep_content;
	}
	public String getGuide_comm_rep_status() {
		return guide_comm_rep_status;
	}
	public void setGuide_comm_rep_status(String guide_comm_rep_status) {
		this.guide_comm_rep_status = guide_comm_rep_status;
	}
	
	
	
}