insert into dept values(null, '개발팀');
insert into dept values(null, '총무팀');
insert into dept values(null, '영업팀');


insert into emp values(null, '둘리', 1);
insert into emp values(null, '마이콜', 2);
insert into emp values(null, '또치', 3);
insert into emp values(null, '도우넛', 1);
insert into dept values(null, '고길동', null);
select * from dept;
select * from emp;


 select a.name, b.name
 from dept a, emp b  -- 아리야스식 
 where a.no = b.dept_no; -- 조인조건


select *
from dept a; 
 -- 하나 이상의 테이블로부터 연관된 데이터를 검색해 오는 방법 Primary Key(PK) 와 Foreign Key(FK) 값의 연관에 의해 JOIN이 성립
 --   ( 아닌 경우도 있다. 논리적인 값들의 연관으로만 성립 가능) 위 코드는 cartesan join방식으로 join을 사용하지 않고 하는 join방법.
 
 -- (inner)join: 조인 조건을 만족하는 행에 대해서만 결과값이 나오는 조인.  문법: SELECT A FROM B JOIN C ON b.no = c.no; (JOIN~ON)
 --       Natural, JOIN~USING (두개는 거의 사용X) 표준도 쓸 수 있고, innerjoin으로도 쓸 수 있지만 수업은 inner로 수업
 -- (outer) join: 조인 조건을 만족하지 않아도 출력이 가능해야하는 결과를 얻고자 할 때 사용. 
 -- 문법: SELECT A FROM B (RIGHT or LEFT or full(mysql은 fulljoin지원x ))JOIN C ON B.no = C.no; 표준만 사용
 -- equijoin :  =(equal) 연산자를 사용하는 조인 'n-1'이 중요 row를 선택하는 조건이 있기 떄문
 
 -- 예제 6-1: 현재 직책이 engineer인 직원들에 대해서만 평균급여를 구하시오

select avg(salary) as 평균급여
from titles a,
	 salaries b
where a.emp_no = b.emp_no
  and a.to_date = '9999-01-01'
  and b.to_date = '9999-01-01'
  and a.title = 'Engineer';
 -- 예제 6-2: 현재 부서별로 현재 직책이 engineer인 직원들에 대해서만 평균급여
 select *
 from titles a, 
	  salaries b
 where a.emp_no = b.emp_no;
   
 
 select *
 from title a, 
	 dept_emp b,
     salaries c
where a.emp_no = b.emp_no
  and b.emp_no = c.emp_no;
 
 
 select c.dept_no, d.dept_name, avg(salary)
 from titles a,
	  salaries b,
      dept_emp c
where a.emp_no = b.emp_no -- where절에서 큰 테이블을 하나로
and b.emp_no = c.emp_no
and c.dept_no = d.dept_no
and a.to_date = '9999-01-01'
and a.to_date = '9999-01-01'
and c.to_date = '9999-01-01'
and a.title = 'Engineer'
group by c.dept_no;


--  예제7: 
--        단, 총합이 2,000,000,000이상인 직책만 나타내며 급여총합에
--        대해서 내림차순(DESC)로 정렬하세요.  

select a.title, sum(b.salary) 
from titles a, salaries b
where a.emp_no = b.emp_no        -- 조인 조건
  and a.to_date = '9999-01-01'	 -- row 선택 조건 1
  and b.to_date = '9999-01-01'   -- row 선택 조건 2
  and a.title != 'Engineer'
  group by a.title;
  
 select * 
from salaries;

 -- 20.01.23 수업
-- 예제 8: employees 테이블과 titles 테이블을 join하여 직원의 이름과 직책을 모두 출력 하세요. erd-employees보고 참고할 것!



select concat(a.first_name, ' ', a.last_name) as name,
	   b.title    
  from employees a,  -- a, b 설정은 아리아스 설정이라고 함
	   titles b
where a.emp_no = b.emp_no;

-- 예제 10: 직원의 이름과 직책을 모두 출력하되 여성 엔지니어만 출력하세요

select concat(a.first_name, ' ', a.last_name) as name,
	   b.title
from employees a,
	 titles b
where a.emp_no = b.emp_no
 and a.gender = 'f'
 and b.title = 'engineer';

select concat(a.first_name, ' ', a.last_name) as name,
	   b.title    
  from employees a,  -- a, b 설정은 아리아스 설정이라고 함
	   titles b
where a.emp_no = b.emp_no
  and a.gender = 'F'
  and b.title = 'engineer';
  
  
-- ANSI/ISO SQL 1999를 따르는 ANSI JOIN 문법
-- natural join: 두 테이블에 공통 칼럼이 있으면 별다른 조인 조건 없이 묵시적으로 조인됨
-- but 쓸 일이 없다!!
select concat(a.first_name, ' ', a.last_name) as name,
	   b.title    
  from employees a  
  join titles b; -- on절 없이 자동으로 같은 칼럼이 조인된다. natural 조인 
--     on a.emp_no = b.emp_no; -- 생략되어 있는 부분
  
-- join ~ using: natural join의 문제점을 대체 
-- but join~on을 사용하는것을 추천!
select concat(a.first_name, ' ', a.last_name) as name,
	   b.title    
  from employees a  
  join titles b using (emp_no);  -- using a, a부분에 (공통되는 부분)을 쓴다.

-- Join ~ On: 가장 보편적으로 쓰이는 문법

select concat(a.first_name, ' ', a.last_name) as name,
	   b.title    
  from employees a  
  join titles b on a.emp_no = b.emp_no;
  
  
  -- 예제 11: 직원의 이름과 직책을 모두 출력하되 여성 엔지니어만 출력하세요 (join ~ on으로 예시)
 --   join on or equijoin 둘중하나 맘에 드는것으로 사용하면된다. 기능적인 차이 없음!
select concat(a.first_name, ' ', a.last_name) as name,
	   b.title    
  from employees a 
  join titles b on a.emp_no = b.emp_no
  where a.gender = 'F'
  and b.title = 'engineer';
  
  
-- 실습문제 1:  현재 회사 상황을 반영한 직원별 근무부서를  사번, 직원 전체이름, 근무부서 형태로 출력해 보세요.
select a.emp_no as 사번,
	   concat(a.first_name, ' ', a.last_name) as 직원이름,
	   c.dept_name as 근무부서
from employees a,
	 dept_emp b,
     departments c
where a.emp_no = b.emp_no
and   b.dept_no = c.dept_no
and   b.to_date = '9999-01-01';


select a.emp_no, concat(a.first_name, ' ', a.last_name) as name, c.dept_name
from employees a
join dept_emp b on a.emp_no = b.emp_no
join departments c on b.dept_no = c.dept_no
where b.to_date = '9999-01-01';

select count(*)
from employees a
left join dept_emp b  on a.emp_no = b.emp_no
join departments c on b.dept_no = c.dept_no
where b.to_date = '9999-01-01';

-- 실습문제 2:  현재 회사에서 지급되고 있는 급여체계를 반영한 결과를 출력하세요. 사번,  전체이름, 연봉  이런 형태로 출력하세요.
select a.emp_no as 사번,
concat(b.first_name, ' ', b.last_name) as 이름,
a.salary 
from salaries a,
employees b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01';


select a.emp_no, concat(a.first_name, ' ', a.last_name) as name, b.salary
from employees a, salaries b
where a.emp_no = b.emp_no
 and b.to_date = '9999-01-01';
 
