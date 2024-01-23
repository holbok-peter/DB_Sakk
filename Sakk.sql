DROP DATABASE IF EXISTS sakk;

CREATE DATABASE sakk DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;

USE sakk;

CREATE TABLE sakkozók (
    id INT PRIMARY KEY,
    szulnev VARCHAR(255),
    nem CHAR(1),
    szulorszag VARCHAR(3),
    szulovaros VARCHAR(255),
    szuldatum DATE
);

CREATE TABLE versenyzők (
    id INT PRIMARY KEY,
    sakkozoid INT,
    nev VARCHAR(255),
    orszag VARCHAR(3),
    FOREIGN KEY (sakkozoid) REFERENCES sakkozók(id)
);

CREATE TABLE élőpontok (
    helyezes INT,
    pontszam INT,
    jatek INT,
    versenyzoid INT,
    ranglistaid INT,
    PRIMARY KEY (versenyzoid, ranglistaid),
    FOREIGN KEY (versenyzoid) REFERENCES versenyzők(id)
    
);

CREATE TABLE ranglisták (
    id INT PRIMARY KEY,
    datum DATE
);

