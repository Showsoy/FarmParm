-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema java2b
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `java2b` DEFAULT CHARACTER SET utf8 ;
USE `java2b`;

-- -----------------------------------------------------
-- Table `java2b`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `java2b`.`users` (
  `user_id` VARCHAR(20) NOT NULL,
  `passwd` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(50) NOT NULL,
  `birth` DATE NULL,
  `gender` CHAR(2) NULL,
  `postcode` CHAR(5) NOT NULL,
  `address` VARCHAR(60) NOT NULL,
  `email` VARCHAR(45) NULL,
  `grade` CHAR(2) NULL DEFAULT 'GI',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC));


-- -----------------------------------------------------
-- Table `java2b`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `java2b`.`items` (
  `item_code` CHAR(4) NOT NULL,
  `item_name` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `origin` VARCHAR(20) NULL,
  `category` VARCHAR(10) NOT NULL,
  `img_path` VARCHAR(50) NULL,
  `sale` INT NULL,
  `content` VARCHAR(200) NULL,
  `is_hot` INT NULL DEFAULT 0,
  PRIMARY KEY (`item_code`),
  UNIQUE INDEX `item_code_idx` (`item_code` ASC));


-- -----------------------------------------------------
-- Table `java2b`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `java2b`.`orders` (
  `order_id` CHAR(6) NOT NULL,
  `user_id` VARCHAR(20) NOT NULL,
  `dati` DATETIME NOT NULL,
  `del_addr` VARCHAR(45) NOT NULL,
  `del_postcode` CHAR(5) NOT NULL,
  `depoint` INT NULL DEFAULT 0,
  `state` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `order_id_idx` (`order_id` ASC));


-- -----------------------------------------------------
-- Table `java2b`.`order_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `java2b`.`order_item` (
  `item_code` CHAR(4) NOT NULL,
  `order_id` CHAR(6) NOT NULL,
  `amount` INT NULL DEFAULT 0,
  `price` INT NULL,
  PRIMARY KEY (`item_code`, `order_id`));


-- -----------------------------------------------------
-- Table `java2b`.`item_stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `java2b`.`item_stock` (
  `item_code` CHAR(4) NOT NULL,
  `state` VARCHAR(10) NULL,
  `idate` DATE NULL,
  `amount` INT NULL,
  `stock` INT NULL);


-- -----------------------------------------------------
-- Table `java2b`.`review_board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `java2b`.`review_board` (
  `rboard_num` INT NOT NULL,
  `item_code` CHAR(4) NOT NULL,
  `user_id` VARCHAR(20) NOT NULL,
  `content` VARCHAR(100) NOT NULL,
  `subject` VARCHAR(45) NOT NULL,
  `img_path` VARCHAR(50) NULL,
  `has_re` INT NULL DEFAULT 0,
  `rdate` DATE NULL,
  PRIMARY KEY (`rboard_num`));


-- -----------------------------------------------------
-- Table `java2b`.`qna_board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `java2b`.`qna_board` (
  `qboard_num` INT NOT NULL,
  `item_code` CHAR(4) NOT NULL,
  `user_id` VARCHAR(20) NOT NULL,
  `content` VARCHAR(100) NOT NULL,
  `subject` VARCHAR(45) NOT NULL,
  `img_path` VARCHAR(50) NULL,
  `has_re` INT NULL DEFAULT 0,
  `qdate` DATE NULL,
  PRIMARY KEY (`qboard_num`));


-- -----------------------------------------------------
-- Table `java2b`.`notice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `java2b`.`notice` (
  `no_num` INT NOT NULL,
  `content` VARCHAR(100) NOT NULL,
  `subject` VARCHAR(45) NOT NULL,
  `img_path` VARCHAR(50) NULL,
  `readcount` INT NULL DEFAULT 0,
  `ndate` DATE NULL,
  PRIMARY KEY (`no_num`));


-- -----------------------------------------------------
-- Table `java2b`.`cs_board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `java2b`.`cs_board` (
  `cs_num` INT NOT NULL,
  `user_id` VARCHAR(20) NOT NULL,
  `content` VARCHAR(100) NOT NULL,
  `subject` VARCHAR(45) NOT NULL,
  `img_path` VARCHAR(50) NULL,
  `has_re` INT NULL DEFAULT 0,
  `cdate` DATE NULL,
  PRIMARY KEY (`cs_num`));

