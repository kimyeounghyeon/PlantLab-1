package com.plant.lab.product.model.vo;

import org.springframework.stereotype.Component;

@Component
public class ProductContnet {
	private String pro_detail;
	
	public String getPro_detail() {
		return pro_detail;
	}
	public void setPro_detail(String pro_detail) {
		this.pro_detail = pro_detail;
	}
}
