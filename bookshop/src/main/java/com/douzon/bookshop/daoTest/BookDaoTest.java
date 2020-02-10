package com.douzon.bookshop.daoTest;

import java.util.List;

import com.douzon.bookshop.dao.BookDao;
import com.douzon.bookshop.vo.BookVo;

public class BookDaoTest {

	public static void main(String[] args) {
		//insertTest("인간극장", 50000, 1L);
		selectTest();
	}

	public static void selectTest() {
		List<BookVo> list = new BookDao().findAll();
		for (BookVo vo : list) { // 카테고리, 제목, 가격
			System.out.println("Book [카테고리=" + vo.getCategoryName()
							+ ", 제목=" + vo.getTitle()
							+ ", 가격=" + vo.getPrice()+"원 입니다]");
		}
	}
	public static void insertTest(String title, int price, long categoryNo) {
		BookVo vo = new BookVo();
		vo.setTitle(title);
		vo.setPrice(price);
		vo.setCategoryNo(categoryNo);
		new BookDao().insert(vo);

	}
}