USE `java2b`;


INSERT INTO items VALUES('F001','청송사과',123,'청송','fruit','apple.jpg',0,'빨간맛',0);
INSERT INTO items VALUES('F002','얼음골사과',222,'밀양','fruit','apple.jpg',0,'파란맛',0);

INSERT INTO item_stock VALUES('F001','입고','2018-07-01',444,444);
INSERT INTO item_stock VALUES('F001','출고','2018-07-03',11,433);
INSERT INTO item_stock VALUES('F001','출고','2018-07-10',33,400);
INSERT INTO item_stock VALUES('F002','입고','2018-07-12',33,33);
INSERT INTO item_stock VALUES('F002','출고','2018-07-13',3,30);


CREATE VIEW order_view AS SELECT order_item.order_id AS order_id, items.item_name AS item_name, items.price AS price, items.sale AS sale FROM order_item LEFT OUTER JOIN items ON order_item.item_code = items.item_code;
CREATE VIEW item_view AS SELECT items.item_code AS item_code, items.category AS category, items.item_name AS item_name, items.price AS price, item_stock.stock AS stock, (SELECT SUM(amount) FROM item_stock WHERE item_stock.state='출고' AND items.item_code = item_stock.item_code) AS purchase FROM items RIGHT OUTER JOIN item_stock ON items.item_code = item_stock.item_code;

USE `java2b`;
DROP VIEW item_view;
delete from item_stock;
ALTER TABLE item_stock ADD inumber int primary key auto_increment;

INSERT INTO item_stock VALUES('F001','입고','2018-07-01',444,444,1);
INSERT INTO item_stock VALUES('F001','출고','2018-07-03',11,433,null);
INSERT INTO item_stock VALUES('F001','출고','2018-07-10',33,400,null);
INSERT INTO item_stock VALUES('F002','입고','2018-07-12',33,33,null);
INSERT INTO item_stock VALUES('F002','출고','2018-07-13',3,30,null);
INSERT INTO item_stock VALUES('F001','출고','2018-07-20',50,350,null);
INSERT INTO item_stock VALUES('F002','입고','2018-07-22',30,60,null);

CREATE VIEW item_view AS SELECT items.item_code AS item_code, items.category AS category, items.item_name AS item_name, items.price AS price, item_stock.stock AS stock, (SELECT SUM(amount) FROM item_stock WHERE item_stock.state='출고' AND items.item_code = item_stock.item_code) AS purchase FROM items LEFT JOIN item_stock ON items.item_code = item_stock.item_code WHERE item_stock.inumber IN (SELECT MAX(inumber) FROM item_stock GROUP BY item_code);


USE `java2b`;
ALTER TABLE items ADD readcount int DEFAULT 0;
DROP VIEW item_view;
CREATE VIEW item_view AS SELECT items.item_code AS item_code, items.category AS category, items.img_path AS img_path, items.item_name AS item_name, items.price AS price, item_stock.stock AS stock, items.readcount AS readcount, (SELECT SUM(amount) FROM item_stock WHERE item_stock.state='출고' AND items.item_code = item_stock.item_code) AS purchase FROM items LEFT JOIN item_stock ON items.item_code = item_stock.item_code WHERE item_stock.inumber IN (SELECT MAX(inumber) FROM item_stock GROUP BY item_code);
ALTER TABLE items DROP COLUMN is_hot;

create view user_view as select users.user_id as user_id, users.grade as grade, (select sum((select price*amount from order_item, orders where orders.order_id=order_item.order_id)) from orders) as userpay from users left join orders on users.user_id = orders.user_id;

-- users 테이블에 address_second / email_ad 추가하고, 순서 바꿈 --
alter table users add address_second varchar(60) not null;
alter table users modify column address_second varchar(60) after address;

