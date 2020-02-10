package com.douzon.bookshop.vo;

public class CartVo {
	private Long bookNo;
	private Long memberNo;
	private Long amount;
	private String title;
	private int price;
	
	public Long getBookNo() {
		return bookNo;
	}
	public void setBookNo(Long bookNo) {
		this.bookNo = bookNo;
	}
	public Long getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Long memberNo) {
		this.memberNo = memberNo;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "cartVo [bookNo=" + bookNo + ", memberNo=" + memberNo + ", amount=" + amount + ", title=" + title
				+ ", price=" + price + "]";
	}
	
}
