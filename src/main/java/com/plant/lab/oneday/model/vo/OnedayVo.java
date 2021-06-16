package com.plant.lab.oneday.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class OnedayVo {
	private int   oneday_no;
	private String oneday_title;
	private String oneday_img;
	private String oneday_content;
	private int oneday_maxPerson;
	private Date oneday_start;
	private Date oneday_end;
	@Override
	public String toString() {
		return "OnedayVo [oneday_no=" + oneday_no + ", oneday_title=" + oneday_title + ", oneday_img=" + oneday_img
				+ ", oneday_content=" + oneday_content + ", oneday_maxPerson=" + oneday_maxPerson + ", oneday_start="
				+ oneday_start + ", oneday_end=" + oneday_end + "]";
	}
	public OnedayVo(int oneday_no, String oneday_title, String oneday_img, String oneday_content, int oneday_maxPerson,
			Date oneday_start, Date oneday_end) {
		super();
		this.oneday_no = oneday_no;
		this.oneday_title = oneday_title;
		this.oneday_img = oneday_img;
		this.oneday_content = oneday_content;
		this.oneday_maxPerson = oneday_maxPerson;
		this.oneday_start = oneday_start;
		this.oneday_end = oneday_end;
	}
	
	public OnedayVo() {}
	public int getOneday_no() {
		return oneday_no;
	}
	public void setOneday_no(int oneday_no) {
		this.oneday_no = oneday_no;
	}
	public String getOneday_title() {
		return oneday_title;
	}
	public void setOneday_title(String oneday_title) {
		this.oneday_title = oneday_title;
	}
	public String getOneday_img() {
		return oneday_img;
	}
	public void setOneday_img(String oneday_img) {
		this.oneday_img = oneday_img;
	}
	public String getOneday_content() {
		return oneday_content;
	}
	public void setOneday_content(String oneday_content) {
		this.oneday_content = oneday_content;
	}
	public int getOneday_maxPerson() {
		return oneday_maxPerson;
	}
	public void setOneday_maxPerson(int oneday_maxPerson) {
		this.oneday_maxPerson = oneday_maxPerson;
	}
	public Date getOneday_start() {
		return oneday_start;
	}
	public void setOneday_start(Date oneday_start) {
		this.oneday_start = oneday_start;
	}
	public Date getOneday_end() {
		return oneday_end;
	}
	public void setOneday_end(Date oneday_end) {
		this.oneday_end = oneday_end;
	}
	
	
	
	
	
	
}