alter table users add email_ad varchar(45) not null;
alter table users modify column email_ad varchar(45) after email;

----------------------------------------------

--20180727 update
USE `java2b`;
DROP VIEW item_view;

CREATE VIEW item_view AS SELECT (select idate from item_stock where state='등록' and items.item_code = item_stock.item_code) as vdate, items.item_code AS item_code, items.category AS category, items.img_path AS img_path, items.item_name AS item_name, items.price AS price, item_stock.stock AS stock, items.readcount AS readcount, (SELECT SUM(amount) FROM item_stock WHERE item_stock.state='출고' AND items.item_code = item_stock.item_code) AS purchase FROM items LEFT JOIN item_stock ON items.item_code = item_stock.item_code WHERE item_stock.inumber IN (SELECT MAX(inumber) FROM item_stock GROUP BY item_code);

ALTER TABLE review_board ADD rgroup int;
ALTER TABLE qna_board ADD rgroup int;
ALTER TABLE cs_board ADD rgroup int;
ALTER TABLE items ADD ihide int default 0;
CREATE VIEW item_view AS SELECT (select idate from item_stock where state='등록' and items.item_code = item_stock.item_code) as vdate, items.item_code AS item_code, items.category AS category, items.img_path AS img_path, items.item_name AS item_name, items.price AS price, items.sale AS sale, (select stock from item_stock a where inumber = (select max(inumber) from item_stock b where a.item_code = b.item_code and b.item_code = items.item_code)) AS stock, items.readcount AS readcount, (SELECT SUM(amount) FROM item_stock WHERE item_stock.state='출고' AND items.item_code = item_stock.item_code) AS purchase, items.ihide as ihide FROM items LEFT JOIN item_stock ON items.item_code = item_stock.item_code group by items.item_code;



alter table users drop column email_ad;
alter table users modify passwd varchar(300) not null;
alter table users add usalt varchar(300) not null;

---20180731수정 출고상태 추가하여 주문상태를 따로 만듦--
USE `java2b`;
DROP VIEW item_view;
CREATE VIEW item_view AS SELECT (select idate from item_stock where state='등록' and items.item_code = item_stock.item_code) as vdate, items.item_code AS item_code, items.category AS category, items.img_path AS img_path, items.item_name AS item_name, items.price AS price, items.sale AS sale, (select stock from item_stock a where inumber = (select max(inumber) from item_stock b where a.item_code = b.item_code and b.item_code = items.item_code)) AS stock, items.readcount AS readcount, (SELECT SUM(amount) FROM item_stock WHERE item_stock.state='주문' AND items.item_code = item_stock.item_code) AS purchase, items.ihide as ihide FROM items LEFT JOIN item_stock ON items.item_code = item_stock.item_code group by items.item_code;

---20180801 게시판 계층 추가, auto_increment추가, 기본키 이름 통일, 공지와 고객센터 내용 길이-----
USE `java2b`;
ALTER TABLE review_board ADD rstep int default 1;
ALTER TABLE qna_board ADD rstep int default 1;
ALTER TABLE cs_board ADD rstep int default 1;
ALTER TABLE review_board CHANGE bnum bnum int;
ALTER TABLE qna_board CHANGE bnum bnum int;
ALTER TABLE cs_board CHANGE bnum bnum int;
ALTER TABLE notice CHANGE bnum bnum int auto_increment;
ALTER TABLE cs_board ADD hide char(4) default 'SHOW';
ALTER TABLE cs_board MODIFY content varchar(300);
ALTER TABLE notice MODIFY content varchar(300);

---20180803 order_id 정수형, auto_increment 초기값,
USE `java2b`;
alter table orders modify order_id int auto_increment;
alter table order_item modify order_id int;
alter table orders auto_increment=1;
alter table users add point int default=0;
drop view order_view;
CREATE VIEW order_view AS SELECT order_item.order_id AS order_id, items.item_name AS item_name, items.price AS price, order_item.amount as amount FROM order_item LEFT OUTER JOIN items ON order_item.item_code = items.item_code;

--20180803 필드삭제--
alter table users drop column email_ad;

