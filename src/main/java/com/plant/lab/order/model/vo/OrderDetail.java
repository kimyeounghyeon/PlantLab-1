package com.plant.lab.order.model.vo;

public class OrderDetail {
	private int buy_no;
	private int pro_no;
	private int pro_num;
	private String pro_image;
	private String pro_price;
	private String pro_name;
//class관련 추가 멤버
	private String reserv_date;
	private int reserv_no;
	private String oneday_title;
 	private String oneday_img;
	private int oneday_price;
	private String oneday_request;
	private String oneday_place;
	private String oneday_dtailplace;
	
	

	
	public int getBuy_no() {
		return buy_no;
	}
	@Override
	public String toString() {
		return "OrderDetail [buy_no=" + buy_no + ", pro_no=" + pro_no + ", pro_num=" + pro_num + ", pro_image="
				+ pro_image + ", pro_price=" + pro_price + ", pro_name=" + pro_name + ", reserv_date=" + reserv_date
				+ ", reserv_no=" + reserv_no + ", oneday_title=" + oneday_title + ", oneday_img=" + oneday_img
				+ ", oneday_price=" + oneday_price + ", oneday_request=" + oneday_request + ", oneday_place="
				+ oneday_place + ", oneday_dtailplace=" + oneday_dtailplace + "]";
	}
	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public int getReserv_no() {
		return reserv_no;
	}
	public void setReserv_no(int reserv_no) {
		this.reserv_no = reserv_no;
	}
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public String getPro_image() {
		return pro_image;
	}
	public void setPro_image(String pro_image) {
		this.pro_image = pro_image;
	}
	public String getPro_price() {
		return pro_price;
	}
	public void setPro_price(String pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getReserv_date() {
		return reserv_date;
	}
	public void setReserv_date(String reserv_date) {
		this.reserv_date = reserv_date;
	}
	public String getOneday_title() {
		return oneday_title;
	}
	public void setOneday_title(String oneday_title) {
		this.oneday_title = oneday_title;
	}
	public String getOneday_img() {
		return oneday_img;
	}
	public void setOneday_img(String oneday_img) {
		this.oneday_img = oneday_img;
	}
	public int getOneday_price() {
		return oneday_price;
	}
	public void setOneday_price(int oneday_price) {
		this.oneday_price = oneday_price;
	}
	public String getOneday_request() {
		return oneday_request;
	}
	public void setOneday_request(String oneday_request) {
		this.oneday_request = oneday_request;
	}
	public String getOneday_place() {
		return oneday_place;
	}
	public void setOneday_place(String oneday_place) {
		this.oneday_place = oneday_place;
	}
	public String getOneday_dtailplace() {
		return oneday_dtailplace;
	}
	public void setOneday_dtailplace(String oneday_dtailplace) {
		this.oneday_dtailplace = oneday_dtailplace;
	}
	
	
}
