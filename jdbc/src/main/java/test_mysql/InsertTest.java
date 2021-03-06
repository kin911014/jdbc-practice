package test_mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertTest {

	public static void main(String[] args) {
		Boolean result = insert("기획팀");
		if(result) {
			System.out.println("성공");
		}

	}
	
	public static boolean insert(String name) {
		Boolean result  = null;
		Connection conn = null;
		Statement stmt = null;
		try {
			// 1. JDBC Driver(MySQL)  로딩
		Class.forName("com.mysql.jdbc.Driver");

		// 2. 연결하기
		String url = "jdbc:mysql://127.0.0.1:3306/webdb";
		conn = DriverManager.getConnection(url, "webdb", "webdb");
		
		// 3. statement 객체생성
		stmt = conn.createStatement();
		
		// 4. sql문 실행 (아래는 workspace에서 ;를 제외한 구문을 복붙)
		String sql = "insert into dept values(null, '" + name + "')";
		int count = stmt.executeUpdate(sql);
		
		// 5. 성공여부
		result = count == 1;
		
		// statement.executeQuery("select....") => resultSet
		// statement.executeUpdate("update... or insert... or delete ") => int
		}catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패 : " + e);
		} catch (SQLException e) {
			System.out.println("error : " + e);
		}finally {
			// 6. 자원정리
			try {
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
}
