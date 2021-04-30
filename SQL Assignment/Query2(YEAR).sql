-- query 2(Year)

SELECT DISTINCT cinema.name Cinema_name,COUNT(movie.id) Movie_count FROM cinema  
INNER JOIN hall ON cinema.id = hall.cinema_id 
INNER JOIN schedule ON hall.id = schedule.hall_id 
INNER JOIN movie_schedule ON schedule.id = movie_schedule.schedule_id 
INNER JOIN movie ON movie_schedule.movie_id = movie.id 
WHERE YEAR(movie.release_date) = YEAR(GETDATE())
GROUP BY cinema.name ;