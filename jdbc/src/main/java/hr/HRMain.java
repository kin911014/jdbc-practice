package hr;

import java.util.List;
import java.util.Scanner;

public class HRMain {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("이름>");
		String name = scanner.nextLine();
		
		EmployeeVO employeeVo = new EmployeeVO();
		employeeVo.setFirstName(name);
		
		EmployeeDAO dao = new EmployeeDAO();
		List<EmployeeVO> list = dao.findByName(employeeVo);
		
		for(EmployeeVO vo : list) {
			System.out.println(vo);
		}
		
		scanner.close();

	}

}
