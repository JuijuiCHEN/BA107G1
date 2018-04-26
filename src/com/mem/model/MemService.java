package com.mem.model;

import java.util.List;

public class MemService {
	
	private MemDAO_interface dao;
	
	public MemService(){
		dao = new MemDAO();
	}
	
	public MemVO addMem(String mem_acc,String mem_pw,String mem_name,String mem_email,String mem_addr,String mem_tel,String mem_status,String mem_sex,String mem_introduction,String mem_exp_owner){
		MemVO memVO = new MemVO();
		
		memVO.setMem_acc(mem_acc);
		memVO.setMem_pw(mem_pw);
		memVO.setMem_name(mem_name);
		memVO.setMem_email(mem_email);
		memVO.setMem_addr(mem_addr);
		memVO.setMem_tel(mem_tel);
		memVO.setMem_status(mem_status);
		memVO.setMem_sex(mem_sex);
		memVO.setMem_introduction(mem_introduction);
		memVO.setMem_exp_owner(mem_exp_owner);
		dao.insert(memVO);
		return memVO;
	}
	
	public MemVO updateMem(String mem_id,String mem_acc,String mem_pw,String mem_name,String mem_email,String mem_addr,String mem_tel,String mem_sex,byte[] mem_file,String mem_status,java.sql.Date mem_rgdate,String mem_introduction,String mem_exp_owner){
		MemVO memVO = new MemVO();
		
		memVO.setMem_id(mem_id);
		memVO.setMem_acc(mem_acc);
		memVO.setMem_pw(mem_pw);
		memVO.setMem_name(mem_name);
		memVO.setMem_email(mem_email);
		memVO.setMem_addr(mem_addr);
		memVO.setMem_tel(mem_tel);
		memVO.setMem_sex(mem_sex);
		memVO.setMem_file(mem_file);
		memVO.setMem_status(mem_status);
		memVO.setMem_rgdate(mem_rgdate);
		memVO.setMem_introduction(mem_introduction);
		memVO.setMem_exp_owner(mem_exp_owner);
		
		dao.update(memVO);
		return memVO;
	}
	
	public MemVO getOneMemID(String mem_id){
		return dao.findByPrimaryKey(mem_id);
	}
	public MemVO getOneMem(String mem_acc){
		return dao.login(mem_acc);
	}
	
	public List<MemVO> getAll(){
		return dao.getAll();
	}
	
	public boolean checkLogin(String mem_acc,String mem_pw){
		return dao.checkLogin(mem_acc, mem_pw);
	}

	//new add
	public void updatemypage(String introduction, String mem_id){
		dao.updateIntrd(introduction, mem_id);
	}
}

