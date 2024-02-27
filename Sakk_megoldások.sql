-- (2. feladat:)
INSERT INTO versenyzők (szulnev, nem, szulorszag, szulovaros, szuldatum)
VALUES
("So, Wesley", "F", "PHI", "Bacoor", "1993-10-09")
("Yu, Yangyi", "F", "CHN", "Huangshi", "1994-06-08")
("Giri, Anish", "F", "RUS", "Saint Petersburg", "1994-06-28")

-- (3. feladat:)
UPDATE sakkozók;
SET szuldatum = "1987-03-10";
WHERE id = 279;

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
SELECT DISTINCT szulorszag AS orszag
FROM sakkozók
WHERE szulorszag = 'URS';

-- (8. feladat:)
WITH magyar_sakkosok AS (
    SELECT *
    FROM sakkozók
    WHERE szulorszag = 'HUN'
)

SELECT nev, szulorszag, datum
FROM magyar_sakkosok
ORDER BY nev, datum;

-- (9. feladat:)
SELECT MIN(datum) AS elteres_datuma
FROM (
    SELECT datum
    FROM sakkozók
    WHERE MONTH(datum) IN (1, 4, 7, 10)
    GROUP BY datum
    HAVING COUNT(*) < 4
) AS elteresi_datumok;

-- (10. feladat:)
SELECT
    nev AS Sakkozo_Neve,
    DATEDIFF(YEAR, szuldatum, MIN(datum)) AS Eletkor,
    MIN(datum) AS Elso_Szereples_Datuma
FROM sakkozók
WHERE helyezes <= 10
GROUP BY nev, szuldatum
ORDER BY Eletkor;

-- (11. feladat:)
segédparancs 1:
SELECT nev, datum, helyezes AS elozo_helyezes
FROM ranglisták
WHERE nev = 'Kramnik, Vladimir';

segédparancs 2:
SELECT nev, datum, helyezes AS aktualis_helyezes
FROM ranglisták
WHERE nev = 'Kramnik, Vladimir';

segédparancs 3:
SELECT akt.nev, akt.datum, 
       akt.aktualis_helyezes - elozo.elozo_helyezes AS helyezes_valtozas
FROM (parancs_2) akt
JOIN (parancs_1) elozo ON akt.nev = elozo.nev AND akt.datum = elozo.datum;

segédparancs 4:
SELECT AVG(helyezes_valtozas) AS atlagos_helyezes_valtozas
FROM (parancs_3) helyezes_valtozas;

segédparancs 5:
SELECT nev, datum, pontszam AS elozo_pontszam
FROM ranglisták
WHERE nev = 'Kramnik, Vladimir';

segédparancs 6:
SELECT nev, datum, pontszam AS aktualis_pontszam
FROM ranglisták
WHERE nev = 'Kramnik, Vladimir';

segédparancs 7:
SELECT akt.nev, akt.datum, 
       akt.aktualis_pontszam - elozo.elozo_pontszam AS pontszam_valtozas
FROM (parancs_6) akt
JOIN (parancs_5) elozo ON akt.nev = elozo.nev AND akt.datum = elozo.datum;

segédparancs 8:
SELECT AVG(pontszam_valtozas) AS atlagos_pontszam_valtozas
FROM (parancs_7) pontszam_valtozas;

főparancs:
SELECT 
    nev,
    datum,
    COALESCE(helyezes_valtozas, 0) AS helyezes_valtozas,
    COALESCE(pontszam_valtozas, 0) AS pontszam_valtozas
FROM (
    SELECT 
        akt.nev,
        akt.datum,
        akt.helyezes_valtozas,
        pontszam_valtozas
    FROM (parancs_3) akt
    LEFT JOIN (parancs_7) pontszam_valtozas 
    ON akt.nev = pontszam_valtozas.nev AND akt.datum = pontszam_valtozas.datum
) eredmeny
ORDER BY datum;
