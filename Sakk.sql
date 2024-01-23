DROP DATABASE IF EXISTS sakk;

CREATE DATABASE sakk DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;

USE sakk;

CREATE TABLE sakkozo (
    id INT PRIMARY KEY,
    szulnev VARCHAR(255),
    nem CHAR(1),
    szulorszag VARCHAR(3),
    szulovaros VARCHAR(255),
    szuldatum DATE
);

CREATE TABLE versenyzo (
    id INT PRIMARY KEY,
    sakkozoid INT,
    nev VARCHAR(255),
    orszag VARCHAR(3),
    FOREIGN KEY (sakkozoid) REFERENCES sakkozo(id)
);

CREATE TABLE elopont (
    helyezes INT,
    pontszam INT,
    jatek INT,
    versenyzoid INT,
    ranglistaid INT,
    PRIMARY KEY (versenyzoid, ranglistaid),
    FOREIGN KEY (versenyzoid) REFERENCES versenyzo(id)
);

CREATE TABLE ranglista (
    id INT PRIMARY KEY,
    datum DATE
);

