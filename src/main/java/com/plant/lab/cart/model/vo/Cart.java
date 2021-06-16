package com.plant.lab.cart.model.vo;

import com.plant.lab.product.model.vo.Product;

public class Cart {
	private int cart_no;
	private int user_no;
	private int pro_no;
	private int pro_cnt;
	private String pro_image;
	private String pro_name;
	private String pro_price;
	
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public int getPro_cnt() {
		return pro_cnt;
	}
	public void setPro_cnt(int pro_cnt) {
		this.pro_cnt = pro_cnt;
	}
	public String getPro_image() {
		return pro_image;
	}
	public void setPro_image(String pro_image) {
		this.pro_image = pro_image;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_price() {
		return pro_price;
	}
	public void setPro_price(String pro_price) {
		this.pro_price = pro_price;
	}
}
