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

select lpad('hi', 5, '?'), rpad('joe', 7, '*');

-- salaries 테이블에서 2001년 급여가 70000불 이하의 직원만 사번, 급여로 출력하되 급여는 10자리로 부족한 자리수는 *로 표시
select emp_no, lpad(cast(salary as char), 10, '*')
from salaries
where substring(from_date,1,4) =  '2001'
and salary < 70000;

select emp_no, lpad(cast(salary as char), 10, '*') -- *지우면 레프트 정렬로 자주 사용	 
from salaries 
where substring(from_date, 1, 4) = 2001
 and salary < 70000;

select concat( '---', ltrim('    hello    '), '---'),
	concat( '---', rtrim('    hello    '), '---');
    
select concat( '---', trim('    hello	'), '---'),  -- trim은 공백을 없애준다.
	   concat( '---', trim(both 'X' from 'XXXXhelloXXXX'), '---'), -- 특정 문자를 없앤다
       concat( '---', trim(leading 'X' from 'XXXXhelloXXXX'), '---'), -- 왼쪽에 있는 특정 문자를 없앤다
       concat( '---', trim(trailing 'X' from 'XXXXhelloXXXX'), '---'); -- 오른쪽에 있는 특정 문자를 없앤다

-- salaries 테이블에 대한 LPAD 예제의 결과를 *생략하여 표시

select emp_no, trim(leading '*' from lpad(cast(salary as char), 10, '*')) -- *지우면 레프트 정렬로 자주 사용	 
from salaries 
where substring(from_date, 1, 4) = 2001
 and salary < 70000;
