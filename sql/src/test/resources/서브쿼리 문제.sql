

select c.dept_no,a.first_name, b.salary
from employees a,
	 salaries b,
	 dept_emp c,
     (select a.dept_no, max(salary) as max_salary
from dept_emp a,
	 salaries b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
group by a.dept_no) d
where a.emp_no = b.emp_no
and b.emp_no = c.emp_no
and c.dept_no = d.dept_no
and b.salary = d.max_salary
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01';




