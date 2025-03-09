set echo ON
spool Correctness2.output
set timing on

--MAX movie for actor 1000 rows
SELECT NB.nconst as nameid,NB.primaryname as name,TB.startyear as year,COUNT(*) as movies
FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
WHERE NB.nconst = TP.nconst AND
      TP.tconst = TB.tconst AND
      TB.startyear BETWEEN '2010' AND '2020' AND LOWER(TP.category) IN 'actor' AND 
      TB.titletype LIKE 'movie'
GROUP BY NB.nconst, NB.primaryname, TB.startyear
ORDER BY COUNT(*) DESC FETCH Next 1000 Rows only;



--MAX movie for actress 1000 rows
SELECT NB.nconst as nameid,NB.primaryname as name,TB.startyear as year,COUNT(*) as movies
FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
WHERE NB.nconst = TP.nconst AND
      TP.tconst = TB.tconst AND
      TB.startyear BETWEEN '2010' AND '2020' AND LOWER(TP.category) IN 'actress' AND 
      TB.titletype LIKE 'movie'
GROUP BY NB.nconst, NB.primaryname, TB.startyear
ORDER BY COUNT(*) DESC FETCH Next 1000 Rows only;



--Male with First 4 Movies 1000 rows
Select
*
FROM
(SELECT 
    NB.nconst AS Nameid,
    NB.primaryname AS Name,
    TB.startyear AS Year,
    COUNT(*) as movies
     FROM imdb00.title_principals TP, imdb00.title_basics TB,imdb00.name_basics NB 
     WHERE NB.nconst = TP.nconst AND
           TP.tconst = TB.tconst AND
           TB.startyear BETWEEN '2010' AND '2020' AND LOWER(TP.category) IN 'actor' AND 
           TB.titletype LIKE 'movie'
    GROUP BY NB.nconst, NB.primaryname, TB.startyear)
 WHERE movies = 4 ORDER BY movies, year ASC FETCH Next 1000 Rows only;
 
 
 --Male with last 4 Movies 1000 rows
Select
*
FROM
(SELECT 
    NB.nconst AS Nameid,
    NB.primaryname AS Name,
    TB.startyear AS Year,
    COUNT(*) as movies
     FROM imdb00.title_principals TP, imdb00.title_basics TB,imdb00.name_basics NB 
     WHERE NB.nconst = TP.nconst AND
           TP.tconst = TB.tconst AND
           TB.startyear BETWEEN '2010' AND '2020' AND LOWER(TP.category) IN 'actor' AND 
           TB.titletype LIKE 'movie'
    GROUP BY NB.nconst, NB.primaryname, TB.startyear)
 WHERE movies = 4 ORDER BY movies, year DESC FETCH Next 1000 Rows only;
 
 
--FeMale with First 4 Movies 1000 rows
Select
*
FROM
(SELECT 
    NB.nconst AS Nameid,
    NB.primaryname AS Name,
    TB.startyear AS Year,
    COUNT(*) as movies
     FROM imdb00.title_principals TP, imdb00.title_basics TB,imdb00.name_basics NB 
     WHERE NB.nconst = TP.nconst AND
           TP.tconst = TB.tconst AND
           TB.startyear BETWEEN '2010' AND '2020' AND LOWER(TP.category) IN 'actress' AND 
           TB.titletype LIKE 'movie'
    GROUP BY NB.nconst, NB.primaryname, TB.startyear)
 WHERE movies = 4 ORDER BY movies, year ASC FETCH Next 1000 Rows only;
 
 
--Female with last 4 Movies 1000 rows
Select
*
FROM
(SELECT 
    NB.nconst AS Nameid,
    NB.primaryname AS Name,
    TB.startyear AS Year,
    COUNT(*) as movies
     FROM imdb00.title_principals TP, imdb00.title_basics TB,imdb00.name_basics NB 
     WHERE NB.nconst = TP.nconst AND
           TP.tconst = TB.tconst AND
           TB.startyear BETWEEN '2010' AND '2020' AND LOWER(TP.category) IN 'actress' AND 
           TB.titletype LIKE 'movie'
    GROUP BY NB.nconst, NB.primaryname, TB.startyear)
 WHERE movies = 4 ORDER BY movies, year DESC FETCH Next 1000 Rows only;
 

set echo off