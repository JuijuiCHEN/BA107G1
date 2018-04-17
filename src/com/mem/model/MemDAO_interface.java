package com.mem.model;

import java.util.*;

public interface MemDAO_interface {
	public void insert(MemVO memVO);
	public void update(MemVO memVO);
	public MemVO findByPrimaryKey(String mem_id);
	public List<MemVO> getAll();
	
}
