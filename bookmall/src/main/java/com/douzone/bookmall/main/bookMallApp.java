package com.douzone.bookmall.main;

import java.util.List;
import java.util.Scanner;

import com.douzone.bookmall.dao.BookDao;
import com.douzone.bookmall.vo.BookVo;

public class bookMallApp {

	public static void main(String[] args) {
		displayBookInpo();
		Scanner scanner = new Scanner(System.in);
		System.out.println("대여하고싶은 책의 번호를 입력하세요");
		Long no = scanner.nextLong();
		scanner.close();
		
		rent(no);
		displayBookInpo();
	}
	
	public static void rent(Long no) {
		new BookDao().update(no,  "대여중");
	}
	
	public static void displayBookInpo() {
		System.out.println("**************도서 정보 출력****************");
		
		List<BookVo> list = new BookDao().findAll();
		for(BookVo vo : list) {
			System.out.println(
					"[" + vo.getNo() + "]" + 
					"책제목: "  + vo.getTitle()+
					", 작가: "  + vo.getAuthorName() + 
					",대여유무: " + vo.getState());
		}
		
	}

}
