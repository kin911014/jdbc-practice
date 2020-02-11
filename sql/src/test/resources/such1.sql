-- 예제: 전체 데이터 검색
select * from departments;

show tables; 
-- select count(*) 뭔지알아보기

-- SELECT(DISTINCT) 칼럼명(ALIAS)
-- FROM 테이블명
-- WHERE 조건식
-- ORDER BY 칼럼이나 표현식 (ASC 또는 DESC)
-- 예제ㅣ employees 테이블에서 직원의 이름, 성별, 입사일 출력 (projection)
select first_name, last_name, gender, hire_date
	from employees;

-- 예제: employees 테이블에서 직원의 전체이름, 성별, 입사일을 입사일 순으로  출력(별칭부여)
select first_name, last_name as '전체이름',
	gender as '성별',
    hire_date as '입사일'
 from employees;
 
 
 
 

-- 예제: titles테이블에서 직급은 어떤 것들이 있는지 직급이름을 한번씩만 출력
select distinct(title) from titles;
-- 예제ㅣ employees 테이블에서 직원의 전체 이름, 성별, 입사일을 입사일순으로 출력
select concat(first_name,' ', last_name) as '전체이름',
	gender as '성별',
    hire_date as'입사일'
	from employees
order by hire_date asc;
-- order by '입사일' asc;

-- 예제 salaries 테이블에서 2001년 월급을 가장 높은순으로 사번, 월급순으로 출력
select emp_no as 사번,
salary as 월급
from salaries
where from_date like '2001-%-%'
order by salary asc; 
 
 -- 예제 : employees 테이블에서 1991년 이전에 입사한 직원의 이름, 성별, 입사일을 출력
 select concat(first_name,' ', last_name) as '전체이름',
	gender as '성별',
    hire_date as'입사일'
	from employees
    where hire_date < '1991-01-01'
order by hire_date desc;

-- 예제 employees 테이블에서 1989년 이전에 입사한 여직원의 이름, 입사일을 출력

 select concat(first_name,' ', last_name) as '전체이름',
	gender as '성별',
    hire_date as'입사일'
	from employees
    where hire_date < '1989-01-01'
    and gender = 'F'
order by hire_date desc;


-- 예제 : dept_emp 테이블에서 부서 번호가 d005나 d009에 속한 사원의 사번, 부서번호 출력
 
select emp_no, dept_no
 from dept_emp
where dept_no = 'd005'
   or dept_no = 'd009';
   
select emp_no, dept_no
  from dept_emp
  where dept_no in ('d005', 'd009');
 
     

-- 예제: dept_emp 테이블에서 부서이름에 s가 들어간 부서에 속한 사원의 사번, 부서번호 출력
select emp_no, dept_no
from dept_emp
where dept_no in (select dept_no from departments where dept_name like '%s%');

-- employees 테이블에서 1989년에 입사한 직원의 이름, 입사일을 출력
select concat(first_name, ' ', last_name) as '전체이름',
		gender as '성별',
        hire_date as '입사일'
	from employees
    where hire_date >= '1988-12-31'
    and hire_date <= '1990-01-01';

-- 1.22
-- 문자형 함수

select upper('Seoul'), ucase('seoul');

-- 예제 : employees 테이블에서 last_name이 acton인 사원의 이름, 성별, 입사일 출력
	
    select upper(concat(first_name, ' ', last_name)) as '전체이름',
		gender as '성별',
        hire_date as '입사일'
	from employees
    where last_name = 'ACTION';

-- 
select substring('Happy Day',3 ,2 );

-- employees 테이블에서 1989년에 입사한 직원의 이름, 입사일을 출력
select upper(concat(first_name, ' ', last_name)) as '전체이름',
		gender as '성별',
        hire_date as '입사일'
	from employees
	where substring(hire_date, 1, 4) = '1989';

select lpad('hi', 5, '?'), lpad('joe', 7, '*');

-- salaries 테이블에서 2001년 급여가 70000불 이하의 직원만 사번, 급여로 출력하되 급여는 10자리로 부족한 자리수는 *로 표시

select emp_no, lapd(cast(salary as char), 10, '*') -- *지우면 레프트 정렬로 자주 사용	 
from salaries 
where substring(from_date, 1, 4) = 2001
 and salary < 70000;

select concat( '---', ltrim('    hello    '), '---'),
	concat( '---', rtrim('    hello    '), '---');
    
select concat( '---', trim('    hello    '), '---'),
	   concat( '---', trim(both 'X' from 'XXXXhelloXXXX'), '---'), -- 특정 문자를 없앤다
       concat( '---', trim(leading 'X' from 'XXXXhelloXXXX'), '---'), -- 왼쪽에 있는 특정 문자를 없앤다
       concat( '---', trim(trailing 'X' from 'XXXXhelloXXXX'), '---'); -- 오른쪽에 있는 특정 문자를 없앤다

-- salaries 테이블에 대한 LPAD 예제의 결과를 *생략하여 표시

select emp_no, lapd(cast(salary as char), 10, '*') -- *지우면 레프트 정렬로 자주 사용	 
from salaries 
where substring(from_date, 1, 4) = 2001
 and salary < 70000;




    
    