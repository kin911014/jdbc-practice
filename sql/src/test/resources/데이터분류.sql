-- 데이터 분류

-- SELECT(DISTINCT) 칼럼명(ALIAS) FROM 테이블명 WHERE 조건식 GROUP BY 칼럼명 HAVING 조건식 ORDER BY 칼럼이나 표현식 (ASC 또는 DESC)
-- GROUP BY: 전체 데이터를 같은 이름끼리 소그룹으로 나눈 루 칼럼을 명시, HAVING: GROUP에 대한 조건을 기술

-- 예제1 : 현재, 각 사원별로 평균연봉 출력
select emp_no, salary
from salaries
group by emp_no;

select *
from salaries
group by emp_no;

select emp_no, avg(salary)
  from salaries
  where to_date = '9999-01-01'
 group by emp_no -- group by로 row가 늘어나고 order by 를 사용할 수 있다. 지금은 select절에 올라 갈 수 있다.
 order by avg(salary) desc; -- order by의 avg(salary)는 위에서 구한 표를 이용한 것이므로 느려지지 않는다, 걱정 x
 
 -- 예제 3:  사원별 몇 번의 직책 변경이 있었는지 조회 
  select emp_no, count(*) -- group이 올라옴
	from titles
group by emp_no
order by count(*) desc;

select emp_no, count(title)
from titles
group by emp_no;

 -- 예제 : 각 사원별로 평균연봉 출력하되 50,000불 이상인 직원만 출력
 -- 5만불 이상 모인 곳은 group by로 집계를 낸 것이므로 where절은 이미 지나왔으니 사용x, having절에서 사용가능하다.
 select emp_no,avg(salary)
 from salaries
 group by emp_no
 having avg(salary) >= 50000;
 
 -- 예제 5: 현재 직책별로 인원수를 구하되 직책별로 인원이 100명 이상인 직책만 출력하세요.
 select title, count(*)
 from titles
 where to_date = '9999-01-01'
 group by title
 having count(*)>=100;
 
 
 
 
 
 
 
 
 select title, count(*)
 from titles 
 where to_date = '9999-01-01' -- 현재라는 조건으로 where를 사용
 group by title
 having count(*) >= 100
 order by count(*) desc; -- asc는 작은값부터 출력 desc는 큰 값부터 출력
 
 -- 예제6: 현재 부서별로 현재 직책이 Engineer인 직원들에 대해서만 
 --       평균급여를 구하세요.
	

--  예제7: 현재 직책별로 급여의 총합을 구하되 Engineer직책은 제외하세요
--        단, 총합이 2,000,000,000이상인 직책만 나타내며 급여총합에
--        대해서 내림차순(DESC)로 정렬하세요.  

select a.title, sum(b.salary) 
from titles a, salaries b
where a.emp_no = b.emp_no        -- 조인 조건
  and a.to_date = '9999-01-01'	 -- row 선택 조건 1
  and b.to_date = '9999-01-01'   -- row 선택 조건 2
  and a.title != 'Engineer'
  group by a.title;
  -- having sum(b.salary) >= 200000000
  -- order by sum(b.salary);
  
  select * from employees;

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 