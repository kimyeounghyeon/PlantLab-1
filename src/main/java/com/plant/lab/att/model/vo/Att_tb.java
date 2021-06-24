package com.plant.lab.att.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class Att_tb implements java.io.Serializable{
	private static final long serialVersionUID = 20001L;

	private int att_no;
	private int User_No;
	private int att_cnt;
	private Date att_date;
	@Override
	public String toString() {
		return "Att_tb [att_no=" + att_no + ", User_No=" + User_No + ", att_cnt=" + att_cnt + ", att_date=" + att_date
				+ "]";
	}
	public int getAtt_no() {
		return att_no;
	}
	public void setAtt_no(int att_no) {
		this.att_no = att_no;
	}
	public int getUser_No() {
		return User_No;
	}
	public void setUser_No(int user_No) {
		User_No = user_No;
	}
	public int getAtt_cnt() {
		return att_cnt;
	}
	public void setAtt_cnt(int att_cnt) {
		this.att_cnt = att_cnt;
	}
	public Date getAtt_date() {
		return att_date;
	}
	public void setAtt_date(Date att_date) {
		this.att_date = att_date;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}