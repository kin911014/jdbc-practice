package com.douzon.bookshop.daoTest;

import java.util.List;

import com.douzon.bookshop.dao.CartDao;
import com.douzon.bookshop.vo.CartVo;

public class CartDaoTest {

	public static void main(String[] args) {
		//insertTest(1L, 1L, 50L );
		//insertTest(2L, 1L, 300L );
		//insertTest(3L, 2L, 1500L );
		selectTest();
	}
	public static void selectTest() {
		List<CartVo> list = new CartDao().findAll();
		for (CartVo vo : list) { // 도서제목, 수량, 가격
			System.out.println("cart [도서제목=" + vo.getTitle()
							+ ", 수량=" + vo.getAmount()
							+ ", 가격=" + vo.getPrice()+"원 입니다]");
		}
	}
	// 북넘버, 멤버넘버, 수량
	public static void insertTest(Long bookNo, Long memberNo, Long amount) {
		CartVo vo = new CartVo();
		vo.setBookNo(bookNo);
		vo.setMemberNo(memberNo);
		vo.setAmount(amount);
		new CartDao().insert(vo);

	}

}
