USE sakk;


-- (2. feladat:)
INSERT INTO sakkozók (id, szulnev, nem, szulorszag, szulovaros, szuldatum)
VALUES
(310, "So, Wesley", "F", "PHI", "Bacoor", "1993-10-09"),
(311, "Yu, Yangyi", "F", "CHN", "Huangshi", "1994-06-08"),
(312, "Giri, Anish", "F", "RUS", "Saint Petersburg", "1994-06-28");

-- (3. feladat:)
UPDATE sakkozók
SET szuldatum = "1987-03-10"
WHERE szulnev = "Balogh, Csaba";

-- (4. feladat:)
DELETE FROM ranglisták WHERE Id = 52;

-- (5. feladat:)
SELECT szulorszag, szulnev
FROM sakkozók
WHERE szulovaros IS NULL
ORDER BY szulorszag, szulnev;

-- (6. feladat:)
SELECT szulnev, szulorszag AS orszag
FROM sakkozók
WHERE szulorszag IS NOT NULL;

-- (7. feladat:)

SELECT DISTINCT szulorszag AS Szuletesi_Orszag, orszagok.nev AS Orszag
FROM sakkozók
INNER JOIN orszagok ON sakkozók.szulorszag = orszagok.rovid_nev
WHERE szulorszag = 'URS';



-- (8. feladat:)

SELECT sakkozók.szulnev AS Versenyzo_Neve, 
    ranglisták.datum AS Ranglista_Datuma, 
    ranglisták.helyezes AS Helyezes, 
    ranglisták.pontszam AS Pontszam
FROM ranglisták
INNER JOIN sakkozók ON ranglisták.sakkozo_id = sakkozók.id
WHERE sakkozók.szulorszag = 'HUN'
ORDER BY sakkozók.szulnev, ranglisták.datum;


-- (9. feladat:)
SELECT MIN(datum) AS Elso_Eltérés
FROM ranglisták
WHERE MONTH(datum) NOT IN (1, 4, 7, 10);


-- (10. feladat:)
SELECT sakkozók.szulnev AS Sakkozo_Neve, 
    YEAR(CURDATE()) - YEAR(sakkozók.szuldatum) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(sakkozók.szuldatum, '%m%d')) AS kor, 
    MIN(ranglisták.datum) AS Elso_Szereples_Datuma
FROM ranglisták
INNER JOIN sakkozók ON ranglisták.sakkozo_id = sakkozók.id
WHERE ranglisták.helyezes <= 10
GROUP BY sakkozo_id
ORDER BY kor;


