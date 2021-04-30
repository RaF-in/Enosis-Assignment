-- query 3

SELECT schedule.id schedule_id,schedule.start_time,schedule.end_time ,schedule.day,hall.name Hall_name FROM hall 
INNER JOIN schedule ON hall_id = schedule.hall_id 
LEFT OUTER JOIN movie_schedule ON movie_schedule.schedule_id = schedule.id 
WHERE movie_schedule.id IS NULL;
