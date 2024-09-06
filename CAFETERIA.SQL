--(Lab 1,2)--

drop table has ;
drop table p_order ;
drop table manages cascade constraints  ;
drop table users ;
drop table Login ;
drop table Roles ;
drop table permission ;
drop table canteen ;
drop table products;
drop table food cascade constraints;
drop table orders cascade constraints ;


create table users(
	user_id number(20),
	user_name varchar(40),
	user_email varchar(20),
	user_address varchar(20)
);
-- added Primary Key by altering
alter table users ADD Primary Key (user_id);

create table Login(
	Login_id number(20),	
	Primary Key (Login_id)
);

--Added New Column by Altering
alter table Login ADD user_password varchar(20);

create table Roles (
	role_id number(20),
	role_name varchar(20),
	Primary Key (role_id)
	);

-- Modified Column by Altering
alter table Roles MODIFY role_name varchar(20);

create table permission(
	per_id number(20),
	per_module varchar(20),
	extra varchar(20),
	Primary Key (per_id)
	);
--Deleted The extra Column
alter table permission Drop Column extra;

create table canteen(
	can_id number(20),
	can_name varchar(20),
	can_type varchar(20),
	can_desc varchar(40),
	Primary Key (can_id)
);

create table products(
	pro_id number(20),
	pro_type varchar(20),
	pro_price number(10),
	Primary Key (pro_id)
);

create table food(
	food_id number(20),
	food_name varchar(20),
	food_type varchar(20),
	food_price number(10),
	Primary Key (food_id)
);

create table orders (
	ord_id number(20),
	ord_quantity number(20),
	Primary Key (ord_id)
);


create table manages(
	can_id number(20),
	user_id number(20),
	pro_id number(20),
	food_id number(20),
        status varchar(20),
	Primary Key (can_id,user_id,pro_id,food_id),
	Foreign Key (can_id) REFERENCES canteen(can_id) on DELETE cascade,
	Foreign Key (user_id) REFERENCES users(user_id) on DELETE cascade,
	Foreign Key (pro_id) REFERENCES products(pro_id) on DELETE cascade,
	Foreign Key (food_id) REFERENCES food(food_id) on DELETE cascade
);

create table p_order(
	pro_id number(20),
	ord_id number(20),
	Primary Key (pro_id,ord_id),
	Foreign Key (pro_id) REFERENCES products(pro_id) on DELETE cascade,
	Foreign Key (ord_id) REFERENCES orders(ord_id) on DELETE cascade
	);

create table has(
user_id number(20),
role_id number(20),
per_id number(20),
Login_id number(20),
Primary Key(user_id,role_id,per_id,Login_id),
Foreign Key (user_id) REFERENCES users(user_id) on DELETE cascade,
Foreign Key (role_id) REFERENCES Roles(role_id) on DELETE cascade,
Foreign Key (per_id) REFERENCES permission(per_id) on DELETE cascade,
Foreign Key (Login_id) REFERENCES Login(Login_id) on DELETE cascade
);

-- Inserting values in users

insert into users values (1807116, 'Tuna','tuna@gmail.com','Dhaka') ;
insert into users values (1807118, 'Mou', 'mou@gmail.com','Khulna') ;
insert into users values (1807101, 'Sejuti', 'sejuti@gmail.com','Khulna') ;
insert into users values (1807024, 'Abrar', 'abrar@gmail.com','Dinajpur') ;
COMMIT;
insert into users values (1807100, 'Taj', 'taj@gmail.com','jessore') ;
insert into users values (1807029, 'Lira', 'lira@gmail.com','Chittagong') ;

--Update syntax

update users
     set user_name='Sanjida' where user_name='Mou';

select *from users;

--Inserting values in login

insert into login values (1011, 'pru123') ;
insert into login values (1021,'asm456') ;
insert into login values (1010,'mkl789') ;
insert into login values (1020,'abc146') ;
COMMIT;
select *from login;

--Inserting values in roles

insert into roles values (7311, 'Employee') ;
insert into roles values (7214, 'Customer') ;
insert into roles values (7215, 'Customer') ;
insert into roles values (7309, 'Employee') ;
COMMIT;
select *from roles;

--insert values in permission

insert into permission values (8401,'Yes') ;
insert into permission values (8510, 'No') ;
insert into permission values (8520,'No') ;
insert into permission values (8411,'Yes') ;
COMMIT;
select *from permission;

--insert values in canteen

