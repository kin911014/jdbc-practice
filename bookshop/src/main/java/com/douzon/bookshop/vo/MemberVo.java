package com.douzon.bookshop.vo;

public class MemberVo {

	private Long no;
	private String name;
	private String phoneNo;
	private String email;
	private String password;
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "MemberVo [no=" + no + ", name=" + name + ", phoneNo=" + phoneNo + ", email=" + email + ", password="
				+ password + "]";
	}
	
}
