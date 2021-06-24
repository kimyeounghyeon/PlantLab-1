package com.plant.lab.member.model.vo;

import org.springframework.stereotype.Component;


@Component
public class MemberVO {
	private String userNo;
	private String userId;
	private String userName;
    private String userPwd;
    private String email;
    private int phone;
    private int grade;
    private String address;
    
    
    
 	public MemberVO(String userNo, String userId, String userName, String userPwd, String email, int phone, int grade,
			String address) {
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.email = email;
		this.phone = phone;
		this.grade = grade;
		this.address = address;
	}

 	
 	
	public MemberVO() {
	}



	@Override
	public String toString() {
		return "MemberVO [userNo=" + userNo + ", userId=" + userId + ", userName=" + userName + " , userPwd=" + userPwd + ", email=" + email + ", phone=" + phone + ", grade=" + grade + ", address=" + address + "]";
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
 	
 	
}












