package com.plant.lab.product.model.vo;

import org.springframework.stereotype.Component;

@Component
public class ProductContnet {
	private int pro_no;
	private String pro_detail;
	private char pro_cate;
	
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public String getPro_detail() {
		return pro_detail;
	}
	public void setPro_detail(String pro_detail) {
		this.pro_detail = pro_detail;
	}
	public char getPro_cate() {
		return pro_cate;
	}
	public void setPro_cate(char pro_cate) {
		this.pro_cate = pro_cate;
	}
}
