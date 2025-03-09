Set echo on
spool Correctness1-a.output
set timing on
SELECT TB.primarytitle||','||NB.primaryname||','||TB.startyear
FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
WHERE NB.nconst = TP.nconst AND
      TP.tconst = TB.tconst AND
      Lower(NB.primaryname) in ('helen mirren', 'alec baldwin') AND
      LOWER(TB.titleType) = 'movie' AND
      LOWER(TP.category) IN ('actor', 'actress') AND TB.startyear NOT LIKE '\N'
GROUP BY TB.primarytitle, NB.primaryname, TB.startyear
ORDER BY NB.primaryname ASC;

SELECT TB.primarytitle||','||NB.primaryname||','||TB.startyear
FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
WHERE NB.nconst = TP.nconst AND
      TP.tconst = TB.tconst AND
      Lower(NB.primaryname) in ('akshay kumar', 'deepika padukone') AND
      LOWER(TB.titleType) = 'movie' AND
      LOWER(TP.category) IN ('actor', 'actress') AND TB.startyear NOT LIKE '\N'
GROUP BY TB.primarytitle, NB.primaryname, TB.startyear
ORDER BY NB.primaryname ASC;
set echo off