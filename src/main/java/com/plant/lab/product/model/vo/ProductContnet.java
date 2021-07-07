package com.plant.lab.product.model.vo;

import org.springframework.stereotype.Component;

@Component
public class ProductContnet {
	private String pro_detail;
	private char pro_cate;
	
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
