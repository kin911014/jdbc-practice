package driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDriverTest {

	public static void main(String[] args) {
		try {
			// 1. JDBC Driver(MyDriver) 로딩
			Class.forName("driver.MyDriver");

			// 2. 연결하기
			String url = "jdbc:mydb://127.0.0.1:9999/webdb";
			Connection conn = DriverManager.getConnection(url, "webdb", "webdb");
			System.out.println(conn);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}