insert into canteen values (2140,'Rajmohol', 'Indian food','All kinds of indian food') ;
insert into canteen values (2138,'Wendys', 'French food','Also fast food included') ;
insert into canteen values (2142,'Rajdorbar', 'Bangladeshi food','Traditional deshi food') ;
insert into canteen values (2144,'Lazeez','Chinese food','Delicious food available') ;
COMMIT;
select *from canteen;

--Inserting values in products

insert into products values (510, 'Chocolates', 20) ;
insert into products values (509, 'Chips',32) ;
insert into products values (512, 'Biscuits', 30) ;
insert into products values (501, 'Juice', 40) ;
COMMIT;
select *from products;

--Inserting values in food

insert into food values (3310,'Coffee','Drinks',110) ;
insert into food values (3309,'Burger','Snacks',180) ;
insert into food values (3308,'Rice','Lunch',50) ;
insert into food values (3320,'Chicken','Dinner',60) ;
COMMIT;

select *from food;

--Inserting values in orders

insert into orders values (6120,2) ;
insert into orders values (6140,3) ;
insert into orders values (6109,1 ) ;
insert into orders values (6110, 1) ;
insert into orders values (6113,10) ;
COMMIT;
insert into orders values (6114,11) ;
--Delete syntax
delete from orders where ord_id=6113;

select *from orders;

--Inserting values in p_order

insert into p_order values (509, 6140) ;
insert into p_order values (510,6120) ;
insert into p_order values (501,6110) ;
insert into p_order values (512,6109) ;
COMMIT;

select *from p_order;

--Inserting values in manages

insert into manages values (2140, 1807116, 510, 3309,'Ready') ;
insert into manages values (2138, 1807118, 509, 3310,'Pending') ;
insert into manages values (2142, 1807101, 512, 3308,'On the way to serve') ;
insert into manages values (2144, 1807024, 501, 3320,'Preparing') ;
COMMIT;

select *from manages;

--Inserting values in has

insert into has values (1807118, 7214,8510,1011) ;
insert into has values (1807116, 7215,8411,1021) ;
insert into has values (1807024, 7309,8401,1010) ;
insert into has values (1807101, 7311,8520,1020) ;
COMMIT;

select *from has;

--(Lab3)--

--Single column ordering

select pro_id,pro_type,pro_price from products
	order by pro_price;

select pro_id,pro_type,pro_price from products
	order by pro_price desc;

--Multiple columns ordering

select pro_id,pro_type,pro_price from products
	order by pro_id,pro_price;

--Calculated fiels

select (pro_price/2) from products where pro_id=509;

--Comparison search condition

select user_id from has where Login_id>1010;

--Compound comparison search condition

select user_id from has where Login_id>1010 and per_id=8411;

--Range search condition

select user_name from users where user_id between 1807001 and 1807030;

select user_name from users where user_id not between 1807001 and 1807030;

--Set membership

select status from manages where pro_id in(501,510);

select status from manages where pro_id not in(501,510);

--(Lab 4)--

--5 aggregate functions

--max & min

select max(food_price) from food;

select min(food_price) from food;

--count function
select count(*), count(can_id) from canteen;
select count(can_ID), count(distinct can_ID), count(all can_ID) from canteen;

--sum and average
select sum(can_id), avg(can_id), avg(nvl(can_id,0)) from canteen;

--group by clause
select pro_id,count(ord_id) from p_order group by pro_id;

--having clause
select pro_id,count(ord_id) from p_order group by pro_id having count(pro_id)>=1;


--(Lab5)--

--subquery search

select user_id,can_id from manages where user_id in(select user_id from users where user_address='Dinajpur');

--Union all

select user_id,user_name 
from users
where user_address='Khulna'
union all
select u.user_id,u.user_name from users u where u.user_id in
(select m.user_id from manages m, has h where m.user_id=h.user_id and h.Login_id=1020);

--Union

select user_id,user_name 
from users
where user_address='Khulna'
union 
select u.user_id,u.user_name from users u where u.user_id in
(select m.user_id from manages m, has h where m.user_id=h.user_id and h.Login_id=1020);

--Intersect

select user_id,user_name 
from users
where user_address='Khulna'
intersect 
select u.user_id,u.user_name from users u where u.user_id in
(select m.user_id from manages m, has h where m.user_id=h.user_id and h.Login_id=1020);

--Minus

select user_id,user_name 
from users
where user_address='Khulna'
minus 
select u.user_id,u.user_name from users u where u.user_id in
(select m.user_id from manages m, has h where m.user_id=h.user_id and h.Login_id=1020);

--Precedence of set operators

