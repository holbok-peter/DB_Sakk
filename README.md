### Sakk
A sakkot – bár nem tartozik a látványsportok közé – igen sokan követik figyelemmel.
A sakkozók pillanatnyi játékerejét a FIDE-rangsor adja meg, amelyet az Élő-pontszám alapján állapítanak meg. A ranglistát évente többször is kiadják. Az adatbázis a 2000 és 2011 közötti ranglisták első valahány játékosának adatait tartalmazza.

### Táblák:
**sakkozók** (*id, szulnev, nem, szulorszag, szulovaros, szuldatum*)
| Név | Típus | Leírás | Elsődleges kulcs | Idegen kulcs |
|:-:|:-:|:-:|:-:|:-:|
| *id* | INT | A sakkozók azonosítója | X |
| *szulnev* | VARCHAR | A sakkozók szül. neve |  |
| *nem* | CHAR | A sakkozó neme |  |
| *szulorszag* | VARCHAR | A sakkozó szül. országának monogrammja |
| *szulovaros* | VARCHAR | A sakkozó szül. városa ha ismeretlen akkor üres|  |
| *szuldatum* | DATE | A sakkozó születési dátuma |  |

Egy sakkozó pályafutása során gyakran más ország, akár országok színeiben versenyez, mint
ahol született. Előfordul, hogy az országváltással a sakkozó neve is megváltozik. Ez jelenik
meg a **versenyzők** táblában.

**versenyzők**(*id, sakkozoID, név, ország*)
| Név | Típus | Leírás | Elsődleges kulcs | Idegen kulcs |
|--|:-:|:-:|:-:|:-:|
| *id* | INT | A versenyző azonosítója | X |  |
| *sakkozoID* | INT | A versenyző mint személy megadó azonosítója |  | X |
| *név*| VARCHAR | A versenyző neve |  |  |
| *ország* | VARCHAR | A versenyző átlal képviselt ország |  |  |

__ranglisták__ (*id, datum*)

| Név | Típus | Leírás | Elsődleges kulcs | Idegen kulcs |
|:-:|:-:|:-:|:-:|:-:|
| *id* | INT | A ranglista azonosítója | X |  |
| *datum* | DATE | A ranglista összeállításának dátuma |  |  |

**elopontok** (_helyezes, pontszam, jatek, versenyzoid, ranglistaid_)

| Név | Típus | Leírás | Elsődleges kulcs | Idegen kulcs |
|:-:|:-:|:-:|:-:|:-:|
| *helyezes* | INT | A versenyző helyezése |  |  |
| *pontszam* | INT | A versenyző által birtokolt pontszám |  |  |
| *jatek* | INT | Az előző rangl.készítés óta játszott partik sz. |  |  |
| *versenyzoId* | INT | A versenyző azonosítója |  | X |
| *ranglistaId* | INT | A ranglista azonosítója |  | X |


![](/képek/tábla.png)


Feltételezheti, hogy az állományban nem lesznek a megoldást zavaró tényezők.


1. A feladatok megoldása előtt futtasa a Sakk.sql állományt. A Sakk.sql állomány futtatásával 

2. Egy hacker csoport megtámadta a olimpia szervezetének szervereit. A támadás során több sakk versenyző törlődtek. Illessze be a következő versenyzők adatait a versenyzők listába. (2. feladat:)
>- Wesley So egy férfi aki 1993. 10. 09-én született PHI, Bacoor-ban.
>- Yangyi Yu egy férfi aki 1994. 06. 08-án született CHN, Huangshi-ban.
>- Anish Giri egy férfi aki 1994. 06. 28-án született RUS, Saint Petersburg-ban.

3. A sakk olimpia egyik résztvevője hibát talált a vele kapcsolatban lévő információk között. Ezt jelentette is szakszervezetének és a munkaelosztó téged bízott meg a hiba javításával. A hiba jelentője a sakkozók táblában Balogh Csaba néven található. Forrásunk szerint nem az általunk bevitt időben született hanem 1987. 03. 10-án. (3. feladat:)

4. Egy impostort találtak a ranglisták között. Az 52-es azonosítójú sornak nem kéne ott lenni. Pusztítsd el. (4. feladat:)

5. Készítsen SQL parnacsot, amely megadja azokat a sakkozókat, akiknek nincs feltüntetve a szülővárosa! A sakkozó születési országának kódja és születési neve jelenjen meg ország, azon belül név szerinti ábécérendben! (5. feladat:)

6. Készítsen SQL parancsot, amely kilistázza azokat a sakkozókat, akik versenyeztek születési országuk színeiben! A születési nevet és az országot jelenítse meg! (6. feladat:)

7. Készítsen SQL parancsot, amely megadja, hogy a Szovjetunióban (URS) született versenyzők mely országok színeiben kerültek ranglistára! Ügyeljen arra, hogy minden ország pontosan egyszer szerepeljen! (7. feladat:)

8. Készítsen lekérdezést, amely a magyar színekben versenyzők adatait jeleníti meg! Az adatokat a versenyző neve szerint csoportosítva, a ranglista dátuma szerint rendezve jelenítse meg! A lekérdezést – az oszlopok sorrendjét, a jelentésfej és oszlopfejek tartalmát tekintve – az alábbi minta szerint alakítsa ki! Ügyeljen a jelentésfej ékezethelyességére! A lekérdezést SQL paranccsal vagy ideiglenes táblával készítse elő!
(8. feladat:)

9. A feldolgozott időszak kezdetén januárban, áprilisban, júliusban és októberben tették közé az Élő-pontszámok alapján készített ranglistát. Készítsen SQL parancsot, amely megadja azt a dátumot, amikor első ízben eltértek ettől! (9. feladat:)

10. Készítsen SQL parancsot, amely megadja, hogy melyik sakkozó hány évesen szerepelt először a legjobb 10 között az adatbázis ranglistáin! A születési nevet, az évszámok alapján meghatározott kort és az első szereplés dátumát jelenítse meg! A lista legyen kor szerint növekvően rendezett! Az eredményben az oszlopneveket az alábbi minta szerint adja meg! (10. feladat:)

11. Kramnik (születési neve: „Kramnik, Vladimir”) minden ranglistán szerepelt. Az alábbi SQL parancs meghatározza, hogy az egyes listákon mennyit változott a helyezése és a pontszáma az előzőhöz képest. A negatív érték a rontást, a pozitív a javítást jelenti. Készítse el a 8 segéd SQL parancsot, amelyet felhasználva az alábbi SQL parancs a feladatot megoldja! (11. feladat:)