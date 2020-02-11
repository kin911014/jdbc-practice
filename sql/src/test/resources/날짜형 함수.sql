-- 날짜형 함수

-- 오늘 날짜를 YYYY-MM-DD나 YYYYMMDD 형식으로 반환한다. curdate()는 함수, current_date는 상수
select curdate(), current_date;
-- 오늘 현시각을 YYYY-MM-DD HH:MM:SS나 YYYYMMDDHHMMSS 형식으로 반환한다. now와 sysdate는 차이가 있다.
-- new() vs sysdate()
select now(), sleep(2), now();
select sysdate(), sleep(2), sysdate();
-- 차이점 now는 쿼리가 들어간 시간이랑 비교, sysdate는 매 비교할 때의 시간과 비교, 즉 스캐닝을 할때의 시간이므로 가변적이다.
select now(), sysdate(), current_timestamp;

-- DATE_FORMAT(date,format) : 입력된 date를 format 형식으로 반환한다.
select now(), date_format(now(), '%Y');
select now(), date_format(now(), '%Y년 %m월 %d일');
 select now(), date_format(now(), '%Y년 %m월 %d일 %h시 %i분 %s초');
 -- PERIOD_DIFF(p1,p2) : YYMM(2001)이나 YYYYMM(202001)으로 표기되는 p1과 p2의 차이 개월을 반환 한다.
 -- 예제 : 각 직원들에 대해 직원이름과 근무개월수 출력    cast는 숫자형을 문자형으로 변환 계산은 여기서 하지 말것, 개월은 그냥 붙인것 참고!
 select concat(first_name, ' ', last_name) as '전체이름',
		concat(cast(period_diff( date_format(now(), '%Y%m'), date_format(hire_date, '%Y%m')) as char), '개월')
	from employees;

-- DATE_ADD(date,INTERVAL expr type) =  ADDDATE(date,INTERVAL expr type)
-- DATE_SUB(date,INTERVAL expr type) = SUBDATE(date,INTERVAL expr type) 
-- 예제 : 각 직원들은 입사 후 6개월이 지나면 근무평가를 한다. 각직원들에 이름, 입사일, 최초 근무평가일은 언제인지 출력
select concat(first_name, ' ', last_name) as '전체이름',
	   hire_date,
       date_add(hire_date, interval 6 month) as '최초근무평가일'  -- day, month, year가 들어 갈 수 있다. 6은 express 즉, 표현식이다.
	from employees;
    
-- 형변환
select now(), cast(now()as date);
select cast(1-2 as unsigned);

-- 그룹함수 예제 : salaries 테이블에서 사번이 10060인 직원의 급여 평균과 총 합계를 출력
select avg(salary), sum(salary) from salaries where emp_no = 10060;
-- 예제 : 이 예제 직원의 최저 임금을 받은 시기와 최대 임금을 받은 시기를 각 각 출력해보세요.
-- 아래 예제는 오류, 
select max(salary) from salaries where emp_no = 10060;
select min(salary) from salaries where emp_no = 10060;

-- 쿼리는 연결해서 쓰는게 하니라 한번에 문제조건을 해결하는 개념으로 해야한다. 쿼리끼리 db로 연결되어 있기 떄문에 변수가 발생한다.
-- max min average sum이 있으면 다른 쿼리는 끼어들 수 없다.
select from_date, salary 
from salaries 
where emp_no = 10060
  and salary = (select max(salary) from salaries where emp_no = 10060);
  



  
  
  