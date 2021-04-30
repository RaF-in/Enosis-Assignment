CREATE PROCEDURE Book_ticket
@user_id INT,
@number_of_tickets INT,
@movie_schedule_id INT
AS
BEGIN
	SELECT * FROM schedule;
END

ALTER PROCEDURE Book_ticket
@user_id INT,
@number_of_tickets INT,
@movie_schedule_id INT
AS
BEGIN
	IF(@number_of_tickets <= 4) 
	BEGIN
		DECLARE @total_seat_of_movie_schedule INT;
		SET @total_seat_of_movie_schedule = 
		(
		   SELECT SUM(number_of_seat) FROM booking WHERE booking.movie_schedule_id = @movie_schedule_id
		);
		IF(@total_seat_of_movie_schedule IS NULL) 
		BEGIN
			SET @total_seat_of_movie_schedule = 0;
		END
		DECLARE @hall_capacity INT;
		SET @hall_capacity  = 
		(
		   SELECT hall.capacity FROM movie_schedule 
		   INNER JOIN schedule ON movie_schedule.schedule_id = schedule.id 
		   INNER JOIN hall ON schedule.hall_id = hall.id 
		   WHERE movie_schedule.id = @movie_schedule_id
		);
		IF(@hall_capacity IS NULL) 
		BEGIN
			SET @hall_capacity = 50000;
		END
		IF(@total_seat_of_movie_schedule + @number_of_tickets <= @hall_capacity)
		BEGIN
			DECLARE @total_price INT;
			SET @total_price = 
			(
			   SELECT ticket_price FROM movie_schedule WHERE movie_schedule.id = @movie_schedule_id
			);
			INSERT INTO booking (movie_schedule_id,user_id,number_of_seat)
			VALUES 
			(@movie_schedule_id,@user_id,@number_of_tickets);
			RETURN (@total_price * @number_of_tickets);
		END
		ELSE
		BEGIN
			RETURN -1;
		END
	END
	ELSE
	BEGIN
		RETURN -2;
	END
END 

DECLARE @price INT;
EXEC @price = Book_ticket 4,5,1;
SELECT @price;

SELECT * FROM booking;