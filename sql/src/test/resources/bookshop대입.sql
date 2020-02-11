 -- 전체
 select a.no, a.title, a.price, a.category_no, b.category_name from book a, category b where a.category_no = b.no;
 
-- 카테고리 전체

select no, category_name from category;

-- 카테고리 입력
insert into category values(null, 'IT');
insert into category values(null, '소설');
insert into category values(null, '취미');

delete from category where no =3;
delete from category;
-----------------------------------------------------------

-- book 전체
select no, title, price, category_no from book;
-- book select
insert into book values(null, '고프의 디자인패턴', 12000, 1);
insert into book values(null, 'EARTH', 15000, 2);
insert into book values(null, '베컴의 축구교실', 20000, 3);

select *
from category;

-- book 전체 join
select a.no, a.title, a.price, a.category_no, b.category_name from book a, category b where a.category_no = b.no;

-----------------------------------------------------------------

-- member 전체
 select no, name, phone_no, email, password from member;

insert into member values(null, '김동은', '010-2991-8126', 'kin911014@daum.net', '김동은1');
insert into member values(null, '이상휘', '010-0000-0000', 'SADF@daum.net', '1Q1Q1Q');


----------------------------------------------------------------

-- cart 전체
-- 도서제목, 수량, 가격  book_no = no
select a.title, b.amount, a.price from book a, cart b where a.no = b.book_no;

select *
from book;

-- cart값만
insert into cart values(5, 1, 150);

select *
from cart;

-------------------------------------------------------------

-- oerder 전제
-- 주문 번호 주문자(이름/이메일) 결제금액 배송지
select *
from orders;	

select a.shipping_no,
	   d.name,
       d.email,
       a.total_price,
       a.destination,
       c.no,
       c.title,
       b.amount
from orders a, orders_book b, book c , member d
where a.no = b.orders_no
and b.book_no = c.no
and a.member_no = d.no; 

-- order만
select *
from orders;

insert into orders values(null, 20200130-00001, 40000, '춘천', 1);
insert into orders values(null, 20200130-00002, 18000, '서울', 2);

--------------------------------------------------------------
-- order
select a.shipping_no ,
 b.name, 
 b.email,
 a.total_price ,
 a.destination 
from orders a, member b ;

-- concat(b.name,'/', b.emali)

select name, email
from member;

----------------------------------------------
-- 도서번호, 도서제목, 수량

select a.no, a.title, b.amount 
from book a, orders_book b;

select *
from book a, orders_book b
where a.no = b.book_no;

insert into orders_book values(2, 1, 5);

select *
from member, category, book, cart, orders, orders_book;

select *
from category;
select *
from orders_book;