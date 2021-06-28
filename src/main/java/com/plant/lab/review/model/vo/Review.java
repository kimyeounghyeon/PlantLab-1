package com.plant.lab.review.model.vo;

import java.sql.Date;

public class Review {
	private int rv_no;
	private int pro_no;
	private int user_no;
	private String user_name;
	private String rv_title;
	private String rv_content;
	private Date rv_date;
	private int rv_star;
	private int rv_img_num;
	private String rv_img_src;
	
	public int getRv_no() {
		return rv_no;
	}
	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getRv_title() {
		return rv_title;
	}
	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}
	public String getRv_content() {
		return rv_content;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}
	public Date getRv_date() {
		return rv_date;
	}
	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}
	public int getRv_star() {
		return rv_star;
	}
	public void setRv_star(int rv_star) {
		this.rv_star = rv_star;
	}
	public int getRv_img_num() {
		return rv_img_num;
	}
	public void setRv_img_num(int rv_img_num) {
		this.rv_img_num = rv_img_num;
	}
	public String getRv_img_src() {
		return rv_img_src;
	}
	public void setRv_img_src(String rv_img_src) {
		this.rv_img_src = rv_img_src;
	}
	
}
