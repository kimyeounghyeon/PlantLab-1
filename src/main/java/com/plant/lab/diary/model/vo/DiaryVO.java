package com.plant.lab.diary.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class DiaryVO {
	private int diary_no;
	private int diary_write;
	private String diary_content;
	private Date diary_date;
	private int diary_views;
	private int diary_img_num;
	private String diary_img_src;
	private String user_id;
	private String user_name;
	private int like_cnt;
	
	public DiaryVO() {}

	public DiaryVO(int diary_no, int diary_write, String diary_content, Date diary_date, int diary_views,
			int diary_img_num, String diary_img_src, String user_id, String user_name, int like_cnt) {
		super();
		this.diary_no = diary_no;
		this.diary_write = diary_write;
		this.diary_content = diary_content;
		this.diary_date = diary_date;
		this.diary_views = diary_views;
		this.diary_img_num = diary_img_num;
		this.diary_img_src = diary_img_src;
		this.user_id = user_id;
		this.user_name = user_name;
		this.like_cnt = like_cnt;
	}

	@Override
	public String toString() {
		return "DiaryVO [diary_no=" + diary_no + ", diary_write=" + diary_write + ", diary_content=" + diary_content
				+ ", diary_date=" + diary_date + ", diary_views=" + diary_views + ", diary_img_num=" + diary_img_num
				+ ", diary_img_src=" + diary_img_src + ", user_id=" + user_id + ", user_name=" + user_name
				+ ", like_cnt=" + like_cnt + "]";
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

	public int getDiary_img_num() {
		return diary_img_num;
	}

	public void setDiary_img_num(int diary_img_num) {
		this.diary_img_num = diary_img_num;
	}

	public String getDiary_img_src() {
		return diary_img_src;
	}

	public void setDiary_img_src(String diary_img_src) {
		this.diary_img_src = diary_img_src;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}



	
}
