package com.douzon.bookshop.vo;

public class OrdersVo {
	private String shippingNo;
	private String name;
	private String email;
	private Long totalPrice;
	private String destination;
	private String title;
	private Long memberNo;
	private Long bookNo;
	private Long ordersNo;
	private int amount;

	public String getShippingNo() {
		return shippingNo;
	}

	public void setShippingNo(String shippingNo) {
		this.shippingNo = shippingNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Long totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public Long getBookNo() {
		return bookNo;
	}

	public void setBookNo(Long bookNo) {
		this.bookNo = bookNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Long getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(Long memberNo) {
		this.memberNo = memberNo;
	}

	public Long getOrdersNo() {
		return ordersNo;
	}

	public void setOrdersNo(Long ordersNo) {
		this.ordersNo = ordersNo;
	}

	@Override
	public String toString() {
		return "OrdersVo [shippingNo=" + shippingNo + ", name=" + name + ", email=" + email + ", totalPrice="
				+ totalPrice + ", destination=" + destination + ", bookNo=" + bookNo + ", title=" + title + ", amount="
				+ amount + ", memberNo=" + memberNo + ", ordersNo=" + ordersNo + "]";
	}

}
