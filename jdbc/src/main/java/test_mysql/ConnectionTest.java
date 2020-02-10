package test_mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionTest {
	public static void main(String[] args) {
		// 1. JDBC Driver(MySQL)  로딩
		// 직접 로딩할수있는 이유는 드라이버를 로딩하면서 connection을 만든다. 그래서 rect r = new Rect();와 같이 안해도 된다.
		// 이름은 exerd의 포워드엔지니어링에 있다.  => com.mysql.jdbc.Driver
		Connection connection = null;
		try {
		Class.forName("com.mysql.jdbc.Driver");

		// 2. 연결하기
		String url = "jdbc:mysql://127.0.0.1:3306/webdb";
		// 왼쪽 webdb는 id, 오른쪽 webdb는 pw이다.
		connection = DriverManager.getConnection(url, "webdb", "webdb");
		
		System.out.println("연결성공");
		}catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패 : " + e);
		} catch (SQLException e) {
			System.out.println("error : " + e);
		}finally {
			// 3. 자원정리
			try {
				if(connection != null) {
					connection.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		

	}

}
