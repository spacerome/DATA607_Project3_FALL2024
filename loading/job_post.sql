-- MySQL Script generated by MySQL Workbench
-- Sat Oct 12 11:41:57 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema job_portal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema job_portal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `job_portal` DEFAULT CHARACTER SET utf8 ;
USE `job_portal` ;

-- -----------------------------------------------------
-- Table `job_portal`.`company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `job_portal`.`company` ;

CREATE TABLE IF NOT EXISTS `job_portal`.`company` (
  `company_id` INT NOT NULL,
  `company_name` VARCHAR(50) NULL,
  PRIMARY KEY (`company_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_portal`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `job_portal`.`status` ;

CREATE TABLE IF NOT EXISTS `job_portal`.`status` (
  `status_id` INT NOT NULL,
  `status_name` VARCHAR(45) NULL,
  UNIQUE INDEX `status_name_UNIQUE` (`status_name` ASC),
  PRIMARY KEY (`status_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_portal`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `job_portal`.`location` ;

CREATE TABLE IF NOT EXISTS `job_portal`.`location` (
  `location_id` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE INDEX `city_UNIQUE` (`city` ASC),
  UNIQUE INDEX `country_UNIQUE` (`country` ASC),
  UNIQUE INDEX `state_UNIQUE` (`state` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_portal`.`job_post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `job_portal`.`job_post` ;

CREATE TABLE IF NOT EXISTS `job_portal`.`job_post` (
  `job_post_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `job_title` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `last_processing_time` TIMESTAMP NULL,
  PRIMARY KEY (`job_post_id`),
  INDEX `company_id_idx` (`company_id` ASC),
  INDEX `status_id_idx` (`status_id` ASC),
  INDEX `location_id_idx` (`location_id` ASC),
  CONSTRAINT `company_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `job_portal`.`company` (`company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `status_id`
    FOREIGN KEY (`status_id`)
    REFERENCES `job_portal`.`status` (`status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `job_portal`.`location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_portal`.`skill`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `job_portal`.`skill` ;

CREATE TABLE IF NOT EXISTS `job_portal`.`skill` (
  `skill_id` INT NOT NULL,
  `skill_name` VARCHAR(45) NULL,
  PRIMARY KEY (`skill_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_portal`.`job_post_skill`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `job_portal`.`job_post_skill` ;

CREATE TABLE IF NOT EXISTS `job_portal`.`job_post_skill` (
  `id` INT NOT NULL,
  `job_post_id` INT NOT NULL,
  `skill_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `job_post_skill_unique` (`job_post_id` ASC, `skill_id` ASC),
  INDEX `skill_id_idx` (`skill_id` ASC),
  CONSTRAINT `job_post_id`
    FOREIGN KEY (`job_post_id`)
    REFERENCES `job_portal`.`job_post` (`job_post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `skill_id`
    FOREIGN KEY (`skill_id`)
    REFERENCES `job_portal`.`skill` (`skill_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
