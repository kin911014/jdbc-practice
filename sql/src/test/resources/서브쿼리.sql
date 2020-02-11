 -- 서브쿼리 : select문 안에 포함되어 있는 select문장 order by절을 포함 할 수 없음, 괄호로 묶여있어야한다.
 -- select절에 오는 경우
 -- from절의 서브뭐리
 select *
 from (select now(), sysdate(), 3+1) a;  -- a라는 테이블 이름을 임의로 준 것

 select now() as a, sysdate() as b , 3+1 as c;
 
 -- where절의 서브쿼리: 단일행, 단일행 연산자: > , < , = , <= , >= , <>(같지않다의 의미)
 -- where절에 둘 경우 from~ where c = (~~) {(~~)는 단일행이어야한다. 그러나  in (~~)는 복수행으로 가능} 

-- where c1 = ();
 
 -- 예제: 현재 Fai Bale이 근무하는 부서에서 근무하는 직원의 사번, 전체이름을 출력 
 
 select b.dept_no
   from employees a, dept_emp b
   where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01' -- "현재" 라는 말로 인해 다음과 같은 조건 건다.
   and concat(a.first_name, ' ', a.last_name) = 'Fai Bale'; 
   
select a.emp_no, concat(a.first_name, ' ', a.last_name)
from employees a, dept_emp b
   where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01' -- "현재" 라는 말로 인해 다음과 같은 조건 건다.
   and b.dept_no = 'd004';

-- 위 두개를 합침 -- 행 정리는 ctrl + b하면 된다.
select *
from 


SELECT 
    a.emp_no, CONCAT(a.first_name, ' ', a.last_name)
FROM
    employees a,
    mept_emp b
WHERE
    a.emp_no = b.emp_no
        AND b.to_date = '9999-01-01'
        AND b.dept_no = (
        SELECT 
            b.dept_no
        FROM
            employees a,
            mept_emp b
        WHERE
            a.emp_no = b.emp_no
                AND b.to_date = '9999-01-01'
                AND CONCAT(a.first_name, ' ', a.last_name) = 'Fai Bale');
                
-- 실습문제 1:   현재 전체사원의 평균 연봉보다 적은 급여를 받는 사원의  이름, 급여를 나타내세요.



select avg(salary)
from salaries 
where to_date = '9999-01-01';

select a.first_name, b.salary
from employees a,
     salaries b
where a.emp_no = b.emp_no
  and b.to_date = '9999-01-01'
  and b.salary < 72012.2359
order by b.salary desc;

-- 위 두개 합침
select a.first_name, b.salary
from employees a,
     salaries b
where a.emp_no = b.emp_no
  and b.to_date = '9999-01-01'
  and b.salary < (select avg(salary)
				  from salaries 
				  where to_date = '9999-01-01')
order by b.salary desc;

-- 실습문제 2:   현재 가장 적은 평균 급여를 받고 있는 직책의 평균 급여를 구하세요 
-- Engineer 45000 딱 이렇게 결과가나와야한다.


select b.title , floor(avg(a.salary))
from salaries a, titles b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
group by b.title
order by floor(avg(a.salary)) asc
limit 1;

select a.title , b.salary
from titles a, salaries b
where a.emp_no = b.emp_no
and b.to_date = '9999-01-01';
-- and avg(b.salary);


-- 1) 직책 별 병균 급여 중 가장 적은 평균 급여 방법 1(복잡한 방법)
select min(avg_salary)
from (  select a.title, round(avg(b.salary)) as avg_salary
		from titles a, salaries b
		where a.emp_no = b.emp_no
		and a.to_date = '9999-01-01'
		and b.to_date = '9999-01-01'
		group by a.title) a;
        
select a.title, avg(b.salary) as avg_salary
		from titles a, salaries b
		where a.emp_no = b.emp_no
		and a.to_date = '9999-01-01'
		and b.to_date = '9999-01-01'
		group by a.title
		having avg_salary = (select min(avg_salary)
from (  select a.title, round(avg(b.salary)) as avg_salary
		from titles a, salaries b
		where a.emp_no = b.emp_no
		and a.to_date = '9999-01-01'
		and b.to_date = '9999-01-01'
		group by a.title) a); -- 소수 몇째자리는 계산이 어긋날 수 있으므로 round로 반올림 해서 한다.

