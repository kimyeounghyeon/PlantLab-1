package com.plant.lab.oneday.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class OnedayRsVo {
	private int   reserv_no;
	private int   oneday_no;
	private int    userNo;
	

	@Override
	public String toString() {
		return "OnedayRsVo [reserv_no=" + reserv_no + ", oneday_no=" + oneday_no + ", userNo=" + userNo + "]";
	}
	
	public OnedayRsVo() {}
	
	public OnedayRsVo(int reserv_no, int oneday_no, int userNo) {
		super();
		this.reserv_no = reserv_no;
		this.oneday_no = oneday_no;
		this.userNo = userNo;
	}
	public int getReserv_no() {
		return reserv_no;
	}
	public void setReserv_no(int reserv_no) {
		this.reserv_no = reserv_no;
	}
	public int getOneday_no() {
		return oneday_no;
	}
	public void setOneday_no(int oneday_no) {
		this.oneday_no = oneday_no;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
	
}
