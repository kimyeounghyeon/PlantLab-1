package com.plant.lab.monthly.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Monthly implements java.io.Serializable {
	private static final long serialVersionUID = 20001L;

	private int monthly_no;
	private String monthly_name;
	private Date monthly_date;
	private String monthly_img;
	
	@Override
	public String toString() {
		return "Monthly_tb [monthly_no=" + monthly_no + ", monthly_name=" + monthly_name + ", monthly_date="
				+ monthly_date + ", monthly_img=" + monthly_img + "]";
	}
	public int getMonthly_no() {
		return monthly_no;
	}
	public void setMonthly_no(int monthly_no) {
		this.monthly_no = monthly_no;
	}
	public String getMonthly_name() {
		return monthly_name;
	}
	public void setMonthly_name(String monthly_name) {
		this.monthly_name = monthly_name;
	}
	public Date getMonthly_date() {
		return monthly_date;
	}
	public void setMonthly_date(Date monthly_date) {
		this.monthly_date = monthly_date;
	}
	public String getMonthly_img() {
		return monthly_img;
	}
	public void setMonthly_img(String monthly_img) {
		this.monthly_img = monthly_img;
	}
	
}
