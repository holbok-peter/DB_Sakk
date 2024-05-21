USE sakk;

-- 1. feladat:

-- 2. feladat:
INSERT INTO sakkozók (id, szulnev, nem, szulorszag, szulovaros, szuldatum)
VALUES
    ( 310,"So, Wesley","F","PHI","Bacoor","1993-10-09"),
    ( 311, "Yu, Yangyi", "F", "CHN", "Huangshi", "1994-06-08"),
    ( 312, "Giri, Anish", "F", "RUS", "Saint Petersburg", "1994-06-28");

-- 3. feladat:
UPDATE sakkozók
SET szuldatum = "1987-03-11"
WHERE szulnev = "Balogh, Csaba";

-- 4. feladat:
DELETE FROM ranglisták 
WHERE id = 52;

-- 5. feladat:
SELECT
  szulorszag,
  szulnev
FROM sakkozók
WHERE szulovaros IS NULL
ORDER BY szulorszag, szulnev;

-- 6. feladat:
SELECT 
  versenyzők.nev,
  versenyzők.orszag
FROM versenyzők
  INNER JOIN sakkozók
    ON versenyzők.sakkozoId = sakkozók.id
    WHERE szulorszag = orszag;

-- 7. feladat:
SELECT DISTINCT
  versenyzők.orszag,
  versenyzők.nev
FROM versenyzők
  INNER JOIN sakkozók
    ON versenyzők.sakkozoId = sakkozók.id
    WHERE szulorszag = "URS"
    ORDER BY nev;

-- 8. feladat:
SELECT
  versenyzők.orszag,
  versenyzők.nev,
  ranglisták.datum  
FROM élőpontok
  INNER JOIN ranglisták
    ON élőpontok.ranglistaId = ranglisták.id
  INNER JOIN versenyzők
    ON élőpontok.versenyzoId = versenyzők.id
  INNER JOIN sakkozók
    ON versenyzők.sakkozoId = sakkozók.id
WHERE versenyzők.orszag = 'HUN'
GROUP BY versenyzők.nev
ORDER BY ranglisták.datum;

-- 9. feladat:
SELECT
  ranglisták.datum,
  MONTH(ranglisták.datum) AS hónap
FROM ranglisták
WHERE MONTH(ranglisták.datum) NOT IN (1, 4, 7, 10)
ORDER BY datum
LIMIT 1;


-- 10. feladat:
SELECT
  sakkozók.szulnev,
  MIN(YEAR(ranglisták.datum) - YEAR(sakkozók.szuldatum)) AS életkor
FROM versenyzők
  INNER JOIN sakkozók
    ON versenyzők.sakkozoId = sakkozók.id
  INNER JOIN élőpontok
    ON élőpontok.versenyzoId = versenyzők.id
  INNER JOIN ranglisták
    ON élőpontok.ranglistaId = ranglisták.id
WHERE élőpontok.helyezes <= 10
GROUP BY sakkozók.szulnev
ORDER BY életkor
