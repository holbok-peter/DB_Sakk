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
A sakk olimpia egyik résztvevője hibát talált a vele kapcsolatban lévő információk között. Ezt jelentette is szakszervezetének és a munkaelosztó téged bízott meg a hiba javításával.
A hiba jelentője a sakkozók táblában 279-es ID-vel található. Forrásunk szerint nem az általunk bevitt időben született hanem 1987. 03. 10-án.

4. feladat:
Egy impostort találtak a ranglisták között az 52. adatnak nem kéne ott lenni. Pusztítsd el.

5. feladat:
