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
SELECT DISTINCT szulorszag AS orszag
FROM sakkozók
WHERE szulorszag = 'URS';

-- (8. feladat:)
WITH magyar_sakkosok AS (
    SELECT *
    FROM sakkozók
    WHERE szulorszag = 'HUN'
)

SELECT szulnev, szulorszag, szuldatum
FROM magyar_sakkosok
ORDER BY szulnev, szuldatum;

-- (9. feladat:)
SELECT MIN(szuldatum) AS elteres_datuma
FROM (
    SELECT szuldatum
    FROM sakkozók
    WHERE MONTH(szuldatum) IN (1, 4, 7, 10)
    GROUP BY szuldatum
    HAVING COUNT(*) < 4
) AS elteresi_datumok;

-- (10. feladat:)
SELECT
    szulnev AS Sakkozo_Neve,
    DATEDIFF(szuldatum, CURRENT_DATE) AS Eletkor,
    MIN(szuldatum) AS Elso_Szereples_Datuma
FROM sakkozók
GROUP BY szulnev, szuldatum
ORDER BY Eletkor;


