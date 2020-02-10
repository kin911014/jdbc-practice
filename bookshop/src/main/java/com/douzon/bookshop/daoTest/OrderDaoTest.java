package com.douzon.bookshop.daoTest;

import java.util.List;

import com.douzon.bookshop.dao.OrderDao;
import com.douzon.bookshop.vo.OrdersVo;

public class OrderDaoTest {

	public static void main(String[] args) {
		//OrdersInsertTest("20200130-00002", 30000L, "수원", 5L);
		//OrdersBookInsertTest(1L,1L,3);
		ordersSelectTest();
		ordersBookSelectTest();
	}

	// orders findAll
	public static void ordersSelectTest() {
		List<OrdersVo> list = new OrderDao().ordersFindAll();
		for (OrdersVo vo : list) { 
			System.out.println("orders [주문번호=" + vo.getShippingNo()
							+ ", 주문자=" + vo.getName() + "/" + vo.getEmail()
							+ ", 결제금액=" + vo.getTotalPrice() 
							+ ", 배송지=" + vo.getDestination() + " 입니다]");
		}
	}
	
	// ordersBook findAll
	public static void ordersBookSelectTest() {
		List<OrdersVo> list = new OrderDao().ordersBookFindAll();
		for (OrdersVo vo : list) { // 도서번호, 도서제목, 수량
			System.out.println("ordersBook [도서번호=" + vo.getBookNo()
							+ ", 도서제목=" + vo.getTitle() 
							+ ", 수량=" + vo.getAmount() 
							+ "권 입니다]");
		}
	}
	
	// orders insert
	public static void OrdersInsertTest(String shippingNo, Long totalPrice, String destination, Long memberNo) {
		OrdersVo ordersVo = new OrdersVo();
		ordersVo.setShippingNo(shippingNo);
		ordersVo.setTotalPrice(totalPrice);
		ordersVo.setDestination(destination);
		ordersVo.setMemberNo(memberNo);
		new OrderDao().ordersInsert(ordersVo);

	}
	
	// ordersBook insert
	public static void OrdersBookInsertTest(Long bookNo, Long ordersNo, int amount) {
		OrdersVo ordersVo = new OrdersVo();
		ordersVo.setBookNo(bookNo);
		ordersVo.setOrdersNo(ordersNo);
		ordersVo.setAmount(amount);;
		new OrderDao().ordersBookInsert(ordersVo);

	}
}