select user_id,user_name 
from users
where user_address='Dhaka'
union 
select u.user_id,u.user_name from users u where u.user_id in
(select m.user_id from manages m, has h where m.user_id=h.user_id and h.Login_id=1020)
intersect
select user_id,user_name from users where user_address='Dhaka';

--(Lab6)--

--Natural join

select p.pro_type,d.ord_id from products p natural join p_order d;

--Cross joins
select p.pro_type, f.food_name from products p cross join food f;

--Inner join

select p.pro_type, d.ord_id from products p inner join p_order d
on p.pro_id=d.pro_id;

--Left outer join

select p.pro_type, d.ord_id from products p left outer join p_order d
on p.pro_id=d.pro_id;

--Right outer join

select p.pro_type, d.ord_id from products p right outer join p_order d
on p.pro_id=d.pro_id;

--Full outer join

select p.pro_type, d.ord_id from products p full outer join p_order d
on p.pro_id=d.pro_id;

--(Lab7)--

SET  SERVEROUTPUT ON
DECLARE
  price food.food_price%type;
  totalwithvat food.food_price%type;
  f_id number(20);
  
BEGIN
  
f_id:=3309;
SELECT food_price into price FROM food
WHERE food_id like f_id;
IF price<=100 then
  totalwithvat:=price; 

ELSIF price>100 and price<=150 then
  totalwithvat:=price+(price*0.25);

ELSIF price>150 and price<200 then
  totalwithvat:=price+(price*0.4);

ELSE
  totalwithvat:=price+(price*0.5);

END IF; 
  DBMS_OUTPUT.PUT_LINE('Actual price is : ' || price );
  DBMS_OUTPUT.PUT_LINE(' Price with vat : '|| ROUND(totalwithvat,2));
EXCEPTION
WHEN others THEN
DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;
/
SHOW ERRORS;

--(LAB8)--
--PL/SQL procedures--

--Average

CREATE OR REPLACE FUNCTION price RETURN NUMBER IS
price products.pro_price%type;
BEGIN
SELECT AVG(pro_price) INTO price
FROM products;
RETURN price;
DBMS_OUTPUT.PUT_LINE('Average  Price: ' || price);
END;
/

SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE('Average  Price: ' || price);
END;
/

--Total

CREATE OR REPLACE FUNCTION price RETURN NUMBER IS
price products.pro_price%type;
BEGIN
SELECT SUM(pro_price) INTO price
FROM products;
RETURN price;
DBMS_OUTPUT.PUT_LINE('Total  Price: ' || price);
END;
/

SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE('Total  Price: ' || price);
END;
/

--(Lab9)--

--Trigger

CREATE OR REPLACE TRIGGER TR_FOOD_TYPE
BEFORE UPDATE OR INSERT ON FOOD
FOR EACH ROW
BEGIN
IF :NEW.FOOD_NAME = 'BURGER' OR :NEW.FOOD_NAME = 'STEAK' OR :NEW.FOOD_NAME = 'PIZZA' THEN
:NEW.FOOD_TYPE:='FAST FOOD';
ELSIF :NEW.FOOD_NAME = 'COFFEE' OR :NEW.FOOD_NAME = 'TEA' OR :NEW.FOOD_NAME = 'JUICE' THEN
:NEW.FOOD_TYPE:='DRINKS';
ELSIF :NEW.FOOD_NAME = 'CHEICKEN' OR :NEW.FOOD_NAME = 'MUTTON'OR  :NEW.FOOD_NAME = 'BEEF' THEN
:NEW.FOOD_TYPE:='LUNCH';
END IF;
END TR_FOOD_TYPE;
/

select *from FOOD;
insert into food values (3333,'JUICE',NULL,110) ;
insert into food values (3334,'PIZZA',NULL,180) ;
insert into food values (3335,'Rice',NULL,50) ;
insert into food values (3336,'MUTTON',NULL,60) ;
SELECT * FROM FOOD;


--Rollback
select *from canteen;

delete from canteen;

rollback;

select *from canteen;


--Savepoint
insert into canteen values (2151,'Pizzaology', 'Bangladeshi food','All kinds of deshi food') ;
SAVEPOINT cont_5;
insert into canteen values (2158,'7 miles', 'Spanish food','Also fast food included') ;
SAVEPOINT cont_6;
select *from canteen;


rollback to cont_5;

select *from canteen;

rollback;

select *from canteen;

--Date

select sysdate from dual;

select current_date from dual;

select systimestamp from dual;

--View

DROP VIEW VIEW_FOOD_PRICE;
CREATE VIEW VIEW_FOOD_PRICE AS
SELECT * FROM food
WHERE food_name='Burger';

SELECT *FROM VIEW_FOOD_PRICE;

