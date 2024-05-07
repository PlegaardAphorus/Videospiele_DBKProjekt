-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Videospiele
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Videospiele
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Videospiele` DEFAULT CHARACTER SET utf8 ;
USE `Videospiele` ;

-- -----------------------------------------------------
-- Table `Videospiele`.`Spiele`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Spiele` (
  `Spiele_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(125) NOT NULL,
  `Erscheinungsdatum` DATE NOT NULL,
  `Erschienen` TINYINT NOT NULL,
  `Deutsch` TINYINT NULL,
  `Englisch` TINYINT NULL,
  `USK` INT NULL,
  PRIMARY KEY (`Spiele_ID`),
  UNIQUE INDEX `Spiele_ID_UNIQUE` (`Spiele_ID` ASC) VISIBLE,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Entwickler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Entwickler` (
  `Entwickler_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Bekannte Spiele` VARCHAR(125) NOT NULL,
  `Gründungsjahr` DATE NOT NULL,
  `Main-Engine` VARCHAR(45) NULL,
  `Hauptsitz` VARCHAR(125) NOT NULL,
  PRIMARY KEY (`Entwickler_ID`),
  UNIQUE INDEX `Entwickler_ID_UNIQUE` (`Entwickler_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Publisher` (
  `Publisher_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Bekannte Spiele` VARCHAR(125) NOT NULL,
  `Gründungsjahr` DATE NOT NULL,
  `Hauptsitz` VARCHAR(125) NOT NULL,
  PRIMARY KEY (`Publisher_ID`),
  UNIQUE INDEX `Publisher_ID_UNIQUE` (`Publisher_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Benutzer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Benutzer` (
  `Benutzer_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(125) NOT NULL,
  `Erstellungsdatum` DATE NOT NULL,
  `Anzahl_Freunde` INT NOT NULL,
  `Gesamtspielzeit` DOUBLE NULL,
  `E-mail` VARCHAR(125) NOT NULL,
  `Gebursdatum` DATE NOT NULL,
  `Meist_gespieltes_Spiel` VARCHAR(125) NULL,
  `Kuerzlich_gespieltes_Spiel` VARCHAR(125) NULL,
  PRIMARY KEY (`Benutzer_ID`),
  UNIQUE INDEX `Benutzer_ID_UNIQUE` (`Benutzer_ID` ASC) VISIBLE,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE,
  UNIQUE INDEX `E-mail_UNIQUE` (`E-mail` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Bewertung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Bewertung` (
  `Bewertung_ID` INT NOT NULL AUTO_INCREMENT,
  `Benutzer_ID` INT NOT NULL,
  `Bewertung` LONGTEXT NOT NULL,
  `Bewertungs_Datum` DATE NOT NULL,
  `Metacritic-Score` INT NOT NULL,
  PRIMARY KEY (`Bewertung_ID`),
  UNIQUE INDEX `Bewertung_ID_UNIQUE` (`Bewertung_ID` ASC) VISIBLE,
  INDEX `fk_Bewertung_Benutzer1_idx` (`Benutzer_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Bewertung_Benutzer1`
    FOREIGN KEY (`Benutzer_ID`)
    REFERENCES `Videospiele`.`Benutzer` (`Benutzer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Spielstände`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Spielstände` (
  `Spielstände_ID` INT NOT NULL AUTO_INCREMENT,
  `Benutzer_ID` INT NOT NULL,
  `Name` VARCHAR(125) NOT NULL,
  `Datum` DATE NOT NULL,
  PRIMARY KEY (`Spielstände_ID`),
  UNIQUE INDEX `Spielstände_ID_UNIQUE` (`Spielstände_ID` ASC) VISIBLE,
  INDEX `fk_Spielstände_Benutzer1_idx` (`Benutzer_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Spielstände_Benutzer1`
    FOREIGN KEY (`Benutzer_ID`)
    REFERENCES `Videospiele`.`Benutzer` (`Benutzer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Achievements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Achievements` (
  `Achievements` INT NOT NULL AUTO_INCREMENT,
  `Spiele_ID` INT NOT NULL,
  `Name` VARCHAR(125) NOT NULL,
  `Beschreibung` VARCHAR(125) NOT NULL,
  `Bedingungen` VARCHAR(125) NOT NULL,
  `Belohnung` VARCHAR(125) NULL,
  PRIMARY KEY (`Achievements`),
  UNIQUE INDEX `Achievements_UNIQUE` (`Achievements` ASC) VISIBLE,
  INDEX `fk_Achievements_Spiele1_idx` (`Spiele_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Achievements_Spiele1`
    FOREIGN KEY (`Spiele_ID`)
    REFERENCES `Videospiele`.`Spiele` (`Spiele_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Tags` (
  `Tags_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(125) NOT NULL,
  `Beschreibung` VARCHAR(125) NOT NULL,
  PRIMARY KEY (`Tags_ID`),
  UNIQUE INDEX `Tags_ID_UNIQUE` (`Tags_ID` ASC) VISIBLE,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE,
  UNIQUE INDEX `Beschreibung_UNIQUE` (`Beschreibung` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Genre` (
  `Genre` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(125) NOT NULL,
  `Beschreibung` VARCHAR(125) NOT NULL,
  PRIMARY KEY (`Genre`),
  UNIQUE INDEX `Genre_UNIQUE` (`Genre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Launcher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Launcher` (
  `Launcher_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(125) NOT NULL,
  `Entwickler` VARCHAR(125) NOT NULL,
  `Erscheinungsdatum` DATE NOT NULL,
  PRIMARY KEY (`Launcher_ID`),
  UNIQUE INDEX `Launcher_ID_UNIQUE` (`Launcher_ID` ASC) VISIBLE)
ENGINE = InnoDB
COMMENT = '							-';


-- -----------------------------------------------------
-- Table `Videospiele`.`Verkäufer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Verkäufer` (
  `Verkäufer_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(125) NOT NULL,
  `Standort` VARCHAR(125) NOT NULL,
  `Zahlungsart` VARCHAR(125) NULL,
  `Versandoptionen` VARCHAR(125) NULL,
  `Email` VARCHAR(125) NULL,
  PRIMARY KEY (`Verkäufer_ID`),
  UNIQUE INDEX `Verkäufer_ID_UNIQUE` (`Verkäufer_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Plattformen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Plattformen` (
  `Plattformen_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(125) NOT NULL,
  PRIMARY KEY (`Plattformen_ID`),
  UNIQUE INDEX `Plattformen_ID_UNIQUE` (`Plattformen_ID` ASC) VISIBLE,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Plattformen_has_Spiele`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Plattformen_has_Spiele` (
  `Plattformen_ID` INT NOT NULL,
  `Spiele_ID` INT NOT NULL,
  PRIMARY KEY (`Plattformen_ID`, `Spiele_ID`),
  INDEX `fk_Plattformen_has_Spiele_Spiele1_idx` (`Spiele_ID` ASC) VISIBLE,
  INDEX `fk_Plattformen_has_Spiele_Plattformen_idx` (`Plattformen_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Plattformen_has_Spiele_Plattformen`
    FOREIGN KEY (`Plattformen_ID`)
    REFERENCES `Videospiele`.`Plattformen` (`Plattformen_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plattformen_has_Spiele_Spiele1`
    FOREIGN KEY (`Spiele_ID`)
    REFERENCES `Videospiele`.`Spiele` (`Spiele_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Verkäufer_has_Spiele`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Verkäufer_has_Spiele` (
  `Verkäufer_ID` INT NOT NULL,
  `Spiele_ID` INT NOT NULL,
  PRIMARY KEY (`Verkäufer_ID`, `Spiele_ID`),
  INDEX `fk_Verkäufer_has_Spiele_Spiele1_idx` (`Spiele_ID` ASC) VISIBLE,
  INDEX `fk_Verkäufer_has_Spiele_Verkäufer1_idx` (`Verkäufer_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Verkäufer_has_Spiele_Verkäufer1`
    FOREIGN KEY (`Verkäufer_ID`)
    REFERENCES `Videospiele`.`Verkäufer` (`Verkäufer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Verkäufer_has_Spiele_Spiele1`
    FOREIGN KEY (`Spiele_ID`)
    REFERENCES `Videospiele`.`Spiele` (`Spiele_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Launcher_has_Spiele`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Launcher_has_Spiele` (
  `Launcher_Launcher_ID` INT NOT NULL,
  `Spiele_Spiele_ID` INT NOT NULL,
  PRIMARY KEY (`Launcher_Launcher_ID`, `Spiele_Spiele_ID`),
  INDEX `fk_Launcher_has_Spiele_Spiele1_idx` (`Spiele_Spiele_ID` ASC) VISIBLE,
  INDEX `fk_Launcher_has_Spiele_Launcher1_idx` (`Launcher_Launcher_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Launcher_has_Spiele_Launcher1`
    FOREIGN KEY (`Launcher_Launcher_ID`)
    REFERENCES `Videospiele`.`Launcher` (`Launcher_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Launcher_has_Spiele_Spiele1`
    FOREIGN KEY (`Spiele_Spiele_ID`)
    REFERENCES `Videospiele`.`Spiele` (`Spiele_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Genre_has_Spiele`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Genre_has_Spiele` (
  `Genre` INT NOT NULL,
  `Spiele_ID` INT NOT NULL,
  PRIMARY KEY (`Genre`, `Spiele_ID`),
  INDEX `fk_Genre_has_Spiele_Spiele1_idx` (`Spiele_ID` ASC) VISIBLE,
  INDEX `fk_Genre_has_Spiele_Genre1_idx` (`Genre` ASC) VISIBLE,
  CONSTRAINT `fk_Genre_has_Spiele_Genre1`
    FOREIGN KEY (`Genre`)
    REFERENCES `Videospiele`.`Genre` (`Genre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Genre_has_Spiele_Spiele1`
    FOREIGN KEY (`Spiele_ID`)
    REFERENCES `Videospiele`.`Spiele` (`Spiele_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Tags_has_Spiele`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Tags_has_Spiele` (
  `Tags_ID` INT NOT NULL,
  `Spiele_ID` INT NOT NULL,
  PRIMARY KEY (`Tags_ID`, `Spiele_ID`),
  INDEX `fk_Tags_has_Spiele_Spiele1_idx` (`Spiele_ID` ASC) VISIBLE,
  INDEX `fk_Tags_has_Spiele_Tags1_idx` (`Tags_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Tags_has_Spiele_Tags1`
    FOREIGN KEY (`Tags_ID`)
    REFERENCES `Videospiele`.`Tags` (`Tags_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tags_has_Spiele_Spiele1`
    FOREIGN KEY (`Spiele_ID`)
    REFERENCES `Videospiele`.`Spiele` (`Spiele_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Achievements_has_Benutzer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Achievements_has_Benutzer` (
  `Achievements` INT NOT NULL,
  `Benutzer_ID` INT NOT NULL,
  PRIMARY KEY (`Achievements`, `Benutzer_ID`),
  INDEX `fk_Achievements_has_Benutzer_Benutzer1_idx` (`Benutzer_ID` ASC) VISIBLE,
  INDEX `fk_Achievements_has_Benutzer_Achievements1_idx` (`Achievements` ASC) VISIBLE,
  CONSTRAINT `fk_Achievements_has_Benutzer_Achievements1`
    FOREIGN KEY (`Achievements`)
    REFERENCES `Videospiele`.`Achievements` (`Achievements`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Achievements_has_Benutzer_Benutzer1`
    FOREIGN KEY (`Benutzer_ID`)
    REFERENCES `Videospiele`.`Benutzer` (`Benutzer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Entwickler_has_Spiele`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Entwickler_has_Spiele` (
  `Entwickler_ID` INT NOT NULL,
  `Spiele_ID` INT NOT NULL,
  PRIMARY KEY (`Entwickler_ID`, `Spiele_ID`),
  INDEX `fk_Entwickler_has_Spiele_Spiele1_idx` (`Spiele_ID` ASC) VISIBLE,
  INDEX `fk_Entwickler_has_Spiele_Entwickler1_idx` (`Entwickler_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Entwickler_has_Spiele_Entwickler1`
    FOREIGN KEY (`Entwickler_ID`)
    REFERENCES `Videospiele`.`Entwickler` (`Entwickler_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entwickler_has_Spiele_Spiele1`
    FOREIGN KEY (`Spiele_ID`)
    REFERENCES `Videospiele`.`Spiele` (`Spiele_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Publisher_has_Spiele`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Publisher_has_Spiele` (
  `Publisher_ID` INT NOT NULL,
  `Spiele_ID` INT NOT NULL,
  PRIMARY KEY (`Publisher_ID`, `Spiele_ID`),
  INDEX `fk_Publisher_has_Spiele_Spiele1_idx` (`Spiele_ID` ASC) VISIBLE,
  INDEX `fk_Publisher_has_Spiele_Publisher1_idx` (`Publisher_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Publisher_has_Spiele_Publisher1`
    FOREIGN KEY (`Publisher_ID`)
    REFERENCES `Videospiele`.`Publisher` (`Publisher_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Publisher_has_Spiele_Spiele1`
    FOREIGN KEY (`Spiele_ID`)
    REFERENCES `Videospiele`.`Spiele` (`Spiele_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Entwickler_has_Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Entwickler_has_Genre` (
  `Entwickler_ID` INT NOT NULL,
  `Genre` INT NOT NULL,
  PRIMARY KEY (`Entwickler_ID`, `Genre`),
  INDEX `fk_Entwickler_has_Genre_Genre1_idx` (`Genre` ASC) VISIBLE,
  INDEX `fk_Entwickler_has_Genre_Entwickler1_idx` (`Entwickler_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Entwickler_has_Genre_Entwickler1`
    FOREIGN KEY (`Entwickler_ID`)
    REFERENCES `Videospiele`.`Entwickler` (`Entwickler_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entwickler_has_Genre_Genre1`
    FOREIGN KEY (`Genre`)
    REFERENCES `Videospiele`.`Genre` (`Genre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Videospiele`.`Spiele_has_Benutzer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Videospiele`.`Spiele_has_Benutzer` (
  `Spiele_ID` INT NOT NULL,
  `Benutzer_ID` INT NOT NULL,
  PRIMARY KEY (`Spiele_ID`, `Benutzer_ID`),
  INDEX `fk_Spiele_has_Benutzer_Benutzer1_idx` (`Benutzer_ID` ASC) VISIBLE,
  INDEX `fk_Spiele_has_Benutzer_Spiele1_idx` (`Spiele_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Spiele_has_Benutzer_Spiele1`
    FOREIGN KEY (`Spiele_ID`)
    REFERENCES `Videospiele`.`Spiele` (`Spiele_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Spiele_has_Benutzer_Benutzer1`
    FOREIGN KEY (`Benutzer_ID`)
    REFERENCES `Videospiele`.`Benutzer` (`Benutzer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
