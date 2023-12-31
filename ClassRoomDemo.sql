-- MySQL Script generated by MySQL Workbench
-- Tue Dec  5 14:24:33 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema demo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema demo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `demo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `demo` ;

-- -----------------------------------------------------
-- Table `demo`.`STUDENT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `demo`.`STUDENT` ;

CREATE TABLE IF NOT EXISTS `demo`.`STUDENT` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `demo`.`COURSE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `demo`.`COURSE` ;

CREATE TABLE IF NOT EXISTS `demo`.`COURSE` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `demo`.`OFFICE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `demo`.`OFFICE` ;

CREATE TABLE IF NOT EXISTS `demo`.`OFFICE` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `demo`.`TEACHER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `demo`.`TEACHER` ;

CREATE TABLE IF NOT EXISTS `demo`.`TEACHER` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `office_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_office_id_idx` (`office_id` ASC) VISIBLE,
  CONSTRAINT `fk_office_id`
    FOREIGN KEY (`office_id`)
    REFERENCES `demo`.`OFFICE` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `demo`.`CLASSROOM`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `demo`.`CLASSROOM` ;

CREATE TABLE IF NOT EXISTS `demo`.`CLASSROOM` (
  `student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `teacher_id` INT NOT NULL,
  `room` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`student_id`, `course_id`, `teacher_id`),
  INDEX `fk_course_id_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_teacher_id_idx` (`teacher_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `demo`.`STUDENT` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `demo`.`COURSE` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_id`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `demo`.`TEACHER` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
