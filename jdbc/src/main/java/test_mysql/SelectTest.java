package test_mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SelectTest {

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			// 1. JDBC Driver(MySQL)  로딩
		Class.forName("com.mysql.jdbc.Driver");

		// 2. 연결하기
		String url = "jdbc:mysql://127.0.0.1:3306/webdb";
		conn = DriverManager.getConnection(url, "webdb", "webdb");
		
		// 3. statement 객체생성
		stmt = conn.createStatement();
		
		// 4. sql문 실행 (아래는 workspace에서 ;를 제외한 구문을 복붙)
		String sql = "select no, name from dept";
		rs = stmt.executeQuery(sql);
		
		// 5. 결과 가져오기
		while(rs.next()) {
			// ()안은 인덱스를 가져오는게 좋다.
			Long no = rs.getLong(1);
			String name = rs.getString(2);
			System.out.println(no + ":" + name);
		}
		
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
				}if(rs != null) {
					rs.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		

	}

}
