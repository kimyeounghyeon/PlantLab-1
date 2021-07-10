package com.plant.lab.diary.model.vo;

import org.springframework.stereotype.Component;

@Component
public class DiaryImgVO {
	private int diary_no;
	private int diary_img_num;
	private String diary_img_src;

	public DiaryImgVO() {
		super();
	}

	public DiaryImgVO(int diary_no, int diary_img_num, String diary_img_src) {
		super();
		this.diary_no = diary_no;
		this.diary_img_num = diary_img_num;
		this.diary_img_src = diary_img_src;
	}

	public int getDiary_no() {
		return diary_no;
	}

	public void setDiary_no(int diary_no) {
		this.diary_no = diary_no;
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

	@Override
	public String toString() {
		return "DiaryImgVO [diary_no=" + diary_no + ", diary_img_num=" + diary_img_num + ", diary_img_src="
				+ diary_img_src + "]";
	}
	

}
