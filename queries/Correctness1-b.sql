set echo on
spool Correctness1-b.output
set timing on
SELECT
    nb.primaryname as name, tb.startyear as year, tb.primarytitle as title,tb.genres as genr
FROM imdb00.name_basics nb,imdb00.title_basics tb,imdb00.title_principals tp
WHERE
  nb.nconst = tp.nconst AND
  tp.tconst = tb.tconst AND
  Lower(nb.primaryname) in ('helen mirren', 'alec baldwin','akshay kumar','deepika padukone') AND
  LOWER(tp.category) IN ('actor', 'actress') AND
  TB.titletype LIKE 'movie' AND
  tb.genres LIKE '%Comedy%';
  
SELECT
    nb.primaryname as name, tb.startyear as year, tb.primarytitle as title,tb.genres as genr
FROM imdb00.name_basics nb,imdb00.title_basics tb,imdb00.title_principals tp
WHERE
  nb.nconst = tp.nconst AND
  tp.tconst = tb.tconst AND
  Lower(nb.primaryname) in ('helen mirren', 'alec baldwin','akshay kumar','deepika padukone') AND
  LOWER(tp.category) IN ('actor', 'actress') AND
  TB.titletype LIKE 'movie' AND
  tb.genres LIKE '%Drama%';
  
SELECT
    nb.primaryname as name, tb.startyear as year, tb.primarytitle as title
FROM imdb00.name_basics nb,imdb00.title_basics tb,imdb00.title_principals tp
WHERE
  nb.nconst = tp.nconst AND
  tp.tconst = tb.tconst AND
  Lower(nb.primaryname) in ('helen mirren', 'alec baldwin','akshay kumar','deepika padukone') AND
  LOWER(tp.category) IN ('actor', 'actress') AND
  TB.titletype LIKE 'movie';
  
set echo off