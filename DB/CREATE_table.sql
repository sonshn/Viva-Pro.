-- MySQL Script generated by MySQL Workbench
-- Tue Jun  8 13:08:58 2021
-- Model: New Model    Version: 1.0
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
-- -----------------------------------------------------
-- Schema synergy
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`USER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`USER` ;

CREATE TABLE IF NOT EXISTS `mydb`.`USER` (
  `Uid` VARCHAR(30) NOT NULL,
  `Upassword` VARCHAR(15) NOT NULL,
  `Uname` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Uid`),
  UNIQUE INDEX `Uemail_UNIQUE` (`Upassword` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SENTENCE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`SENTENCE` ;

CREATE TABLE IF NOT EXISTS `mydb`.`SENTENCE` (
  `Uid` VARCHAR(30) NOT NULL,
  `Snumber` INT NOT NULL,
  `Sdate` DATETIME NOT NULL,
  `Sform` VARCHAR(512) NOT NULL,
  `Sresult` VARCHAR(512) NULL,
  PRIMARY KEY (`Uid`, `Snumber`),
  CONSTRAINT `fk_SENTENCE_USER1`
    FOREIGN KEY (`Uid`)
    REFERENCES `mydb`.`USER` (`Uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`WORD`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`WORD` ;

CREATE TABLE IF NOT EXISTS `mydb`.`WORD` (
  `Uid` VARCHAR(30) NOT NULL,
  `Snumber` INT NOT NULL,
  `Wid` INT NOT NULL,
  `Wspos` INT NULL,
  `Wepos` INT NULL,
  `Wform` VARCHAR(512) NOT NULL,
  `Wtag` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`Uid`, `Snumber`, `Wid`),
  CONSTRAINT `fk_WORD_SENTENCE1`
    FOREIGN KEY (`Uid` , `Snumber`)
    REFERENCES `mydb`.`SENTENCE` (`Uid` , `Snumber`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`REPORT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`REPORT` ;

CREATE TABLE IF NOT EXISTS `mydb`.`REPORT` (
  `Rspos` INT NOT NULL,
  `Repos` INT NOT NULL,
  `Rtag` VARCHAR(4) NOT NULL,
  `Rdate` DATETIME NOT NULL,
  `Uid` VARCHAR(30) NOT NULL,
  `Snumber` INT NOT NULL,
  `Wid` INT NOT NULL,
  `Rstate` INT NOT NULL,
  PRIMARY KEY (`Uid`, `Snumber`, `Wid`),
  CONSTRAINT `fk_REPORT_WORD1`
    FOREIGN KEY (`Uid` , `Snumber` , `Wid`)
    REFERENCES `mydb`.`WORD` (`Uid` , `Snumber` , `Wid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
