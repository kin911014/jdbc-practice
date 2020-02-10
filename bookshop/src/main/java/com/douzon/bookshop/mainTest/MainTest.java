package com.douzon.bookshop.mainTest;

import com.douzon.bookshop.daoTest.BookDaoTest;
import com.douzon.bookshop.daoTest.CartDaoTest;
import com.douzon.bookshop.daoTest.CategoryDaoTest;
import com.douzon.bookshop.daoTest.MemberDaoTest;
import com.douzon.bookshop.daoTest.OrderDaoTest;

public class MainTest {

	public static void main(String[] args) {
		//insertTest();
		allShowing();

	}
	
	public static void insertTest() {
		
		// 회원 리스트 2개  // name, phoneNo, email, password
		MemberDaoTest.insertTest("김동은", "010-2991-8126", "kin911014@daum.net", "pw0101");
		MemberDaoTest.insertTest("김하나", "010-7777-1234", "oneone@naver.com", "one1111");
		
		// 카테고리 리스트 3개 // categoryName
		CategoryDaoTest.insertTest("IT");
		CategoryDaoTest.insertTest("역사");
		CategoryDaoTest.insertTest("취미");
		
		// 도서 리스트 3개  // title, price, categoryNo
		BookDaoTest.insertTest("고프의 디자인패턴", 26000, 1L);
		BookDaoTest.insertTest("총,균,쇠", 20000, 2L);
		BookDaoTest.insertTest("베컴의 축구 잘하는 법", 22000, 3L);
		
		// 카트 리스트 2개 상품3개중두개담기 // bookNo, memberNo, amount
		CartDaoTest.insertTest(1L, 1L, 5L);
		CartDaoTest.insertTest(3L, 1L, 1L);
		
		// 주문 리스트 1개 이 주문에는 도서가 2개들어가있으면된다. // shippingNo, totalPrice, destination, memberNo
		OrderDaoTest.OrdersInsertTest("20200130-00001", 152000L , "춘천시 퇴계동 220-28번지 103호", 1L);
		
		// 주문 도서 리스트 2개 // bookNo, ordersNo, amount
		OrderDaoTest.OrdersBookInsertTest(1L, 1L, 5);
		OrderDaoTest.OrdersBookInsertTest(3L, 1L, 1);
	}
	
	public static void allShowing() {
		// member
		MemberDaoTest.selectTest();
		
		// category
		CategoryDaoTest.selectTest();
		
		// book
		BookDaoTest.selectTest();
		
		// cart
		CartDaoTest.selectTest();
		
		// orders
		OrderDaoTest.ordersSelectTest();
		
		// ordersBook
		OrderDaoTest.ordersBookSelectTest();
	}

}
