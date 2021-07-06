package com.plant.lab.notice.model.vo;

import org.springframework.stereotype.Component;

@Component
public class FnaVo {

	private int fna_no;
	private int user_no;
	private String fna_title;
	private String fna_content;
	private String fna_date;
	
	public int getFna_no() {
		return fna_no;
	}
	public void setFna_no(int fna_no) {
		this.fna_no = fna_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getFna_title() {
		return fna_title;
	}
	public void setFna_title(String fna_title) {
		this.fna_title = fna_title;
	}
	public String getFna_content() {
		return fna_content;
	}
	public void setFna_content(String fna_content) {
		this.fna_content = fna_content;
	}
	public String getFna_date() {
		return fna_date;
	}
	public void setFna_date(String fna_date) {
		this.fna_date = fna_date;
	}
	
	
}
