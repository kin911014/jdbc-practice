desc emaillist;

-- insert
insert into emaillist values(null, '김', '동은', 'kin911014@daum.net');
insert into emaillist values(null, '둘', '리', 'dooly@daum.net');

-- select 
select first_name, last_name, email 
from emaillist 
order by no desc;

-- -------------------------------------------------
-- gusetbook
desc guestbook;

insert into guestbook values(null, '김동은', '안녕하세요 반갑습니다.', '1q1q1q', now());
insert into guestbook values(null, '잡스', '파인애플애플펜.', '아이폰', now());
insert into guestbook values(null, '빌', '마이크로짱.', 'window', now());

select no, name, contents, password, reg_date
from guestbook
order by no asc;

select name, contents
from guestbook;
