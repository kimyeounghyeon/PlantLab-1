package com.plant.lab.diary.model.vo;

import java.sql.Date;

public class diaryVO {
	private int diary_no;
	private int diary_write;
	private String diary_title;
	private String diary_content;
	private Date diary_date;
	private int diary_views;
	
	
	public diaryVO(int diary_no, int diary_write, String diary_title, String diary_content, Date diary_date,
			int diary_views) {
		this.diary_no = diary_no;
		this.diary_write = diary_write;
		this.diary_title = diary_title;
		this.diary_content = diary_content;
		this.diary_date = diary_date;
		this.diary_views = diary_views;
	}

	
	public diaryVO() {
	}


	@Override
	public String toString() {
		return "diaryVO [diary_no=" + diary_no + ", diary_write=" + diary_write + ", diary_title=" + diary_title
				+ ", diary_content=" + diary_content + ", diary_date=" + diary_date + ", diary_views=" + diary_views
				+ "]";
	}

	public int getDiary_no() {
		return diary_no;
	}

	public void setDiary_no(int diary_no) {
		this.diary_no = diary_no;
	}

	public int getDiary_write() {
		return diary_write;
	}

	public void setDiary_write(int diary_write) {
		this.diary_write = diary_write;
	}

	public String getDiary_title() {
		return diary_title;
	}

	public void setDiary_title(String diary_title) {
		this.diary_title = diary_title;
	}

	public String getDiary_content() {
		return diary_content;
	}

	public void setDiary_content(String diary_content) {
		this.diary_content = diary_content;
	}

	public Date getDiary_date() {
		return diary_date;
	}

	public void setDiary_date(Date diary_date) {
		this.diary_date = diary_date;
	}

	public int getDiary_views() {
		return diary_views;
	}

	public void setDiary_views(int diary_views) {
		this.diary_views = diary_views;
	}
	
	
	
	
}
