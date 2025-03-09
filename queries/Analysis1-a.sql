SET ECHO ON
spool Analysis1-a.output
set timing on

-- query: list number of movies per year using actor nameid over their career
-- Parameters actor is "Alec Baldwin" and actress is "Helen Mirren"
SELECT NB.primaryname||','||TB.startyear||','||COUNT(*)
FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
WHERE NB.nconst = TP.nconst AND
      TP.tconst = TB.tconst AND
      Lower(NB.primaryname) in ('helen mirren', 'alec baldwin') AND
      LOWER(TB.titleType) = 'movie' AND
      LOWER(TP.category) IN ('actor', 'actress') AND TB.startyear NOT LIKE '\N'
GROUP BY NB.nconst, NB.primaryname, TB.startyear
ORDER BY NB.primaryname ASC,COUNT(*) DESC;

--Fav actor is "Akshay Kumar" and actress is "Deepika Padukon"
SELECT NB.primaryname||','||TB.startyear||','||COUNT(*)
FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
WHERE NB.nconst = TP.nconst AND
      TP.tconst = TB.tconst AND
      Lower(NB.primaryname) in ('akshay kumar', 'deepika padukone') AND
      LOWER(TB.titleType) = 'movie' AND
      LOWER(TP.category) IN ('actor', 'actress') AND TB.startyear NOT LIKE '\N'
GROUP BY NB.nconst, NB.primaryname, TB.startyear
ORDER BY NB.primaryname ASC,COUNT(*) DESC;

set echo off
