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


![](/képek/table.png)


2. Tölts fel a __sakkozók__ táblába a következő adatokat:
> Korchnoi, Viktor Lvovics egy férfi aki URS, Leningrádban született 1931.03.23-én
> Portisch, Lajos egy férfi aki HUN, Zalaegerszeg született 1937.04.04-én
> Tukmakov, Vladimir B egy férfi aki URS, Szeged született 1947.02.09-én
> __...__
