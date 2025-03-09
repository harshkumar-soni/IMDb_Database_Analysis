set echo ON
spool Analysis2.output
set timing on
--MAX movie for actor
SELECT NB.nconst as nameid,NB.primaryname as name,TB.startyear as year,COUNT(*) as movies
FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
WHERE NB.nconst = TP.nconst AND
      TP.tconst = TB.tconst AND
      TB.startyear BETWEEN '2010' AND '2020' AND LOWER(TP.category) IN 'actor' AND 
      TB.titletype LIKE 'movie'
GROUP BY NB.nconst, NB.primaryname, TB.startyear
ORDER BY COUNT(*) DESC FETCH FIRST ROW ONLY;



--MAX movie for actress
SELECT NB.nconst as nameid,NB.primaryname as name,TB.startyear as year,COUNT(*) as movies
FROM imdb00.name_basics NB, imdb00.title_principals TP, imdb00.title_basics TB
WHERE NB.nconst = TP.nconst AND
      TP.tconst = TB.tconst AND
      TB.startyear BETWEEN '2010' AND '2020' AND LOWER(TP.category) IN 'actress' AND 
      TB.titletype LIKE 'movie'
GROUP BY NB.nconst, NB.primaryname, TB.startyear
ORDER BY COUNT(*) DESC FETCH FIRST ROW ONLY;



--Male with First 4 Movies
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
 WHERE movies = 4 ORDER BY movies, year ASC FETCH FIRST ROW ONLY;
 
 
 --Male with last 4 Movies
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
 WHERE movies = 4 ORDER BY movies, year DESC FETCH FIRST ROW ONLY;
 
 
--FeMale with First 4 Movies
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
 WHERE movies = 4 ORDER BY movies, year ASC FETCH FIRST ROW ONLY;
 
 
--Female with last 4 Movies
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
 WHERE movies = 4 ORDER BY movies, year DESC FETCH FIRST ROW ONLY;
 

set echo off