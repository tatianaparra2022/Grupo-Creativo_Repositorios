-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ProyectoLaAcademia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ProyectoLaAcademia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProyectoLaAcademia` ;
USE `ProyectoLaAcademia` ;

-- -----------------------------------------------------
-- Table `ProyectoLaAcademia`.`REGISTO USUARIO ESTUDIANTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoLaAcademia`.`REGISTO USUARIO ESTUDIANTE` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoLaAcademia`.`Franja_horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoLaAcademia`.`Franja_horario` (
  `codigo_franja_horario` INT NULL,
  `franja_horario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo_franja_horario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoLaAcademia`.`Registro_Usuario_Estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoLaAcademia`.`Registro_Usuario_Estudiante` (
  `sexo_padre` VARCHAR(1) NOT NULL,
  `nombre_padre` VARCHAR(45) NOT NULL,
  `apellido_padre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `num_ced_padre` INT NULL,
  `num_cel` INT NOT NULL,
  `nombre_estud` VARCHAR(45) NOT NULL,
  `apellido_estud` VARCHAR(45) NOT NULL,
  `grado_estud` INT NOT NULL,
  `edad_estud` INT NULL,
  `sexo_estud` VARCHAR(1) NULL,
  `Franja_horario_codigo_franja_horario` INT NOT NULL,
  PRIMARY KEY (`num_ced_padre`, `Franja_horario_codigo_franja_horario`),
  INDEX `fk_Registro_Usuario_Estudiante_Franja_horario1_idx` (`Franja_horario_codigo_franja_horario` ASC) VISIBLE,
  CONSTRAINT `fk_Registro_Usuario_Estudiante_Franja_horario1`
    FOREIGN KEY (`Franja_horario_codigo_franja_horario`)
    REFERENCES `ProyectoLaAcademia`.`Franja_horario` (`codigo_franja_horario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoLaAcademia`.`Asignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoLaAcademia`.`Asignatura` (
  `codigo_asignatura` INT NULL,
  `nombre_asignatura` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo_asignatura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoLaAcademia`.`Registro_Usuario_Docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoLaAcademia`.`Registro_Usuario_Docente` (
  `sexo_doc` VARCHAR(1) NOT NULL,
  `nombre_doc` VARCHAR(45) NOT NULL,
  `apellido_doc` VARCHAR(45) NOT NULL,
  `correo_doc` VARCHAR(45) NOT NULL,
  `num_ced_doc` INT NULL,
  `num_cel_doc` INT NOT NULL,
  `nom_profesion_doc` VARCHAR(45) NOT NULL,
  `cod_profesion_doc` INT NOT NULL,
  `experiencia_doc` INT NOT NULL,
  `disponibilidad_doc` INT NOT NULL,
  `Asignatura_codigo_asignatura` INT NOT NULL,
  `Franja_horario_codigo_franja_horario` INT NOT NULL,
  PRIMARY KEY (`num_ced_doc`, `Asignatura_codigo_asignatura`, `Franja_horario_codigo_franja_horario`),
  INDEX `fk_Registro_Usuario_Docente_Asignatura1_idx` (`Asignatura_codigo_asignatura` ASC) VISIBLE,
  INDEX `fk_Registro_Usuario_Docente_Franja_horario1_idx` (`Franja_horario_codigo_franja_horario` ASC) VISIBLE,
  CONSTRAINT `fk_Registro_Usuario_Docente_Asignatura1`
    FOREIGN KEY (`Asignatura_codigo_asignatura`)
    REFERENCES `ProyectoLaAcademia`.`Asignatura` (`codigo_asignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Usuario_Docente_Franja_horario1`
    FOREIGN KEY (`Franja_horario_codigo_franja_horario`)
    REFERENCES `ProyectoLaAcademia`.`Franja_horario` (`codigo_franja_horario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoLaAcademia`.`Registro_Servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoLaAcademia`.`Registro_Servicio` (
  `tiempo_asesoria` INT NOT NULL,
  `costo_asesoria` FLOAT NOT NULL,
  `Registro_Usuario_Estudiante_num_ced_padre` INT NOT NULL,
  `Registro_Usuario_Estudiante_Franja_horario_codigo_franja_horario` INT NOT NULL,
  INDEX `fk_Registro_Servicio_Registro_Usuario_Estudiante1_idx` (`Registro_Usuario_Estudiante_num_ced_padre` ASC, `Registro_Usuario_Estudiante_Franja_horario_codigo_franja_horario` ASC) VISIBLE,
  CONSTRAINT `fk_Registro_Servicio_Registro_Usuario_Estudiante1`
    FOREIGN KEY (`Registro_Usuario_Estudiante_num_ced_padre` , `Registro_Usuario_Estudiante_Franja_horario_codigo_franja_horario`)
    REFERENCES `ProyectoLaAcademia`.`Registro_Usuario_Estudiante` (`num_ced_padre` , `Franja_horario_codigo_franja_horario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoLaAcademia`.`Tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoLaAcademia`.`Tema` (
  `codigo_tema` INT NULL,
  `Temacol` VARCHAR(45) NULL,
  `Registro_Usuario_Estudiante_num_ced_padre` INT NOT NULL,
  `Registro_Usuario_Estudiante_Franja_horario_codigo_franja_horario` INT NOT NULL,
  PRIMARY KEY (`codigo_tema`, `Registro_Usuario_Estudiante_num_ced_padre`, `Registro_Usuario_Estudiante_Franja_horario_codigo_franja_horario`),
  INDEX `fk_Tema_Registro_Usuario_Estudiante1_idx` (`Registro_Usuario_Estudiante_num_ced_padre` ASC, `Registro_Usuario_Estudiante_Franja_horario_codigo_franja_horario` ASC) VISIBLE,
  CONSTRAINT `fk_Tema_Registro_Usuario_Estudiante1`
    FOREIGN KEY (`Registro_Usuario_Estudiante_num_ced_padre` , `Registro_Usuario_Estudiante_Franja_horario_codigo_franja_horario`)
    REFERENCES `ProyectoLaAcademia`.`Registro_Usuario_Estudiante` (`num_ced_padre` , `Franja_horario_codigo_franja_horario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoLaAcademia`.`Franja_horario_has_Registro_Usuario_Docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoLaAcademia`.`Franja_horario_has_Registro_Usuario_Docente` (
  `Franja_horario_codigo_franja_horario` INT NOT NULL,
  `Registro_Usuario_Docente_num_ced_doc` INT NOT NULL,
  `Registro_Usuario_Docente_Asignatura_codigo_asignatura` INT NOT NULL,
  `Registro_Usuario_Docente_Franja_horario_codigo_franja_horario` INT NOT NULL,
  PRIMARY KEY (`Franja_horario_codigo_franja_horario`, `Registro_Usuario_Docente_num_ced_doc`, `Registro_Usuario_Docente_Asignatura_codigo_asignatura`, `Registro_Usuario_Docente_Franja_horario_codigo_franja_horario`),
  INDEX `fk_Franja_horario_has_Registro_Usuario_Docente_Registro_Usu_idx` (`Registro_Usuario_Docente_num_ced_doc` ASC, `Registro_Usuario_Docente_Asignatura_codigo_asignatura` ASC, `Registro_Usuario_Docente_Franja_horario_codigo_franja_horario` ASC) VISIBLE,
  INDEX `fk_Franja_horario_has_Registro_Usuario_Docente_Franja_horar_idx` (`Franja_horario_codigo_franja_horario` ASC) VISIBLE,
  CONSTRAINT `fk_Franja_horario_has_Registro_Usuario_Docente_Franja_horario1`
    FOREIGN KEY (`Franja_horario_codigo_franja_horario`)
    REFERENCES `ProyectoLaAcademia`.`Franja_horario` (`codigo_franja_horario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Franja_horario_has_Registro_Usuario_Docente_Registro_Usuar1`
    FOREIGN KEY (`Registro_Usuario_Docente_num_ced_doc` , `Registro_Usuario_Docente_Asignatura_codigo_asignatura` , `Registro_Usuario_Docente_Franja_horario_codigo_franja_horario`)
    REFERENCES `ProyectoLaAcademia`.`Registro_Usuario_Docente` (`num_ced_doc` , `Asignatura_codigo_asignatura` , `Franja_horario_codigo_franja_horario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectoLaAcademia`.`Registro_Usuario_Estudiante_has_Asignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectoLaAcademia`.`Registro_Usuario_Estudiante_has_Asignatura` (
  `Registro_Usuario_Estudiante_num_ced_padre` INT NOT NULL,
  `Registro_Usuario_Estudiante_Franja_horario_codigo_franja_horario` INT NOT NULL,
  `Asignatura_codigo_asignatura` INT NOT NULL,
  PRIMARY KEY (`Registro_Usuario_Estudiante_num_ced_padre`, `Registro_Usuario_Estudiante_Franja_horario_codigo_franja_horario`, `Asignatura_codigo_asignatura`),
  INDEX `fk_Registro_Usuario_Estudiante_has_Asignatura_Asignatura1_idx` (`Asignatura_codigo_asignatura` ASC) VISIBLE,
  INDEX `fk_Registro_Usuario_Estudiante_has_Asignatura_Registro_Usua_idx` (`Registro_Usuario_Estudiante_num_ced_padre` ASC, `Registro_Usuario_Estudiante_Franja_horario_codigo_franja_horario` ASC) VISIBLE,
  CONSTRAINT `fk_Registro_Usuario_Estudiante_has_Asignatura_Registro_Usuari1`
    FOREIGN KEY (`Registro_Usuario_Estudiante_num_ced_padre` , `Registro_Usuario_Estudiante_Franja_horario_codigo_franja_horario`)
    REFERENCES `ProyectoLaAcademia`.`Registro_Usuario_Estudiante` (`num_ced_padre` , `Franja_horario_codigo_franja_horario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Usuario_Estudiante_has_Asignatura_Asignatura1`
    FOREIGN KEY (`Asignatura_codigo_asignatura`)
    REFERENCES `ProyectoLaAcademia`.`Asignatura` (`codigo_asignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
