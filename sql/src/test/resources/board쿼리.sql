select *
from board;

desc board;



-- board ==============================================================
select a.no,
 a.title,
 a.contents,
 a.hit,
 a.reg_date,
 a.g_no,
 a.o_no,
 a.depth,
 a.user_no,
 b.name
from board a, user b
where a.user_no = b.no
order by max(a.g_no) desc, a.o_no asc;

select *
from board;

select a.title, a.contents, a.no, a.userNo
from board a, user b
where a.no = 17
and a.userNo = b.no;

select * from board;
(select ifnull(max(g_no),0)+1 from board);
insert into board values(null, '농구', '농구합니다.', 1, now(), 2, 1, 1, 2);


insert 
into board values(
null, 
 'title', 
 'contents', 
 0, 
 now(),
 (select ifnull(max(b.g_no),0)+1 from board b),
 1,
 0,
 1);

delete from board where no = 16;

(select ifnull(max(g_no),0)+1 from board);


select *
from board;

update board
 set title = ?,
 contents = ?
 where no = ?;
update board set title = '업데이트', contents = '업데이트합니다.' where no = 11;


-- user ====================================
desc user;

select *
from user;
insert into user values(null, '김가네', 'gaga@gmain.com', 'pw', 'female', now());

