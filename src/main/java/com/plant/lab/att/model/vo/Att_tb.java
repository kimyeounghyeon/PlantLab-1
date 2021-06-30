package com.plant.lab.att.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class Att_tb implements java.io.Serializable{
	private static final long serialVersionUID = 20001L;

	private int user_no;
	private Date att_date;
	
	@Override
	public String toString() {
		return "Att_tb [user_no=" + user_no + ", att_date=" + att_date + "]";
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public Date getAtt_date() {
		return att_date;
	}
	public void setAtt_date(Date att_date) {
		this.att_date = att_date;
	}
	
}
