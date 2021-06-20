
use mydb
DESC WoodsB_product


DESC WoodsB_customer
SELECT *
FROM WoodsB_customer
INSERT INTO WoodsB_customer(customerID,first_name,last_name,email_address,phone_number)
VALUES(2,"max","woods",'maxthecat@fds.com',8174)
INSERT INTO WoodsB_customer(customerID,first_name,last_name,email_address,phone_number)
VALUES(4,"brittany","johnson","brittanyjohnson@mahoo.com",1234)
INSERT INTO WoodsB_customer(customerID,first_name,last_name,email_address,phone_number)
VALUES(5,"katie","bobthebuiler","katiejfsjs@mahoo.com",1234)

VALUES(4,"jim","thedog",'jimthedog@my.unt.edu',8234)
delete from WoodsB_customer where customerID=1
SELECT *
FROM WoodsB_
SELECT *
FROM WoodsB_product
INSERT INTO WoodsB_product(idproductid,ProductPrice,ProductTitle,ProductDate,CustomerID,idProductCategory)
SELECT *
FROM
	INFORMATION_SCHEMA.TABLES;
GO

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`WoodsB_customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`WoodsB_customer` (
  `first_name` VARCHAR(45) NULL,
  `last_name` INT NULL,
  `email_address` VARCHAR(45) NULL,
  `customerID` INT NOT NULL,
  `phone_number` INT NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`WoodsB_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`WoodsB_product` (
  `idProductid` INT NOT NULL,
  `ProductPrice` INT NULL,
  `ProductTitle` VARCHAR(45) NULL,
  `ProductDate` DATE NULL,
  `CustomerID` VARCHAR(45) NULL,
  `idProductCategory` VARCHAR(45) NULL,
  PRIMARY KEY (`idProductid`),
  INDEX `fk_Product_customerID1_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Product_customerID1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`WoodsB_customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`WoodsB_Transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`WoodsB_Transactions` (
  `idTransaction` INT NOT NULL,
  `idProductid` VARCHAR(45) NULL,
  `customerID` INT NULL,
  `WoodsB_product_idProductid` INT NOT NULL,
  PRIMARY KEY (`idTransaction`),
  INDEX `fk_Transaction_customerID_idx` (`customerID` ASC) VISIBLE,
  INDEX `fk_WoodsB_Transactions_WoodsB_product1_idx` (`WoodsB_product_idProductid` ASC) VISIBLE,
  CONSTRAINT `fk_Transaction_customerID`
    FOREIGN KEY (`customerID`)
    REFERENCES `mydb`.`WoodsB_customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_WoodsB_Transactions_WoodsB_product1`
    FOREIGN KEY (`WoodsB_product_idProductid`)
    REFERENCES `mydb`.`WoodsB_product` (`idProductid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`WoodsB_reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`WoodsB_reviews` (
  `idReviews` INT NOT NULL,
  `ReviewsRating` VARCHAR(45) NULL,
  `idProductid` VARCHAR(45) NULL,
  PRIMARY KEY (`idReviews`),
  INDEX `fk_Reviews_Product1_idx` (`idProductid` ASC) VISIBLE,
  CONSTRAINT `fk_Reviews_Product1`
    FOREIGN KEY (`idProductid`)
    REFERENCES `mydb`.`WoodsB_product` (`idProductid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`WoodsB_ProductCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`WoodsB_ProductCategory` (
  `idProductCategory` VARCHAR(45) NOT NULL,
  `idProductid` INT NULL,
  PRIMARY KEY (`idProductCategory`),
  INDEX `fk_ProductCategory_Product1_idx` (`idProductid` ASC) VISIBLE,
  CONSTRAINT `fk_ProductCategory_Product1`
    FOREIGN KEY (`idProductid`)
    REFERENCES `mydb`.`WoodsB_product` (`idProductid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


