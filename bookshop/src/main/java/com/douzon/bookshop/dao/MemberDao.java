package com.douzon.bookshop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.douzon.bookshop.vo.MemberVo;

public class MemberDao {
	// 전체 찾기 함수
		public List<MemberVo> findAll(){
			List<MemberVo> result = new ArrayList<>();
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
			conn = getConnection();
			
			String sql = "select no, name, phone_no, email, password from member"; 
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			// 5. 결과 가져오기
			while(rs.next()) {
				// ()안은 인덱스를 가져오는게 좋다.
				Long no = rs.getLong(1);
				String name = rs.getString(2);
				String phoneNo = rs.getString(3);
				String email = rs.getString(4);
				String password = rs.getString(5);
				
				
				MemberVo vo = new MemberVo();
				vo.setNo(no);
				vo.setName(name);
				vo.setPhoneNo(phoneNo);
				vo.setEmail(email);
				vo.setPassword(password);
				
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
		
		public Boolean insert(MemberVo memberVo) {
			
			Boolean result  = false;
			Connection conn = null;
			PreparedStatement pstmt = null;
				
			try {
			conn = getConnection();
			
			String sql = "insert into member values(null, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			//이름, 전화번호, 이메일, 비밀번호
			pstmt.setString(1, memberVo.getName());
			pstmt.setString(2, memberVo.getPhoneNo());
			pstmt.setString(3, memberVo.getEmail());
			pstmt.setString(4, memberVo.getPassword());
				
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
