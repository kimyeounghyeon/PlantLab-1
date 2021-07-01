package com.plant.lab.oneday.model.vo;



import org.springframework.stereotype.Component;

@Component
public class OnedayVo {
	private int   oneday_no;			//수업 번호
	private String oneday_title;		//수업  제목
	private String oneday_img;			//수업 썸네일
	private String oneday_content;		//수업 설명
	private int oneday_maxPerson; 		//재고
	private String oneday_start;		//수업 시작날
	private String oneday_end;			//마지막 수업
	private int oneday_price ;         //가격
	private String oneday_place;      //주소
	private String oneday_dtailPlace;  //상세주소
	private String oneday_Stime;  //수업시간 시작
	private String oneday_Etime;  //수업시간 끝남
	
	
	//RESERV_Date
	
	private int   reserv_no;     //예약번호
	private int    user_no;			//회원번호
	private String oneday_request;	//요구사항
	private String reserv_date;		//수업들을 날짜(예약일)
	
	
	


	@Override
	public String toString() {
		return "OnedayVo [oneday_no=" + oneday_no + ", oneday_title=" + oneday_title + ", oneday_img=" + oneday_img
				+ ", oneday_content=" + oneday_content + ", oneday_maxPerson=" + oneday_maxPerson + ", oneday_start="
				+ oneday_start + ", oneday_end=" + oneday_end + ", oneday_price=" + oneday_price + ", oneday_place="
				+ oneday_place + ", oneday_dtailPlace=" + oneday_dtailPlace + ", oneday_Stime=" + oneday_Stime
				+ ", oneday_Etime=" + oneday_Etime + ", reserv_no=" + reserv_no + ", user_no=" + user_no
				+ ", oneday_request=" + oneday_request + ", reserv_date=" + reserv_date + "]";
	}



	public OnedayVo() {}



	public OnedayVo(int oneday_no, String oneday_title, String oneday_img, String oneday_content, int oneday_maxPerson,
			String oneday_start, String oneday_end, int oneday_price, String oneday_place, String oneday_dtailPlace,
			String oneday_Stime, String oneday_Etime, int reserv_no, int user_no, String oneday_request,
			String reserv_date) {
		super();
		this.oneday_no = oneday_no;
		this.oneday_title = oneday_title;
		this.oneday_img = oneday_img;
		this.oneday_content = oneday_content;
		this.oneday_maxPerson = oneday_maxPerson;
		this.oneday_start = oneday_start;
		this.oneday_end = oneday_end;
		this.oneday_price = oneday_price;
		this.oneday_place = oneday_place;
		this.oneday_dtailPlace = oneday_dtailPlace;
		this.oneday_Stime = oneday_Stime;
		this.oneday_Etime = oneday_Etime;
		this.reserv_no = reserv_no;
		this.user_no = user_no;
		this.oneday_request = oneday_request;
		this.reserv_date = reserv_date;
	}



	public int getOneday_no() {
		return oneday_no;
	}



	public void setOneday_no(int oneday_no) {
		this.oneday_no = oneday_no;
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



	public String getOneday_content() {
		return oneday_content;
	}



	public void setOneday_content(String oneday_content) {
		this.oneday_content = oneday_content;
	}



	public int getOneday_maxPerson() {
		return oneday_maxPerson;
	}



	public void setOneday_maxPerson(int oneday_maxPerson) {
		this.oneday_maxPerson = oneday_maxPerson;
	}



	public String getOneday_start() {
		return oneday_start;
	}



	public void setOneday_start(String oneday_start) {
		this.oneday_start = oneday_start;
	}



	public String getOneday_end() {
		return oneday_end;
	}



	public void setOneday_end(String oneday_end) {
		this.oneday_end = oneday_end;
	}



	public int getOneday_price() {
		return oneday_price;
	}



	public void setOneday_price(int oneday_price) {
		this.oneday_price = oneday_price;
	}



	public String getOneday_place() {
		return oneday_place;
	}



	public void setOneday_place(String oneday_place) {
		this.oneday_place = oneday_place;
	}



	public String getOneday_dtailPlace() {
		return oneday_dtailPlace;
	}



	public void setOneday_dtailPlace(String oneday_dtailPlace) {
		this.oneday_dtailPlace = oneday_dtailPlace;
	}



	public String getOneday_Stime() {
		return oneday_Stime;
	}



	public void setOneday_Stime(String oneday_Stime) {
		this.oneday_Stime = oneday_Stime;
	}



	public String getOneday_Etime() {
		return oneday_Etime;
	}



	public void setOneday_Etime(String oneday_Etime) {
		this.oneday_Etime = oneday_Etime;
	}



	public int getReserv_no() {
		return reserv_no;
	}



	public void setReserv_no(int reserv_no) {
		this.reserv_no = reserv_no;
	}



	public int getUser_no() {
		return user_no;
	}



	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}



	public String getOneday_request() {
		return oneday_request;
	}



	public void setOneday_request(String oneday_request) {
		this.oneday_request = oneday_request;
	}



	public String getReserv_date() {
		return reserv_date;
	}



	public void setReserv_date(String reserv_date) {
		this.reserv_date = reserv_date;
	}


	
	
}