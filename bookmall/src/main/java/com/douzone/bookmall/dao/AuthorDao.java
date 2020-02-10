package com.douzone.bookmall.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.douzone.bookmall.vo.AuthorVo;

public class AuthorDao {
	
	public List<AuthorVo> findAll(){
		List<AuthorVo> result = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		conn = getConnection();
		
		String sql = "select no, name from author";
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		// 5. 결과 가져오기
		while(rs.next()) {
			// ()안은 인덱스를 가져오는게 좋다.
			Long no = rs.getLong(1);
			String name = rs.getString(2);
			
			AuthorVo vo = new AuthorVo();
			vo.setNo(no);
			vo.setName(name);
			
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
	public Boolean insert(AuthorVo authorVo) {
		
		Boolean result  = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
		conn = getConnection();
		
		String sql = "insert into author values(null, ?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, authorVo.getName());
		
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

	public Boolean delete(AuthorVo authorVo) {
		
		Boolean result  = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
		conn = getConnection();
		
		String sql = "delete from author where no = ?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setLong(1, authorVo.getNo());
		
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

	public Boolean update(AuthorVo authorVo, String rename) {
	
		Boolean result  = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
		conn = getConnection();
		
		String sql = "update author set name = ? where name = ?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, rename);
		pstmt.setString(2, authorVo.getName());
		
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

	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			// 1. JDBC Driver(MySQL)  로딩
		Class.forName("com.mysql.jdbc.Driver");

		// 2. 연결하기
		String url = "jdbc:mysql://127.0.0.1:3306/webdb";
		conn = DriverManager.getConnection(url, "webdb", "webdb");
		}catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패 : " + e);
		}
		
		return conn;
	}
}