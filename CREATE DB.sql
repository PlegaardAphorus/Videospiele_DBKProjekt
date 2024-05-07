CREATE DATABASE Videospiele;

USE Videospiele;

CREATE TABLE IF NOT EXISTS Spiele (
	Spiele_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(125) NOT NULL UNIQUE,
    Erscheinungsdatum DATE NOT NULL,
    Erschienen TINYINT NOT NULL,
    Deutsch TINYINT,
    Englisch TINYINT,
    USK INT
);