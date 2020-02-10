package com.douzon.bookshop.daoTest;

import java.util.List;

import com.douzon.bookshop.dao.CategoryDao;
import com.douzon.bookshop.vo.CategoryVo;

public class CategoryDaoTest {

	public static void main(String[] args) {
		//insertTest("IT");
		//insertTest("철학");
		//insertTest("취미");
		
		selectTest();

	}
	
	public static void selectTest() {
		List<CategoryVo> list = new CategoryDao().findAll();
		for (CategoryVo vo : list) {
			System.out.println( // IT , 역사 , 취미 
					"Category [카테고리=" + vo.getName() + " 입니다]");
		}
	}
	public static void insertTest(String name) {
		CategoryVo vo = new CategoryVo();
		vo.setName(name);
		new CategoryDao().insert(vo);

	}
	
}
