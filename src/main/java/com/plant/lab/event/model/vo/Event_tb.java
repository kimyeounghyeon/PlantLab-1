package com.plant.lab.event.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Event_tb implements java.io.Serializable {
	private static final long serialVersionUID = 20001L;
	
	
	
	private int event_no;
	private int user_no;
	private String event_title;
	private String event_content;
	private Date event_date;
	private int event_views;
	private String start_date;
	private String end_date;
	private String banner;
	
	@Override
	public String toString() {
		return "Event_tb [event_no=" + event_no + ", user_no=" + user_no + ", event_title=" + event_title
				+ ", event_content=" + event_content + ", event_date=" + event_date + ", event_views=" + event_views
				+ ", start_date=" + start_date + ", end_date=" + end_date + ", banner=" + banner + "]";
	}
	
	public int getEvent_no() {
		return event_no;
	}
	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	public Date getEvent_date() {
		return event_date;
	}
	public void setEvent_date(Date event_date) {
		this.event_date = event_date;
	}
	public int getEvent_views() {
		return event_views;
	}
	public void setEvent_views(int event_views) {
		this.event_views = event_views;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getBanner() {
		return banner;
	}
	public void setBanner(String banner) {
		this.banner = banner;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}