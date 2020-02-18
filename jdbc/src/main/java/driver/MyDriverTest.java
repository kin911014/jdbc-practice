package driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDriverTest {

	public static void main(String[] args) {
		try {
			// 1. JDBC Driver(MyDriver) 로딩
			// exerd의 포워딩 마지막 단계의 org.~이 있다.
			Class.forName("org.mariadb.jdbc.Driver");

			// 2. 연결하기
			String url = "jdbc:mysql://192.168.1.105:3307/webdb";
			Connection conn = DriverManager.getConnection(url, "webdb", "webdb");
			System.out.println(conn);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}