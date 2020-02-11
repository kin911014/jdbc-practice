-- 서브쿼리(SUBQUERY) SQL 문제입니다.

-- 문제1. 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?

select floor(avg(a.salary))
from salaries a
where a.to_date = '9999-01-01';

select count(salary)
from employees a, salaries b
where a.emp_no = b.emp_no
and b.to_date = '9999-01-01'
and b.salary > (select floor(avg(a.salary))
from salaries a
where a.to_date = '9999-01-01');


-- 문제2. 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다.  

select a.emp_no as 사번, a.last_name as 이름, d.dept_name as 부서, max(b.salary) as 연봉
from employees a, salaries b, dept_emp c, departments d
where a.emp_no = b.emp_no
and   b.emp_no = c.emp_no
and   c.dept_no = d.dept_no
and   b.to_date = '9999-01-01'
and   c.to_date = '9999-01-01'
group by d.dept_name
having max(b.salary)
order by 연봉 desc;
-- /////////////////////sol 2////////////////////////////
-- 문제2. 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다.  
select a.emp_no, a.last_name, c.dept_name
from employees a, dept_emp b, departments c
where a.emp_no = b.emp_no
and   b.dept_no = c.dept_no
and   b.to_date = '9999-01-01';

select b.emp_no, b.last_name, b.dept_name, max(a.salary)
from salaries a,
(select a.emp_no, a.last_name, c.dept_name
from employees a, dept_emp b, departments c
where a.emp_no = b.emp_no
and   b.dept_no = c.dept_no
and   b.to_date = '9999-01-01') b
where a.emp_no = b.emp_no
and   a.to_date = '9999-01-01'
group by b.dept_name
having max(salary)
order by max(salary) desc;




-- 문제3.현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 

select b.dept_no , avg(a.salary) as 평균연봉
from salaries a, dept_emp b
where a.emp_no = b.emp_no
and   a.to_date = '9999-01-01'
and   b.to_date = '9999-01-01'
group by b.dept_no;

select a.emp_no , a.last_name, c.salary
from employees a, dept_emp b, salaries c, 
(select b.dept_no , avg(a.salary) as 평균연봉
from salaries a, dept_emp b
where a.emp_no = b.emp_no
and   a.to_date = '9999-01-01'
and   b.to_date = '9999-01-01'
group by b.dept_no) d
where a.emp_no = b.emp_no
and   b.emp_no = c.emp_no
and   b.dept_no = d.dept_no
and   b.to_date = '9999-01-01'
and   c.to_date = '9999-01-01'
and   c.salary > d.평균연봉;


-- 문제4. 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.

select a.dept_no , a.to_date, b.dept_name, c.last_name
from dept_manager a, departments b, employees c
where a.dept_no = b.dept_no
and   a.emp_no = c.emp_no
and   a.to_date = '9999-01-01';

select a.emp_no as 사번, a.last_name as , d.매니저이름, c.dept_name as 부서이름
from employees a,
	 dept_emp b,
     departments c,
     (select a.dept_no , a.to_date, b.dept_name, c.last_name as 매니저이름
from dept_manager a, departments b, employees c
where a.dept_no = b.dept_no
and   a.emp_no = c.emp_no
and   a.to_date = '9999-01-01') d
where   a.emp_no = b.emp_no
and   b.dept_no = c.dept_no
and   c.dept_no = d.dept_no
and   b.to_date = '9999-01-01';


-- 문제5. 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
select dept_no
from dept_emp a, salaries b
where a.emp_no = b.emp_no
and   a.to_date = '9999-01-01'
and   b.to_date = '9999-01-01'
group by dept_no
order by avg(salary) desc
limit 1;

select a.emp_no , a.last_name, b.title, c.salary
from employees a, 
titles b, 
salaries c, 
dept_emp d,
(select dept_no
from dept_emp a, salaries b
where a.emp_no = b.emp_no
and   a.to_date = '9999-01-01'
and   b.to_date = '9999-01-01'
group by dept_no
order by avg(salary) desc
limit 1) e
where a.emp_no = b.emp_no
and   b.emp_no = c.emp_no
and   c.emp_no = d.emp_no
and   d.dept_no = e.dept_no
and   b.to_date = '9999-01-01'
and   c.to_date = '9999-01-01'
and   d.to_date = '9999-01-01'
order by c.salary desc; 



-- 문제6. 평균 연봉이 가장 높은 부서는? 
select c.dept_name, avg(b.salary)
from dept_emp a, salaries b, departments c
where a.emp_no = b.emp_no
and   a.dept_no = c.dept_no
group by c.dept_name
order by avg(b.salary) desc
limit 1;
-- 문제7.평균 연봉이 가장 높은 직책?


select a.title , avg(b.salary)
from titles a, salaries b
where a.emp_no = b.emp_no
group by a.title
order by avg(b.salary) desc
limit 1;
-- 문제8.현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.

select a.dept_no, c.last_name, b.salary 
from dept_manager a, salaries b, employees c
where a.emp_no = b.emp_no
and   b.emp_no = c.emp_no
and   a.to_date = '9999-01-01'
and   b.to_date = '9999-01-01';

select c.dept_name, a.last_name, d.salary, e.매니저이름, e.매니저연봉
from employees a,
 dept_emp b, 
 departments c, 
 salaries d,
 (select a.dept_no as 부서번호, c.last_name as 매니저이름, b.salary as 매니저연봉
from dept_manager a, salaries b, employees c
where a.emp_no = b.emp_no
and   b.emp_no = c.emp_no
and   a.to_date = '9999-01-01'
and   b.to_date = '9999-01-01'
) e
where a.emp_no = b.emp_no
and   b.emp_no = d.emp_no
and   b.dept_no = c.dept_no
and   c.dept_no = e.부서번호
and   b.to_date = '9999-01-01'
and   d.to_date = '9999-01-01'
and   d.salary > e.매니저연봉;
