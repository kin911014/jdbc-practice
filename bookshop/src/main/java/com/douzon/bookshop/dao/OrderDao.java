package com.douzon.bookshop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.douzon.bookshop.vo.OrdersVo;

public class OrderDao {
	// 전체 찾기 함수
	public List<OrdersVo> ordersFindAll(){
		List<OrdersVo> result = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();

			String sql = "select a.shipping_no ,\r\n" + 
					" b.name, \r\n" + 
					" b.email,\r\n" + 
					" a.total_price ,\r\n" + 
					" a.destination \r\n" + 
					"from orders a, member b\r\n" + 
					"where a.member_no = b.no";
			

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			// 5. 결과 가져오기
			while(rs.next()) {
				// ()안은 인덱스를 가져오는게 좋다.
				String shippingNo = rs.getString(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				Long totalPrice = rs.getLong(4);
				String destination = rs.getString(5);


				OrdersVo vo = new OrdersVo();
				
				vo.setShippingNo(shippingNo);
				vo.setTotalPrice(totalPrice);
				vo.setDestination(destination);
				vo.setName(name);
				vo.setEmail(email);
				
				
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
	
	public List<OrdersVo> ordersBookFindAll(){
		List<OrdersVo> result = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			// 도서번호, 도서제목, 수량
			String sql = "select a.no, a.title, b.amount\r\n" + 
					"from book a, orders_book b\r\n" + 
					"where a.no = b.book_no";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			// 5. 결과 가져오기
			while(rs.next()) {
				// ()안은 인덱스를 가져오는게 좋다.
				Long bookNo = rs.getLong(1);
				String title = rs.getString(2);
				int amount = rs.getInt(3);

				OrdersVo vo = new OrdersVo();
				
				vo.setBookNo(bookNo);;
				vo.setTitle(title);
				vo.setAmount(amount);
				
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

	public Boolean ordersInsert(OrdersVo ordersVo) {

		Boolean result  = false;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();

			String sql = "insert into orders values(null, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ordersVo.getShippingNo());
			pstmt.setLong(2, ordersVo.getTotalPrice());
			pstmt.setString(3, ordersVo.getDestination());
			pstmt.setLong(4, ordersVo.getMemberNo());

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

	
	public Boolean ordersBookInsert(OrdersVo ordersVo) {

		Boolean result  = false;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			// book_no, order_no, amount
			String sql = "insert into orders_book values(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, ordersVo.getBookNo());
			pstmt.setLong(2, ordersVo.getOrdersNo());
			pstmt.setInt(3, ordersVo.getAmount());

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


