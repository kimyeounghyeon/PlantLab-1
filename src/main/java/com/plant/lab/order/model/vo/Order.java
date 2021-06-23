package com.plant.lab.order.model.vo;

import java.sql.Date;

import com.plant.lab.cart.model.vo.Cart;

public class Order {
	private int buy_no;
	private int user_no;
	private int reserv_no;
	private int buy_totalprice;
	private Date date;
	private String buy_paymentmethod;
	private int phone;
	private String buy_email;
	private String buy_requests;
	private String buy_rc_name;
	private String buy_rc_address;
	private int buy_rc_phone;
	
	public int getBuy_no() {
		return buy_no;
	}
	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getReserv_no() {
		return reserv_no;
	}
	public void setReserv_no(int reserv_no) {
		this.reserv_no = reserv_no;
	}
	public int getBuy_totalprice() {
		return buy_totalprice;
	}
	public void setBuy_totalprice(int buy_totalprice) {
		this.buy_totalprice = buy_totalprice;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getBuy_paymentmethod() {
		return buy_paymentmethod;
	}
	public void setBuy_paymentmethod(String buy_paymentmethod) {
		this.buy_paymentmethod = buy_paymentmethod;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getBuy_email() {
		return buy_email;
	}
	public void setBuy_email(String buy_email) {
		this.buy_email = buy_email;
	}
	public String getBuy_requests() {
		return buy_requests;
	}
	public void setBuy_requests(String buy_requests) {
		this.buy_requests = buy_requests;
	}
	public String getBuy_rc_name() {
		return buy_rc_name;
	}
	public void setBuy_rc_name(String buy_rc_name) {
		this.buy_rc_name = buy_rc_name;
	}
	public String getBuy_rc_address() {
		return buy_rc_address;
	}
	public void setBuy_rc_address(String buy_rc_address) {
		this.buy_rc_address = buy_rc_address;
	}
	public int getBuy_rc_phone() {
		return buy_rc_phone;
	}
	public void setBuy_rc_phone(int buy_rc_phone) {
		this.buy_rc_phone = buy_rc_phone;
	}
}
