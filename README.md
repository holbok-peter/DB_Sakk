### 3. Sakk
A sakkot – bár nem tartozik a látványsportok közé – igen sokan követik figyelemmel.
A sakkozók pillanatnyi játékerejét a FIDE-rangsor adja meg, amelyet az Élő-pontszám alapján állapítanak meg. A ranglistát évente többször is kiadják. Az adatbázis a 2000 és 2011 közötti ranglisták első valahány játékosának adatait tartalmazza.

### Táblák:
**sakkozók** (*id, szulnev, nem, szulorszag, szulovaros, szuldatum*)
| Név | Típus | Leírás | Kulcs | Idegen kulcs |
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
| Név | Típus | Leírás | Kulcs | Idegen kulcs |
|--|:-:|:-:|:-:|:-:|
| *id* | INT | A versenyző azonosítója | X |  |
| *sakkozoID* | INT | A versenyző mint személy megadó azonosítója |  | X |
| *név*| VARCHAR | A versenyző neve |  |  |
| *ország* | VARCHAR | A versenyző átlal képviselt ország |  |  |

__ranglisták__ (*id, datum*)

| Név | Típus | Leírás | Kulcs | Idegen kulcs |
|:-:|:-:|:-:|:-:|:-:|
| *Id* | INT | A ranglista azonosítója | X |  |
| *datum* | DATE | A ranglista összeállításának dátuma |  |  |

**elopontok** (_helyezes, pontszam, jatek, versenyzoid, ranglistaid_)

| Név | Típus | Leírás | Kulcs | Idegen kulcs |
|:-:|:-:|:-:|:-:|:-:|
| *helyezes* | INT | A versenyző helyezése |  |  |
| *pontszam* | INT | A versenyző által birtokolt pontszám |  |  |
| *jatek* | INT | Az előző rangl.készítés óta játszott partik sz. |  |  |
| *versenyzoId* | INT | A versenyző azonosítója |  | X |
| *ranglistaId* | INT | A ranglista azonosítója |  | X |


![](/képek/tábla.png)


2. Feladat:
Egy hacker csoport megtámadta a olimpia szervezetének szervereit. A támadás során több sakk versenyző törlődtek. Illessze be a következő versenyzők adatait a versenyzők listába.
>Wesley So egy férfi aki 1993. 10. 09-én született PHI, Bacoor-ban.
>Yangyi Yu egy férfi aki 1994. 06. 08-án született CHN, Huangshi-ban.
>Anish Giri egy férfi aki 1994. 06. 28-án született RUS, Saint Petersburg-ban.

3. Feladat:
A sakk olimpia egyik résztvevője hibát talált a vele kapcsolatban lévő információk között. Ezt jelentette is szakszervezetének és a munkaelosztó téged bízott meg a hiba javításával. A hiba jelentője a sakkozók táblában 279-es ID-vel található. Forrásunk szerint nem az általunk bevitt időben született hanem 1987. 03. 10-án.

4. feladat:
Egy impostort találtak a ranglisták között az 52. adatnak nem kéne ott lenni. Pusztítsd el.

5. feladat:

5.1. feladat:
Készítsen SQL parnacsot, amely megadja azokat a sakkozókat, akiknek nincs feltüntetve a szülővárosa! A sakkozó születési országának kódja és születési neve jelenjen meg ország, azon belül név szerinti ábécérendben!

5.2. feladat:
Készítsen SQL parnacsot, amely kilistázza azokat a sakkozókat, akik versenyeztek születési országuk színeiben! A születési nevet és az országot jelenítse meg!

5.3. feladat:
Készítsen SQL parnacsot, amely megadja, hogy a Szovjetunióban (URS) született versenyzők mely országok színeiben kerültek ranglistára! Ügyeljen arra, hogy minden ország pontosan egyszer szerepeljen!

5.4. feladat:
Készítsen lekérdezést, amely a magyar színekben versenyzők adatait jeleníti meg! Az adatokat a versenyző neve szerint csoportosítva, a ranglista dátuma szerint rendezve jelenítse meg! A lekérdezést – az oszlopok sorrendjét, a jelentésfej és oszlopfejek tartalmát tekintve – az alábbi minta szerint alakítsa ki! Ügyeljen a jelentésfej ékezethelyességére! A lekérdezést SQL parnaccsal vagy ideiglenes táblával készítse elő!

5.5. feladat:
A feldolgozott időszak kezdetén januárban, áprilisban, júliusban és októberben tették közé az Élő-pontszámok alapján készített ranglistát. Készítsen SQL parnacsot, amely megadja azt a dátumot, amikor első ízben eltértek ettől!

5.6. feladat:
Készítsen SQL parnacsot, amely megadja, hogy melyik sakkozó hány évesen szerepelt először a legjobb 10 között az adatbázis ranglistáin! A születési nevet, az évszámok alapján meghatározott kort és az első szereplés dátumát jelenítse meg! A lista legyen kor szerint növekvően rendezett! Az eredményben az oszlopneveket az alábbi minta szerint adja meg! 

5.7. feladat:
Kramnik (születési neve: „Kramnik, Vladimir”) minden ranglistán szerepelt. Az alábbi SQL parnacs meghatározza, hogy az egyes listákon mennyit változott a helyezése és a pontszáma az előzőhöz képest. A negatív érték a rontást, a pozitív a javítást jelenti. Készítse el a 8seged SQL parnacsot, amelyet felhasználva az alábbi SQL parnacs a feladatot megoldja!