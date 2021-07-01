package com.plant.lab.report.model.vo;

import java.sql.Date;

public class Report {
	private int report_no;
	private int r_diary_no;
	private int reported_user_no;
	private int report_user_no;
	private String report_content;
	private Date report_date;
	private int report_state;
	
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}
	public int getR_diary_no() {
		return r_diary_no;
	}
	public void setR_diary_no(int r_diary_no) {
		this.r_diary_no = r_diary_no;
	}
	public int getReported_user_no() {
		return reported_user_no;
	}
	public void setReported_user_no(int reported_user_no) {
		this.reported_user_no = reported_user_no;
	}
	public int getReport_user_no() {
		return report_user_no;
	}
	public void setReport_user_no(int report_user_no) {
		this.report_user_no = report_user_no;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public Date getReport_date() {
		return report_date;
	}
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	public int getReport_state() {
		return report_state;
	}
	public void setReport_state(int report_state) {
		this.report_state = report_state;
	}
}
