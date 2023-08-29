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
	,Assists AS 'Number Of Assists'
FROM PlayerStats
ORDER BY Assists DESC




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

--UPDATE PlayerStats
--SET Clean_Sheets = 1
--WHERE Player IN (
--'Daniel Iversen',
--'Robin Olsen')

INSERT INTO PlayerStats 
values
	('David de Gea','Manchester United' , 0 , 0 , 0 , 0 , 1083 , 0 ,0, 0 , 0 , 0 ,17 , 'GK' ,38
	);



select  * from PlayerStats

-- This query retrieves the count of players for each unique position from the PlayerStats table.
select  Position , COUNT(Position) 'Number Of Players' from PlayerStats
group by Position
order by COUNT(Position) desc


select top 10 Player , Club , Interceptions 'Number Of Interceptions'  , Blocks
from PlayerStats
order by Interceptions desc



-- retrieve Top 3 Player have Clean Sheets
SELECT TOP 3 with ties Player
	,Club
	,Clean_Sheets
	,Apperence
FROM PlayerStats
WHERE Position = 'GK'
ORDER BY Clean_Sheets DESC


-- Teams Table
select  * from Teams

-- Top 5 Squad
Select  top 5 Squad , Points from Teams 
order by Points desc


Select top 3 Squad , Points  from Teams
order by Points asc


Select top 3 Squad , Wins , Losses  from Teams
order by Wins desc

Select top 4 Squad , Goals_For , Goals_Against  from Teams
order by Goals_For desc


select  * from Salary



select info.Player , Nationality  , Club from Player_Info  info join  Player_Stats stat
on info.Player = stat.Player


select  s.Player , Club  , Price  from PlayerStats pl join Salary s 
on s.Player = pl.Player


select  * from Teams

select * from Player_Info

select  * from  Salary

select  * from PlayerStats




	SELECT player_s.Player
		,Nationality
		,Age
		,Club
		,Position
		,Goals
		,s.price
	FROM PlayerStats player_s
	INNER JOIN Player_Info info ON player_s.Player = info.Player
	JOIN Salary s ON info.Player = s.Player
	Where player_s.Player = 'Erling Haaland'













CREATE PROCEDURE PlayerInformation(@PlayerName AS VARCHAR(40))
AS
BEGIN
	SELECT player_s.Player
		,Nationality
		,Age
		,Club
		,Position
		,Goals
		,s.price
	FROM PlayerStats player_s
	INNER JOIN Player_Info info ON player_s.Player = info.Player
	JOIN Salary s ON info.Player = s.Player
	Where player_s.Player = @PlayerName
END

exec PlayerInformation 'Mohamed Salah'
exec PlayerInformation 'Kevin De Bruyne'
exec PlayerInformation 'Leandro Trossard'

--Kevin De Bruyne
--Leandro Trossard
