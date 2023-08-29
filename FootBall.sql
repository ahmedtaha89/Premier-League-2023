use FootBall;

-- Player_Info Table
SELECT *
FROM Player_Info
ORDER BY Age DESC;


-- Retrieve the count of players for each nationality and order them in descending order
SELECT  Nationality  , COUNT(Nationality) AS 'NUMBER OF PLAYER'
FROM Player_Info
GROUP BY Nationality 
ORDER BY COUNT(Nationality) DESC


-- Retrieve the top 3 players with their ages, ordered by age in descending order
SELECT  TOP (3) Player , Age
FROM  Player_Info
ORDER BY AGE DESC


-- Retrieve information about the top 3 players by height
SELECT  TOP (3) info.Player , Height , Position 
FROM  Player_Info info join PlayerStats ps
on info.Player = ps.Player
ORDER BY Height DESC




-- PlayerStats Table

-- Retrieve Top 10  player information, including their club and the maximum number of goals they scored
SELECT Top 10 Player
	,Club
	,Goals AS 'Number Of Goals' , Penalties_Scored , (Goals-Penalties_Scored) 'Numbers Goals Without Penalties Scored'
FROM PlayerStats
ORDER BY Goals DESC



-- This query retrieves the top 10 players based on their number of assists
SELECT TOP 10 Player
	,Club
	,max(Assists) AS 'Number Of Assists'
FROM PlayerStats
GROUP BY Player
	,Club
ORDER BY max(Assists) DESC




-- Retrieve player information for Manchester City players who have scored more than 1 goal
SELECT Player
	,Club
	,max(Goals) AS 'Number Of Goals'
FROM PlayerStats
GROUP BY Player
	,Club
HAVING Club = 'Manchester City' AND max(Goals) > 1
ORDER BY max(Goals) DESC


-- Retrieve Club and Sum Of Goals 
SELECT Club , SUM(GOALS) 'NUMBER OF GOALS FOR EACH CLUB' , SUM(Clean_Sheets) 'Clean Sheets'
FROM PlayerStats
GROUP BY Club
ORDER BY SUM(GOALS)  DESC

UPDATE PlayerStats
SET Clean_Sheets = 1
WHERE Player IN (
'Daniel Iversen',
'Robin Olsen')


select  * from PlayerStats

INSERT INTO PlayerStats 
values
	('David de Gea','Manchester United' , 0 , 0 , 0 , 0 , 1083 , 0 ,0, 0 , 0 , 0 ,17 , 'GK' ,38
	);


-- retrieve Top 3 Player have Clean Sheets
SELECT TOP 3 Player
	,Club
	,Clean_Sheets
	,Apperence
FROM PlayerStats
WHERE Position = 'GK'
ORDER BY Clean_Sheets DESC


















select  * from Salary

select  * from Teams
order by Points desc

select info.Player , Nationality  , Club from Player_Info  info join  Player_Stats stat
on info.Player = stat.Player


select  s.Player , Club  , Price  from PlayerStats pl join Salary s 
on s.Player = pl.Player


select  * from Teams
select  * from PlayerStats

select Player , Goals , Squad , Matches_Played , Wins , Losses  from Teams t join PlayerStats ps
on t.Squad = ps.Club