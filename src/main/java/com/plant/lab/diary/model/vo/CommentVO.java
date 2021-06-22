package com.plant.lab.diary.model.vo;

import java.sql.Date;

public class CommentVO {
	private int comm_no;
	private int diary_no;
	private int writer;
	private String comm_comment;
	private Date comm_date;
	private int comm_root;
	private int comm_step;
	private int comm_level;
	
	
	
	public CommentVO() {}
	public CommentVO(int comm_no, int diary_no, int writer, String comm_comment, Date comm_date, int comm_root,
			int comm_step, int comm_level) {
		super();
		this.comm_no = comm_no;
		this.diary_no = diary_no;
		this.writer = writer;
		this.comm_comment = comm_comment;
		this.comm_date = comm_date;
		this.comm_root = comm_root;
		this.comm_step = comm_step;
		this.comm_level = comm_level;
	}
	
	@Override
	public String toString() {
		return "CommentVO [comm_no=" + comm_no + ", diary_no=" + diary_no + ", writer=" + writer + ", comm_comment="
				+ comm_comment + ", comm_date=" + comm_date + ", comm_root=" + comm_root + ", comm_step=" + comm_step
				+ ", comm_level=" + comm_level + "]";
	}
	
	public int getComm_no() {
		return comm_no;
	}
	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
	}
	public int getDiary_no() {
		return diary_no;
	}
	public void setDiary_no(int diary_no) {
		this.diary_no = diary_no;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public String getComm_comment() {
		return comm_comment;
	}
	public void setComm_comment(String comm_comment) {
		this.comm_comment = comm_comment;
	}
	public Date getComm_date() {
		return comm_date;
	}
	public void setComm_date(Date comm_date) {
		this.comm_date = comm_date;
	}
	public int getComm_root() {
		return comm_root;
	}
	public void setComm_root(int comm_root) {
		this.comm_root = comm_root;
	}
	public int getComm_step() {
		return comm_step;
	}
	public void setComm_step(int comm_step) {
		this.comm_step = comm_step;
	}
	public int getComm_level() {
		return comm_level;
	}
	public void setComm_level(int comm_level) {
		this.comm_level = comm_level;
	}
	
	
	

}
