### 3. Sakk
A sakkot – bár nem tartozik a látványsportok közé – igen sokan követik figyelemmel.
A sakkozók pillanatnyi játékerejét a FIDE-rangsor adja meg, amelyet az Élő-pontszám alapján
állapítanak meg. A ranglistát évente többször is kiadják. Az adatbázis a 2000 és 2011 közötti
ranglisták első 100 játékosának adatait tartalmazza.

### Táblák:
**sakkozo** (*id, szulnev, nem, szulorszag, szulovaros, szuldatum*)
>1. *id*     =>    A sakkozó azonosítója (szám), ez a kulcs
>2. *szulnev*   =>           A sakkozó születési neve (szöveg)
>3. *nem* => A sakkozó neme (szöveg), F (férfi) vagy N (nő)
>4. *szulorszag* =>             Azon ország nevének olimpiai rövidítése, ahol a sakkozó született (szöveg)
>5. *szulovaros*     =>          Annak a városnak a neve, ahol a sakkozó született (szöveg). Ha nem ismert, akkor üres.
>6. *szuldatum*        =>        A sakkozó születési dátuma (dátum) 

Egy sakkozó pályafutása során gyakran más ország, akár országok színeiben versenyez, mint
ahol született. Előfordul, hogy az országváltással a sakkozó neve is megváltozik. Ez jelenik
meg a **versenyzo** táblában.

__versenyzo__ (_id, sakkozoid, nev, orszag_)
>1. _id_ => A versenyző azonosítója (szám), ez a kulcs
>2. _sakkozoid_ => A versenyzőt mint személyt megadó azonosító (szám)
>3. _nev_ => A versenyző adott országban viselt neve (szöveg)
>4. _orszag_ => Megadja az ország nevének az olimpiai rövidítését, amelynek
képviseletében versenyez a versenyző (szöveg)

**elopont** (_helyezes, pontszam, jatek, versenyzoid, ranglistaid_)
>1. _helyezes_ => A versenyző helyezése (szám), az adatbázis csak a legjobb 100
eredményeit tartalmazza
>2. _pontszam_ => A versenyző az adott ranglista összeállításakor birtokolt pontszáma
(szám)
>3. _jatek_ => A versenyző által az előző ranglistakészítés óta játszott partik száma
(szám)
>4. _versenyzoid_ => A versenyző azonosítója (szám) 
>5. _ranglistaid_ => A ranglista azonosítója (szám) 

__ranglista__ (*id, datum*)
>1. _id_ => A ranglista azonosítója (szám), ez a kulcs. A megoldás során
felhasználhatja, hogy az azonosítók időrendben követik egymást, a tábla
rekordjai *id* szerint rendezettek.
>2. _datum_ => A ranglista összeállításának dátuma (dátum)
ez a  kulcs

2. Tölts fel a __sakkozók__ táblába a következő adatokat:
> Korchnoi, Viktor Lvovics egy férfi aki URS, Leningrádban született 1931.03.23-én
> Portisch, Lajos egy férfi aki HUN, Zalaegerszeg született 1937.04.04-én
> Tukmakov, Vladimir B egy férfi aki URS, Szeged született 1947.02.09-én
> __...__
