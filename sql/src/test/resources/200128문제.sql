desc author;
desc book;

-- insert
insert into author values(null, '스테파니메이어');
select * from author;

-- delete
delete from author where no = 5;
select * from author;

-- upload 
update author set name = '조정래' where no = 4;


desc author;

select *
from author;