-- 2) 직책 별 병균 급여 중 가장 적은 평균 급여 방법 2 
-- TOP-K: order by 한 후 top부터 k개를 빼내는 것
select a.title, round(avg(b.salary)) as avg_salary
  from titles a, salaries b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
group by a.title
order by avg(b.salary) asc
limit 1;
        
        
select a.title, avg(b.salary) as avg_salary
		from titles a, salaries b
		where a.emp_no = b.emp_no
		and a.to_date = '9999-01-01'
		and b.to_date = '9999-01-01'
		group by a.title
		having avg_salary = (select min(avg_salary)
from (  select a.title, round(avg(b.salary)) as avg_salary
		from titles a, salaries b
		where a.emp_no = b.emp_no
		and a.to_date = '9999-01-01'
		and b.to_date = '9999-01-01'
		group by a.title) a);
-- 쿼리는 같은 결과에 시간이 줄어들을 수록 좋은 결과물이다.        
        
-- solution 3 join으로만 해결 서브쿼리를 사용할 필요 없음
select a.title, round(avg(b.salary)) as avg_salary
		from titles a, salaries b
		where a.emp_no = b.emp_no
		and a.to_date = '9999-01-01'
		and b.to_date = '9999-01-01'
		group by a.title 
        order by avg_salary asc
        limit 1;
        
        
-- where절의 서브쿼리: 복수행
-- 복수행 연산자: in, not in, any, all, 
-- in or not in 사용법 : where c in (10,20,30,40,50)

-- any 사용법 : =any 는 in과 같다. // where c = any (10,20,30,40,50) 
-- >any, >=any : 최소값비교 // where c > (or >= any) (10,20,30,40,50)
-- <any, <=any : 최대값비교 // where c < (or <= any) (10,20,30,40,50)
-- <>any : not in과 동일  // where c <> any (10,20,30,40,50)

-- all 사용법
-- 1. =all 
-- 2. >all, >=all : 최대값 비교 
-- 3. >all, >=all : 최소값 비교


-- 예제:  현재 급여가 50000 이상인 직원 이름 출력 

-- sol1 join만으로 풀기 
select a.first_name, b.salary
from employees a,
	 salaries b
where a.emp_no = b.emp_no
  and b.to_date = '9999-01-01'
  and b.salary > 50000;

-- sol2 in을 사용
select a.first_name, b.salary
from employees a,
	 salaries b
where a.emp_no = b.emp_no
  and b.to_date = '9999-01-01'
  and (a.emp_no, b.salary) in (select emp_no, salary
from salaries
where to_date = '9999-01-01'
  and salary > 50000);
  
select emp_no, salary
from salaries
where to_date = '9999-01-01'
  and salary > 50000;  
  
-- sol3 from절에 놨을 때
select * -- a.first_name, b.salary
from employees a,
	 (select emp_no, salary
	 from salaries
	 where to_date = '9999-01-01'
	 and salary > 50000) b
where a.emp_no = b.emp_no;

-- 강사님 직접제출 예제: 각 부서별로 최고 월급을 받는 직원의 이름과 월급을 출력 // 결과= 둘리  40000

-- sol1: where절에 subquery // in or =any
select a.dept_no, max(salary)
from dept_emp a,
	 salaries b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
group by a.dept_no;

select c.dept_no,a.first_name, b.salary
from employees a, salaries b, dept_emp c
where a.emp_no = b.emp_no
and b.emp_no = c.emp_no
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01'
and (c.dept_no, b.salary) = any (select a.dept_no, max(salary)
from dept_emp a,
	 salaries b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
group by a.dept_no);

-- 조심할 것!!!! 이거 안됨
-- 강사님 직접제출 예제: 각 부서별로 최고 월급을 받는 직원의 이름과 월급을 출력 // 결과= 둘리  40000

select a.dept_no, max(salary)
from dept_emp a,
	 salaries b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
group by a.dept_no;


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




-- sol2: from절에subquery  
