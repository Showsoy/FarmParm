-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema java2b
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema java2b
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `java2b` DEFAULT CHARACTER SET utf8 ;
USE `java2b` ;

-- -----------------------------------------------------
-- Table `java2b`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `java2b`.`user` (
  `user_id` VARCHAR(20) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(50) NOT NULL,
  `birth` DATE NULL,
  `gender` CHAR(2) NULL,
  `postcode` CHAR(5) NOT NULL,
  `address` VARCHAR(60) NOT NULL,
  `email` VARCHAR(45) NULL,
  `grade` CHAR(2) NULL DEFAULT 'GI',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `java2b`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `java2b`.`item` (
  `item_code` CHAR(4) NOT NULL,
  `item_name` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `origin` VARCHAR(20) NULL,
  `category` VARCHAR(10) NOT NULL,
  `img_path` VARCHAR(50) NULL,
  `sale` INT NULL,
  `content` VARCHAR(200) NULL,
  `is_hot` INT NULL DEFAULT 0,
  PRIMARY KEY (`item_code`))
ENGINE = InnoDB;


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
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `java2b`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `java2b`.`order_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `java2b`.`order_item` (
  `item_code` CHAR(4) NOT NULL,
  `order_id` CHAR(6) NOT NULL,
  `amount` INT NULL DEFAULT 0,
  `price` INT NULL,
  PRIMARY KEY (`item_code`, `order_id`),
  INDEX `order_id_idx` (`order_id` ASC),
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `java2b`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `item_code`
    FOREIGN KEY (`item_code`)
    REFERENCES `java2b`.`item` (`item_code`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `java2b`.`item_stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `java2b`.`item_stock` (
  `item_code` CHAR(4) NOT NULL,
  `state` VARCHAR(10) NULL,
  `idate` DATE NULL,
  `amount` INT NULL,
  `stock` INT NULL,
  INDEX `item_code_idx` (`item_code` ASC),
  CONSTRAINT `item_code`
    FOREIGN KEY (`item_code`)
    REFERENCES `java2b`.`item` (`item_code`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


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
  PRIMARY KEY (`rboard_num`),
  INDEX `item_code_idx` (`item_code` ASC),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `java2b`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `item_code`
    FOREIGN KEY (`item_code`)
    REFERENCES `java2b`.`item` (`item_code`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


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

USE `java2b` ;

CREATE VIEW order_view AS SELECT order_item.order_id AS order_id, items.item_name AS item_name, items.price AS price, items.sale AS sale FROM order_item LEFT OUTER JOIN items ON order_item.item_code = items.item_code;
CREATE VIEW 


-- -----------------------------------------------------
-- Placeholder table for view `java2b`.`order_view`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `java2b`.`order_view` (`order_id` INT, `user_id` INT, `time` INT, `del_addr` INT, `del_postcode` INT, `depoint` INT, `state` INT, `item_code` INT, `amount` INT, `price` INT);

-- -----------------------------------------------------
-- View `java2b`.`order_view`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `java2b`.`order_view`;
USE `java2b`;
CREATE  OR REPLACE VIEW `order_view` AS
    SELECT 
        *
    FROM
        orders
            RIGHT OUTER JOIN
        order_item ON orders.order_id = order_item.order_id;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
