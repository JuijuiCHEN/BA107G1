package com.mem.model;

import java.sql.Date;

public class MemVO implements java.io.Serializable{
	private String mem_id;
	private String mem_acc;
	private String mem_pw;
	private String mem_name;
	private String mem_email;
	private String mem_addr;
	private String mem_tel;
	private String mem_status;
	private Date mem_rgdate;
	private byte[] mem_file;
	private String mem_sex;
	private String mem_introduction;
	private String mem_room_owner;
	private String mem_exp_owner;
	
	public byte[] getMem_file() {
		return mem_file;
	}
	public void setMem_file(byte[] mem_file) {
		this.mem_file = mem_file;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_acc() {
		return mem_acc;
	}
	public void setMem_acc(String mem_acc) {
		this.mem_acc = mem_acc;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}

	public String getMem_status() {
		return mem_status;
	}
	public void setMem_status(String mem_status) {
		this.mem_status = mem_status;
	}
	public Date getMem_rgdate() {
		return mem_rgdate;
	}
	public void setMem_rgdate(Date mem_rgdate) {
		this.mem_rgdate = mem_rgdate;
	}
	public String getMem_sex() {
		return mem_sex;
	}
	public void setMem_sex(String mem_sex) {
		this.mem_sex = mem_sex;
	}
	public String getMem_introduction() {
		return mem_introduction;
	}
	public void setMem_introduction(String mem_introduction) {
		this.mem_introduction = mem_introduction;
	}
	public String getMem_room_owner() {
		return mem_room_owner;
	}
	public void setMem_room_owner(String mem_room_owner) {
		this.mem_room_owner = mem_room_owner;
	}
	public String getMem_exp_owner() {
		return mem_exp_owner;
	}
	public void setMem_exp_owner(String mem_exp_owner) {
		this.mem_exp_owner = mem_exp_owner;
	}

	
	
}
