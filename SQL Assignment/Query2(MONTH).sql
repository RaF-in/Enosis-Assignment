-- query 2(month)

SELECT DISTINCT cinema.name Cinema_name,COUNT(movie.id) Movie_count FROM cinema  
INNER JOIN hall ON cinema.id = hall.cinema_id 
INNER JOIN schedule ON hall.id = schedule.hall_id 
INNER JOIN movie_schedule ON schedule.id = movie_schedule.schedule_id 
INNER JOIN movie ON movie_schedule.movie_id = movie.id 
WHERE MONTH(movie.release_date) = MONTH(GETDATE())
GROUP BY cinema.name ;