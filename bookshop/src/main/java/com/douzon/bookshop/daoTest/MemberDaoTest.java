package com.douzon.bookshop.daoTest;

import java.util.List;

import com.douzon.bookshop.dao.MemberDao;
import com.douzon.bookshop.vo.MemberVo;

public class MemberDaoTest {

	public static void main(String[] args) {
		
		//insertTest("이상휘", "010-0000-0000", "lsh1111@daum.net", "김동은");
		selectTest();

	}

	public static void selectTest() {
		List<MemberVo> list = new MemberDao().findAll();
		for (MemberVo vo : list) { //이름, 전화번호, 이메일, 비밀번호
			System.out.println("member [이름=" + vo.getName()
							+ ", 전화번호=" + vo.getPhoneNo()
							+ ", 이메일=" + vo.getEmail()
							+ ", 비밀번호=" + vo.getPassword() + " 입니다]");
		}
	}
	//이름, 전화번호, 이메일, 비밀번호
	public static void insertTest(String name, String phoneNo, String email, String password) {
		MemberVo vo = new MemberVo();
		vo.setName(name);
		vo.setPhoneNo(phoneNo);
		vo.setEmail(email);
		vo.setPassword(password);
		new MemberDao().insert(vo);

	}
}
