-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Biblioteca` DEFAULT CHARACTER SET utf8 ;
USE `Biblioteca` ;

-- -----------------------------------------------------
-- Table `Biblioteca`.`Autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Autores` (
  `idAutores` INT NOT NULL AUTO_INCREMENT,
  `nomeAutores` VARCHAR(100) NULL,
  `dataNascimento` DATE NULL,
  `nacionalidade` VARCHAR(100) NULL,
  PRIMARY KEY (`idAutores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  `cpf` VARCHAR(100) NULL,
  `dataNascimento` DATE NULL,
  `endereco` VARCHAR(100) NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Emprestimos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Emprestimos` (
  `idEmprestimos` INT NOT NULL AUTO_INCREMENT,
  `dataEmprestimo` DATE NULL,
  `dataDevolucao` DATE NULL,
  `statusEmprestimo` VARCHAR(100) NULL,
  `Clientes_idClientes` INT NOT NULL,
  PRIMARY KEY (`idEmprestimos`, `Clientes_idClientes`),
  INDEX `fk_Emprestimos_Clientes1_idx` (`Clientes_idClientes` ASC) VISIBLE,
  CONSTRAINT `fk_Emprestimos_Clientes1`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `Biblioteca`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Editoras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Editoras` (
  `idEditoras` INT NOT NULL AUTO_INCREMENT,
  `nomeEditora` VARCHAR(100) NULL,
  `enderecoEditora` VARCHAR(100) NULL,
  PRIMARY KEY (`idEditoras`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Livro` (
  `idLivro` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NULL,
  `ISBN` VARCHAR(45) NULL,
  `anoPublicacao` DATE NULL,
  `Autores_idAutores` INT NOT NULL,
  `Emprestimos_idEmprestimos` INT NOT NULL,
  `Emprestimos_Clientes_idClientes` INT NOT NULL,
  `Editoras_idEditoras` INT NOT NULL,
  PRIMARY KEY (`idLivro`, `Autores_idAutores`, `Emprestimos_idEmprestimos`, `Emprestimos_Clientes_idClientes`, `Editoras_idEditoras`),
  INDEX `fk_Livro_Autores1_idx` (`Autores_idAutores` ASC) VISIBLE,
  INDEX `fk_Livro_Emprestimos1_idx` (`Emprestimos_idEmprestimos` ASC, `Emprestimos_Clientes_idClientes` ASC) VISIBLE,
  INDEX `fk_Livro_Editoras1_idx` (`Editoras_idEditoras` ASC) VISIBLE,
  CONSTRAINT `fk_Livro_Autores1`
    FOREIGN KEY (`Autores_idAutores`)
    REFERENCES `Biblioteca`.`Autores` (`idAutores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Livro_Emprestimos1`
    FOREIGN KEY (`Emprestimos_idEmprestimos` , `Emprestimos_Clientes_idClientes`)
    REFERENCES `Biblioteca`.`Emprestimos` (`idEmprestimos` , `Clientes_idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Livro_Editoras1`
    FOREIGN KEY (`Editoras_idEditoras`)
    REFERENCES `Biblioteca`.`Editoras` (`idEditoras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
