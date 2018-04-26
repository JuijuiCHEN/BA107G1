package com.mem.model;

import java.util.*;

public interface MemDAO_interface {
	//�s�W(���U)�b��
	public void insert(MemVO memVO);
	//��ݭק�
	public void update(MemVO memVO);
	//�d�@�ӷ|��
	public MemVO findByPrimaryKey(String mem_id);
	//������
	public List<MemVO> getAll();
	//�n�J�P�_
	public boolean checkLogin(String mem_acc, String mem_pw);
	//�n�J�b�����XVO���
	public MemVO login(String mem_acc);
	//new add
	public void updateIntrd(String introduction, String mem_id);
}
