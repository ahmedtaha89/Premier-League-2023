use FootBall;
select  * from Player_Info
select  * from PlayerStats

select  * from Salary
select  * from Teams

select info.Player , Nationality  , Club from Player_Info  info join  Player_Stats stat
on info.Player = stat.Player


select  s.Player , Club  , Price  from PlayerStats pl join Salary s 
on s.Player = pl.Player



select  * from Teams
select  * from PlayerStats

select Player , Goals , Squad , Matches_Played , Wins , Losses  from Teams t join PlayerStats ps
on t.Squad = ps.Club