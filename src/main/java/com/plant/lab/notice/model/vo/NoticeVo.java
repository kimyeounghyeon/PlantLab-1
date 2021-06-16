package com.plant.lab.notice.model.vo;

import org.springframework.stereotype.Component;

@Component
public class NoticeVo {
	private int notice_no;
	private int user_no;
	private String notice_title;
	private String notice_content;
	private String notice_date;
	
	
	
	
	public int getNotice_no() {
		return notice_no;
	}




	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}




	public int getUser_no() {
		return user_no;
	}




	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}




	public String getNotice_title() {
		return notice_title;
	}




	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}




	public String getNotice_content() {
		return notice_content;
	}




	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}




	public String getNotice_date() {
		return notice_date;
	}




	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}




	@Override
	public String toString() {
		return "NoticeVo [notice_no=" + notice_no + ", user_no=" + user_no + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_date=" + notice_date + "]";
	}
	
	
	

}
