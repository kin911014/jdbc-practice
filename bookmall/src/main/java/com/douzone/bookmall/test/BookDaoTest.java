package com.douzone.bookmall.test;

import java.util.List;

import com.douzone.bookmall.dao.BookDao;
import com.douzone.bookmall.vo.BookVo;

public class BookDaoTest {
	public static void main(String[] args) {

		// insertTest("트와일라잇", 1L);
		// insertTest("뉴문", 1L);
		// insertTest("이클립스", 1L);
		// insertTest("브레이킹던", 1L);
		// insertTest("젋은그들", 2L);
		// insertTest("브레이킹던", 1L);
		//insertTest("아리랑", 5L);
		//insertTest("태백산맥", 5L);
		selectTest();
		//updateTest("대여가능","대여중");
		

	}

	public static void selectTest() {
		List<BookVo> list = new BookDao().findAll();
		for (BookVo vo : list) {
			System.out.println(vo);
		}

	}

	public static void insertTest(String title, Long authorNo) {
		BookVo vo = new BookVo();
		vo.setTitle(title);
		vo.setAuthorNo(authorNo);
		new BookDao().insert(vo);

	}

	public static void deleteTest(Long no) {
		BookVo vo = new BookVo();
		vo.setNo(no);
		new BookDao().delete(vo);
	}

	public static void updateTest(Long no, String rename) {
		BookVo vo = new BookVo();
		vo.setNo(no);
		new BookDao().update(no, rename);
	}
}
