set echo on
spool Analysis1-b.output
set timing on
--Actors participated in genre Comedy

SELECT
    nb.primaryname,
    sum(case when (tb.startyear >= '2010' AND tb.startyear < '2012') then 1 else 0 end) as "2010-2012",
    sum(case when (tb.startyear >= '2012' AND tb.startyear < '2014') then 1 else 0 end) as "2012-2014",
    sum(case when (tb.startyear >= '2014' AND tb.startyear < '2016') then 1 else 0 end) as "2014-2016",
    sum(case when (tb.startyear >= '2016' AND tb.startyear < '2018') then 1 else 0 end) as "2016-2018",
    sum(case when (tb.startyear >= '2018' AND tb.startyear < '2020') then 1 else 0 end) as "2018-2020"
FROM imdb00.name_basics nb,imdb00.title_basics tb,imdb00.title_principals tp
WHERE
  nb.nconst = tp.nconst AND
  tp.tconst = tb.tconst AND
  Lower(nb.primaryname) in ('helen mirren', 'alec baldwin','akshay kumar','deepika padukone') AND
  LOWER(tp.category) IN ('actor', 'actress') AND
  TB.titletype LIKE 'movie' AND
  tb.genres LIKE '%Comedy%'
 
 GROUP BY nb.primaryname;
 
 --Actors participated in genre Drama

SELECT
    nb.primaryname,
    sum(case when (tb.startyear >= '2010' AND tb.startyear < '2012') then 1 else 0 end) as "2010-2012",
    sum(case when (tb.startyear >= '2012' AND tb.startyear < '2014') then 1 else 0 end) as "2012-2014",
    sum(case when (tb.startyear >= '2014' AND tb.startyear < '2016') then 1 else 0 end) as "2014-2016",
    sum(case when (tb.startyear >= '2016' AND tb.startyear < '2018') then 1 else 0 end) as "2016-2018",
    sum(case when (tb.startyear >= '2018' AND tb.startyear < '2020') then 1 else 0 end) as "2018-2020"
FROM imdb00.name_basics nb,imdb00.title_basics tb,imdb00.title_principals tp
WHERE
  nb.nconst = tp.nconst AND
  tp.tconst = tb.tconst AND
  Lower(nb.primaryname) in ('helen mirren', 'alec baldwin','akshay kumar','deepika padukone') AND
  LOWER(tp.category) IN ('actor', 'actress') AND
  TB.titletype LIKE 'movie' AND
  tb.genres LIKE '%Drama%'
 
 GROUP BY nb.primaryname;
 
 
  --Actors participated in Any genre

SELECT
    nb.primaryname,
    sum(case when (tb.startyear >= '1980' AND tb.startyear < '1991') then 1 else 0 end) as "1980-1990",
    sum(case when (tb.startyear >= '1991' AND tb.startyear < '2001') then 1 else 0 end) as "1991-2000",
    sum(case when (tb.startyear >= '2001' AND tb.startyear < '2011') then 1 else 0 end) as "2001-2010",
    sum(case when (tb.startyear >= '2011' AND tb.startyear < '2021') then 1 else 0 end) as "2011-2020"
FROM imdb00.name_basics nb,imdb00.title_basics tb,imdb00.title_principals tp
WHERE
  nb.nconst = tp.nconst AND
  tp.tconst = tb.tconst AND
  Lower(nb.primaryname) in ('helen mirren', 'alec baldwin','akshay kumar','deepika padukone') AND
  LOWER(tp.category) IN ('actor', 'actress') AND
  TB.titletype LIKE 'movie'
 
GROUP BY nb.primaryname;


set echo off










