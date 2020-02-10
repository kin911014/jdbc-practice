package com.douzon.bookshop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.douzon.bookshop.vo.CartVo;

public class CartDao {
	// 전체 찾기 함수
	public List<CartVo> findAll(){
		List<CartVo> result = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();

			String sql = "select a.title, b.amount, a.price from book a, cart b where a.no = b.book_no"; 

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			// 5. 결과 가져오기
			while(rs.next()) {
				// ()안은 인덱스를 가져오는게 좋다.
				String title = rs.getString(1);
				Long amount = rs.getLong(2);
				int price = rs.getInt(3);


				CartVo vo = new CartVo();
				vo.setTitle(title);
				vo.setAmount(amount);
				vo.setPrice(price);

				result.add(vo);
			}

		} catch (SQLException e) {
			System.out.println("error : " + e);
		}finally {
			// 6. 자원정리
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	public Boolean insert(CartVo cartVo) {

		Boolean result  = false;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();

			String sql = "insert into cart values(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			// 북넘버, 멤버넘버, 수량
			pstmt.setLong(1, cartVo.getBookNo());
			pstmt.setLong(2, cartVo.getMemberNo());
			pstmt.setLong(3, cartVo.getAmount());

			int count = pstmt.executeUpdate();

			// 5. 성공여부
			result = count == 1;

		} catch (SQLException e) {
			System.out.println("error : " + e);
		}finally {
			// 6. 자원정리
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	// connection함수
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			// 1. JDBC Driver(MySQL)  로딩
			Class.forName("com.mysql.jdbc.Driver");

			// 2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/bookshop";
			conn = DriverManager.getConnection(url, "bookshop", "bookshop");
		}catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패 : " + e);
		}

		return conn;
	}
}
