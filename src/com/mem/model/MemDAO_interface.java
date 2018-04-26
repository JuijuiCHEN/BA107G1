package com.mem.model;

import java.util.*;

public interface MemDAO_interface {
	//新增(註冊)帳號
	public void insert(MemVO memVO);
	//後端修改
	public void update(MemVO memVO);
	//查一個會員
	public MemVO findByPrimaryKey(String mem_id);
	//取全部
	public List<MemVO> getAll();
	//登入判斷
	public boolean checkLogin(String mem_acc, String mem_pw);
	//登入帳號撈出VO資料
	public MemVO login(String mem_acc);
	//new add
	public void updateIntrd(String introduction, String mem_id);
}
