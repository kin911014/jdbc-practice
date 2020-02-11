-- 숫자형 함수

-- 절대값
select abs(2), abs(-2);
-- 나머지값 
select mod(234, 10), 234 % 10, mod(29,9);
-- FLOOR(x) : x보다 크지 않은 가장 큰 정수를 반환한다. BIGINT로 자동 변환됨
select floor(1.23), floor(-1.23);
-- CEILING(x) : x보다 작지 않은 가장 작은 정수를 반환한다
select ceiling(1.23), ceiling(-1.23);
-- ROUND(x,d) : x값 중에서 소수점 d자리에 가장 근접한 수로 반환한다.
select round(1.23), round(1.58), round(-1.23), round(-1.58);
-- 소수점자리 반올림
select round(1.298, 1), round(1.298, 0);
-- 2의 10승
select pow(2, 10), power(2, 20);
--
select sign(-34), sign(0), sign(12345);
-- 가장 큰 값 반환 
select greatest(10, 20, 45, 30, 55, 2), 
	greatest(2.3, 4.5, 1.2),
    greatest('abc', 'bcd', 'ABC', 'BCD'); -- 아스키코드값을 이용
-- 가장 작은 값 반환
select least(10, 20, 45, 30, 55, 2), 
	least(2.3, 4.5, 1.2),
    least('abc', 'bcd', 'ABC', 'BCD'); -- 아스키코드값을 이용

