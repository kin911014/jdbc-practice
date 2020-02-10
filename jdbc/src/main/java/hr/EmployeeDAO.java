package hr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {
	public Boolean insert(EmployeeVO vo) {
		return false;
	}
	public Boolean delete(Long no) {
		return false;
	}
	public Boolean delete(String firstName) {
		return false;
	}
	public Boolean update(EmployeeVO vo) {
		return false;
	}
	public List<EmployeeVO> findByName(EmployeeVO vo){
		List<EmployeeVO> result = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 1. JDBC Driver(MySQL)  로딩
			Class.forName("com.mysql.jdbc.Driver");
			
// 2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/employees";
			conn = DriverManager.getConnection(url, "hr", "hr");
			
// 3. SQL문 준비(Prepare, 완성된뭐리x , 파라미터 바인딩)
			String sql = "select emp_no, first_name, last_name, hire_date\r\n" + 
					"from employees\r\n" + 
					"where first_name like ?\r\n" + 
					"order by first_name";
			pstmt = conn.prepareStatement(sql);
			
// 4. 바인딩
			pstmt.setString(1, "%" + vo.getFirstName() + "%");
			
// 5. SQL문 실행
			rs = pstmt.executeQuery();
			
//5. 결과 바인딩 가져오기
			while(rs.next()) {
				// ()안은 인덱스를 가져오는게 좋다.
				Long no = rs.getLong(1);
				String firstName = rs.getString(2);
				String lastName = rs.getString(3);
				String hireDate = rs.getString(4);
				
				EmployeeVO employeeVo = new EmployeeVO();
				employeeVo.setNo(no);
				employeeVo.setFirstName(firstName);
				employeeVo.setLastName(lastName);
				employeeVo.setHireDate(hireDate);
				
				result.add(employeeVo);
				
			}
			
		}catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패 : " + e);
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
				}if(rs != null) {
					rs.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
}