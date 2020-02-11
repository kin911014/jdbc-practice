insert into dept values(null, '개발팀');
insert into dept values(null, '총무팀');
insert into dept values(null, '영업팀');

insert into emp values(null, '둘리', 1);
insert into emp values(null, '마이콜', 2);
insert into emp values(null, '또치', 3);
insert into emp values(null, '도우넛', 1);

select * from dept;
select * from emp;

select * from book;
select * from author;
-- update
update emp set name = '마이콜' where no = 3;

-- select
select no, name from dept;

-- insert
insert into dept values(null, '디자인팀');

-- delete
delete from dept where no = 4;

delete from emp where no=1 or no=2;
select * from emp;

update dept set name = 'Sales Team' where no=3;

set sql_safe_updates=0;

select a.no,a.title,a.state,a.author_no,b.name from book a, author b where a.author_no = b.no;

select no, title, state, author_no
from book;

insert into book values(null, '책', '대여가능' , 4);

select a.no, a.title, a.state, a.author_no, b.author_name from book a, author b;

select a.no, a.title, a.state, a.author_no, b.name
from book a, author b
where a.no = b.no;

 