-- DDL

drop table member;

create table member(
	no integer unsigned not null auto_increment,
    email varchar(50) not null,
    password varchar(64) not null,
    name varchar(25) not null,
    dept_name varchar(25) not null,
    
    primary key(no)
);

desc member;

-- [예제2]  
-- member 테이블에 juminbunho char 타입, 반드시 입력되어야 하는 칼럼을 추가 하세요.
-- desc member로 추가 결과를  확인해 보세요.

-- 새 칼럼 추가
alter table member add juminbunho char(13) not null after no; -- after no 면 no뒤에 만들어진다
alter table member add join_date datetime  not null;

-- 칼럼 삭제
alter table member drop juminbunho;
desc member;

-- 칼럼 수정
alter table member change no no int unsigned not null auto_increment;
desc member;

alter table member change dept_name department_name varchar(25) not null;
alter table member change name name varchar(10) not null;

-- 테이블 이름 변경
alter table member rename user;
desc user;

-- DML
insert into user values(
null,
 'kin911014@daum.net',
 password('1234'),
 '김동은', 
 '시스템개발팀',
now());

select * from user;

insert 
	into user(name, email, password, department_name, join_date)
    values('김동은2', 'kin911014@daum.net', password('1234'), '솔루션개발팀', now());
select * from user;

-- update는 where절이 반드시 있어야한다.
update user
   set join_date = (select now()),
       name = '김동은3'
 where no = 1;
 select * from user;
 
 -- delete 조심해야한다! 
 delete 
   from user
  where no = 2;
  select * from user;
  
  -- transaction 