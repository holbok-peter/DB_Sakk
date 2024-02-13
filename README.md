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
| *szulovaros* | VARCHAR | A sakkozó szül. városa ha nem ismert akkor üres|  |
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

**elopontok** (_helyezes, pontszam, jatek, versenyzoid, ranglistaid_)
>1. _helyezes_ => A versenyző helyezése (szám), az adatbázis csak a legjobb 100
eredményeit tartalmazza
>2. _pontszam_ => A versenyző az adott ranglista összeállításakor birtokolt pontszáma
(szám)
>3. _jatek_ => A versenyző által az előző ranglistakészítés óta játszott partik száma
(szám)
>4. _versenyzoid_ => A versenyző azonosítója (szám) 
>5. _ranglistaid_ => A ranglista azonosítója (szám) 

__ranglisták__ (*id, datum*)
>1. _id_ => A ranglista azonosítója (szám), ez a kulcs. A megoldás során
felhasználhatja, hogy az azonosítók időrendben követik egymást, a tábla
rekordjai *id* szerint rendezettek.
>2. _datum_ => A ranglista összeállításának dátuma (dátum)
ez a  kulcs



=======
![](/képek/table.png)


2. Tölts fel a __sakkozók__ táblába a következő adatokat:
> Korchnoi, Viktor Lvovics egy férfi aki URS, Leningrádban született 1931.03.23-én
> Portisch, Lajos egy férfi aki HUN, Zalaegerszeg született 1937.04.04-én
> Tukmakov, Vladimir B egy férfi aki URS, Szeged született 1947.02.09-én
> __...__