--20180806 주문테이블 열추가--
USE `java2b`;
alter table orders add receiver varchar(20);
alter table orders add pay int;
alter table orders add payment varchar(10);
drop view user_view;
create view user_view as select users.user_id as user_id, users.grade as grade, (select sum((select pay from orders where orders.user_id=users.user_id))) as userpay from users left join orders on users.user_id = orders.user_id group by user_id;

alter table users modify grade varchar(10) default '일반회원';
insert into users values('user1','1111','김김김','010-1111-1111','2012-12-12','남','12345','대구','달서구','aaa@aaa.com','일반회원','ㅇㅇ',0);
insert into users values('user2','1111','김김김','010-1111-1111','2012-12-12','남','12345','대구','달서구','aaa@aaa.com','일반회원','ㅇㅇ',0);
insert into users values('user3','1111','김김김','010-1111-1111','2012-12-12','남','12345','대구','달서구','aaa@aaa.com','일반회원','ㅇㅇ',0);
insert into users values('user4','1111','김김김','010-1111-1111','2012-12-12','남','12345','대구','달서구','aaa@aaa.com','일반회원','ㅇㅇ',0);

drop view order_view;
CREATE VIEW order_view AS SELECT order_item.order_id AS order_id, items.item_code as item_code, items.item_name AS item_name, items.price AS price, order_item.amount as amount FROM order_item LEFT OUTER JOIN items ON order_item.item_code = items.item_code;

alter table orders modify order_id int;

--20180807 주문테이블 배송을 위한 전화번호,메일 추가--
USE `java2b`;
alter table orders add column del_phone varchar(45);
alter table orders modify column del_phone varchar(45) after dati;
alter table orders add column del_mail varchar(50);
alter table orders modify column del_mail varchar(50) after del_phone;
USE `java2b`;
drop view order_view;
CREATE VIEW order_view as SELECT order_item.order_id AS order_id, items.item_code as item_code, items.item_name AS item_name, format(items.price*(100-items.sale)/100,0) AS price, order_item.amount as amount FROM order_item LEFT OUTER JOIN items ON order_item.item_code = items.item_code;
drop view user_view;
create view user_view as select users.user_id as user_id, users.grade as grade, (select sum(pay) from orders where orders.user_id = users.user_id) as userpay from users left join orders on users.user_id = orders.user_id group by user_id;

--20180808 주문 뷰 형식 바꿈--
USE `java2b`;
drop view order_view;
create view order_view as SELECT order_item.order_id AS order_id, items.item_code as item_code, items.item_name AS item_name, round(items.price*(100-items.sale)/100) AS price, order_item.amount as amount FROM order_item LEFT OUTER JOIN items ON order_item.item_code = items.item_code;
alter table review_board add column order_id int;

---20180810 기본키 제거---
USE `java2b`;
alter table review_board drop primary key;
alter table qna_board drop primary key;
alter table review_board modify content varchar(400);
alter table qna_board modify content varchar(400);

--20180813 qna 숨기기 기능--
USE `java2b`;
alter table qna_board add qhide int default 0;
drop view order_view;
create view order_view as SELECT order_item.order_id AS order_id, items.item_code as item_code, items.item_name AS item_name, order_item.price AS price, order_item.amount as amount, orders.dati as dati FROM order_item, items, orders WHERE order_item.item_code = items.item_code AND orders.order_id = order_item.order_id;


--20180816 orders 택배비--
USE `java2b`;
alter table orders add parcel int default 0;

--20180823 포인트 테이블--
USE `java2b`;
alter table users drop column point;
CREATE TABLE IF NOT EXISTS `java2b`.`point` (
  `pt_num` INT NOT NULL,
  `user_id` VARCHAR(20) NOT NULL,
  `order_id` INT NULL,
  `state` VARCHAR(10) NOT NULL,
  `plminus` INT NOT NULL,
  `point` INT NOT NULL,
  `balance` INT NOT NULL,
  `pdate` DATE NULL);
alter table point modify pt_num int primary key auto_increment;
alter table point auto_increment = 1;