package com.plant.lab.diary.model.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class DiaryVO {
	private int diary_no;
	private int diary_write;
	private String diary_content;
	private Date diary_date;
	private int diary_views;
	private String user_id;
	private String user_name;
	private int like_cnt;
	private int user_no;
	private List<DiaryImgVO> diaryImgVO;
	
	public DiaryVO() {}

	public DiaryVO(int diary_no, int diary_write, String diary_content, Date diary_date, int diary_views,
			List<DiaryImgVO> diaryImgVO, String user_id, String user_name, int like_cnt, int user_no) {
		super();
		this.diary_no = diary_no;
		this.diary_write = diary_write;
		this.diary_content = diary_content;
		this.diary_date = diary_date;
		this.diary_views = diary_views;
		this.diaryImgVO = diaryImgVO;
		this.user_id = user_id;
		this.user_name = user_name;
		this.like_cnt = like_cnt;
		this.user_no = user_no;
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

	public List<DiaryImgVO> getDiaryImgVO() {
		return diaryImgVO;
	}

	public void setDiaryImgVO(List<DiaryImgVO> diaryImgVO) {
		this.diaryImgVO = diaryImgVO;
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

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	@Override
	public String toString() {
		return "DiaryVO [diary_no=" + diary_no + ", diary_write=" + diary_write + ", diary_content=" + diary_content
				+ ", diary_date=" + diary_date + ", diary_views=" + diary_views + ", diaryImgVO=" + diaryImgVO
				+ ", user_id=" + user_id + ", user_name=" + user_name + ", like_cnt=" + like_cnt + ", user_no="
				+ user_no + "]";
	}


	
}
