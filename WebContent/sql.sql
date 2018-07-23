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

--------------------------
------주문량(purchase) 미결정
--------------------------


