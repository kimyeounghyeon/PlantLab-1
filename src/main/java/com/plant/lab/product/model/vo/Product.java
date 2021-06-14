package com.plant.lab.product.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Product {
	private int pro_no;
	private String pro_name;
	private String pro_image;
	private int pro_price;
	private String pro_content;
	private int pro_totalStar;
	private int pro_stock;
	private char pro_cate;
	
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_image() {
		return pro_image;
	}
	public void setPro_image(String pro_image) {
		this.pro_image = pro_image;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_content() {
		return pro_content;
	}
	public void setPro_content(String pro_content) {
		this.pro_content = pro_content;
	}
	public int getPro_totalStar() {
		return pro_totalStar;
	}
	public void setPro_totalStar(int pro_totalStar) {
		this.pro_totalStar = pro_totalStar;
	}
	
	public int getPro_stock() {
		return pro_stock;
	}
	public void setPro_stock(int pro_stock) {
		this.pro_stock = pro_stock;
	}
	public char getPro_cate() {
		return pro_cate;
	}
	public void setPro_cate(char pro_cate) {
		this.pro_cate = pro_cate;
	}
	
	
}
