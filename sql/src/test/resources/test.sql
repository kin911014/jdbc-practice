use test;
show tables;

-- DDL
create table test(
no integer primary key,
name varchar(200)
);

-- (C) create
insert into test values(1, "둘리");
insert into test values(2, "또치");

-- (R) read
select * from test;

-- (U) update
update test set name = '마이콜' where no = 2;

-- (D) delete
delete from test where no = 1;

-- 확인
select count(*) from test;

-- Drop (테이블제거)
drop table test;