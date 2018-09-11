CREATE DATABASE `java2b`;

CREATE TABLE `users` (
  `user_id` varchar(20) NOT NULL,
  `passwd` varchar(300) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `birth` date DEFAULT NULL,
  `gender` char(2) DEFAULT NULL,
  `postcode` char(5) NOT NULL,
  `address` varchar(60) NOT NULL,
  `address_second` varchar(60) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `grade` varchar(10) DEFAULT '일반회원',
  `edate` datetime DEFAULT NULL,
  `usalt` varchar(300) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
);

CREATE TABLE `point` (
  `pt_num` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `state` varchar(10) NOT NULL,
  `plminus` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `pdate` date DEFAULT NULL,
  PRIMARY KEY (`pt_num`)
);

CREATE TABLE `items` (
  `item_code` char(4) NOT NULL,
  `item_name` varchar(45) NOT NULL,
  `price` int(11) NOT NULL,
  `origin` varchar(20) DEFAULT NULL,
  `category` varchar(10) NOT NULL,
  `img_path` varchar(50) DEFAULT NULL,
  `sale` int(11) NOT NULL DEFAULT '0',
  `content` varchar(200) DEFAULT NULL,
  `readcount` int(11) DEFAULT '0',
  `ihide` int(11) DEFAULT '0',
  PRIMARY KEY (`item_code`),
  UNIQUE KEY `item_code_idx` (`item_code`)
);

CREATE TABLE `item_stock` (
  `item_code` char(4) NOT NULL,
  `state` varchar(10) DEFAULT NULL,
  `idate` datetime DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `inumber` int(11) NOT NULL,
  KEY `item_stock_idx` (`item_code`,`inumber`)
);

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `dati` datetime NOT NULL,
  `del_phone` varchar(45) DEFAULT NULL,
  `del_mail` varchar(50) DEFAULT NULL,
  `del_addr` varchar(45) NOT NULL,
  `del_postcode` char(5) NOT NULL,
  `depoint` int(11) DEFAULT '0',
  `state` varchar(10) NOT NULL,
  `pay` int(11) DEFAULT NULL,
  `payment` varchar(10) DEFAULT NULL,
  `receiver` varchar(20) DEFAULT NULL,
  `parcel` int(11) DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `order_id_idx` (`order_id`)
);

CREATE TABLE `order_item` (
  `item_code` char(4) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` int(11) DEFAULT '0',
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_code`,`order_id`)
);

CREATE TABLE `notice` (
  `bnum` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(300) DEFAULT NULL,
  `subject` varchar(45) NOT NULL,
  `img_path` varchar(50) DEFAULT NULL,
  `readcount` int(11) DEFAULT '0',
  `ndate` date DEFAULT NULL,
  PRIMARY KEY (`bnum`)
);

CREATE TABLE `cs_board` (
  `bnum` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `content` varchar(300) DEFAULT NULL,
  `subject` varchar(45) NOT NULL,
  `img_path` varchar(50) DEFAULT NULL,
  `has_re` int(11) DEFAULT '0',
  `cdate` date DEFAULT NULL,
  `rgroup` int(11) DEFAULT NULL,
  `rstep` int(11) DEFAULT '1',
  `hide` char(4) DEFAULT 'SHOW',
  PRIMARY KEY (`bnum`)
);

CREATE TABLE `qna_board` (
  `bnum` int(11) NOT NULL,
  `item_code` char(4) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `content` varchar(400) DEFAULT NULL,
  `subject` varchar(45) NOT NULL,
  `img_path` varchar(50) DEFAULT NULL,
  `has_re` int(11) DEFAULT '0',
  `qdate` datetime DEFAULT NULL,
  `rgroup` int(11) DEFAULT NULL,
  `rstep` int(11) DEFAULT '1',
  `qhide` int(11) DEFAULT '0',
  PRIMARY KEY (`bnum`,`item_code`)
);

CREATE TABLE `review_board` (
  `bnum` int(11) NOT NULL,
  `item_code` char(4) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `content` varchar(400) DEFAULT NULL,
  `subject` varchar(45) NOT NULL,
  `img_path` varchar(50) DEFAULT NULL,
  `has_re` int(11) DEFAULT '0',
  `rdate` datetime DEFAULT NULL,
  `rgroup` int(11) DEFAULT NULL,
  `rstep` int(11) DEFAULT '1',
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bnum`,`item_code`)
);

CREATE VIEW item_view AS SELECT (select idate from item_stock where state='등록' and items.item_code = item_stock.item_code) as vdate, items.item_code AS item_code, items.category AS category, items.img_path AS img_path, items.item_name AS item_name, items.price AS price, items.sale AS sale, (select stock from item_stock a where inumber = (select max(inumber) from item_stock b where a.item_code = b.item_code and b.item_code = items.item_code)) AS stock, items.readcount AS readcount, (SELECT SUM(amount) FROM item_stock WHERE item_stock.state='주문' AND items.item_code = item_stock.item_code) AS purchase, items.ihide as ihide FROM items LEFT JOIN item_stock ON items.item_code = item_stock.item_code group by items.item_code;

create view user_view as select users.user_id as user_id, users.grade as grade, users.edate as edate, (select sum(pay) from orders where orders.user_id = users.user_id) as userpay from users group by user_id;

create view order_view as SELECT order_item.order_id AS order_id, items.item_code as item_code, items.item_name AS item_name, order_item.price AS price, order_item.amount as amount, orders.dati as dati FROM order_item, items, orders WHERE order_item.item_code = items.item_code AND orders.order_id = order_item.order_id;