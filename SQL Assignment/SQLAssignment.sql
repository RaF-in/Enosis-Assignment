CREATE DATABASE Online Movie Booking System;
USE [Online Movie Booking System];
CREATE TABLE city 
(
	id INT PRIMARY KEY,
	name VARCHAR(20)
);

CREATE TABLE cinema
(
	id INT PRIMARY KEY,
	city_id INT FOREIGN KEY REFERENCES city(id),
	name VARCHAR(20)
);

CREATE TABLE [user]
(
	id INT PRIMARY KEY,
	city_id INT FOREIGN KEY REFERENCES city(id),
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	gender VARCHAR(20),
	dateofbirth DATE
);

CREATE TABLE [hall]
(
	id INT PRIMARY KEY,
	cinema_id INT FOREIGN KEY REFERENCES cinema(id),
	name VARCHAR(20),
	capacity int
);

CREATE TABLE [schedule]
(
	id INT PRIMARY KEY,
	hall_id INT FOREIGN KEY REFERENCES hall(id),
	day VARCHAR(20),
	start_time TIME,
	end_time Time
);

CREATE TABLE [movie]
(
	id INT PRIMARY KEY,
	name VARCHAR(20),
	release_date DATE,
	rating INT
);

CREATE TABLE [movie_schedule]
(
	id INT PRIMARY KEY,
	movie_id INT FOREIGN KEY REFERENCES movie(id),
	schedule_id INT FOREIGN KEY REFERENCES schedule(id),
	date DATE,
	ticket_price INT
);

CREATE TABLE [booking]
(
	id INT PRIMARY KEY,
	movie_schedule_id INT FOREIGN KEY REFERENCES movie_schedule(id),
	user_id INT FOREIGN KEY REFERENCES [user](id),
	number_of_seat INT
);

INSERT INTO city(name) 
VALUES
('DHAKA'),
('Chittagong'),
('Rajshahi');

INSERT INTO cinema(city_id,name) 
VALUES
(1,'Rampura'),
(2,'Pahartali'),
(3,'Shaheb Bazar'),
(1,'Badda'),
(3,'Bosua'),
(1,'Motijheel'),
(1,'Rajarbag');

INSERT INTO hall(cinema_id,name,capacity) 
VALUES
(2,'ghkjgk',200),
(5,'tutyu',500),
(3,'etretert',300),
(1,'rer',150),
(3,'tryrty',500),
(4,'popo',90),
(3,'rere',400),
(7,'ewe',500),
(5,'yutyu',150),
(6,'rwer',200),
(2,'pipo',360),
(2,'wrew',89),
(6,'bcvnbv',360),
(5,'oipi',200),
(4,'eqweq',88),
(3,'nvbn',100),
(1,'qeqw',250),
(1,'kljl',600),
(1,'ewrwre',230);

INSERT INTO schedule(hall_id,day,start_time,end_time) 
VALUES
(1,'Sunday','07:00:00','11:00:00');

INSERT INTO schedule(hall_id,day,start_time,end_time) 
VALUES
(1,'Sunday','12:00:00','16:00:00'),
(2,'Sunday','07:00:00','11:00:00'),
(2,'Sunday','12:00:00','16:00:00'),
(3,'Sunday','07:00:00','11:00:00'),
(3,'Sunday','12:00:00','16:00:00'),
(4,'Sunday','07:00:00','11:00:00'),
(4,'Sunday','12:00:00','16:00:00'),
(5,'Sunday','07:00:00','11:00:00'),
(5,'Sunday','12:00:00','16:00:00');

INSERT INTO schedule(hall_id,day,start_time,end_time) 
VALUES
(1,'Monday','07:00:00','11:00:00'),
(1,'Monday','12:00:00','16:00:00'),
(2,'Monday','07:00:00','11:00:00'),
(2,'Monday','12:00:00','16:00:00'),
(3,'Monday','07:00:00','11:00:00'),
(3,'Monday','12:00:00','16:00:00'),
(4,'Monday','07:00:00','11:00:00'),
(4,'Monday','12:00:00','16:00:00'),
(5,'Monday','07:00:00','11:00:00'),
(5,'Monday','12:00:00','16:00:00');

INSERT INTO schedule(hall_id,day,start_time,end_time) 
VALUES
(1,'Tuesday','07:00:00','11:00:00'),
(1,'Tuesday','12:00:00','16:00:00'),
(2,'Tuesday','07:00:00','11:00:00'),
(2,'Tuesday','12:00:00','16:00:00'),
(3,'Tuesday','07:00:00','11:00:00'),
(3,'Tuesday','12:00:00','16:00:00'),
(4,'Tuesday','07:00:00','11:00:00'),
(4,'Tuesday','12:00:00','16:00:00'),
(5,'Tuesday','07:00:00','11:00:00'),
(5,'Tuesday','12:00:00','16:00:00');

INSERT INTO schedule(hall_id,day,start_time,end_time) 
VALUES
(1,'Wednesday','07:00:00','11:00:00'),
(1,'Wednesday','12:00:00','16:00:00'),
(2,'Wednesday','07:00:00','11:00:00'),
(2,'Wednesday','12:00:00','16:00:00'),
(3,'Wednesday','07:00:00','11:00:00'),
(3,'Wednesday','12:00:00','16:00:00'),
(4,'Wednesday','07:00:00','11:00:00'),
(4,'Wednesday','12:00:00','16:00:00'),
(5,'Wednesday','07:00:00','11:00:00'),
(5,'Wednesday','12:00:00','16:00:00');

INSERT INTO schedule(hall_id,day,start_time,end_time) 
VALUES
(1,'Thursday','07:00:00','11:00:00'),
(1,'Thursday','12:00:00','16:00:00'),
(2,'Thursday','07:00:00','11:00:00'),
(2,'Thursday','12:00:00','16:00:00'),
(3,'Thursday','07:00:00','11:00:00'),
(3,'Thursday','12:00:00','16:00:00'),
(4,'Thursday','07:00:00','11:00:00'),
(4,'Thursday','12:00:00','16:00:00'),
(5,'Thursday','07:00:00','11:00:00'),
(5,'Thursday','12:00:00','16:00:00');

INSERT INTO schedule(hall_id,day,start_time,end_time) 
VALUES
(1,'Friday','07:00:00','11:00:00'),
(1,'Friday','12:00:00','16:00:00'),
(2,'Friday','07:00:00','11:00:00'),
(2,'Friday','12:00:00','16:00:00'),
(3,'Friday','07:00:00','11:00:00'),
(3,'Friday','12:00:00','16:00:00'),
(4,'Friday','07:00:00','11:00:00'),
(4,'Friday','12:00:00','16:00:00'),
(5,'Friday','07:00:00','11:00:00'),
(5,'Friday','12:00:00','16:00:00');

INSERT INTO movie(name,release_date,rating) 
VALUES
('abc','2020-1-1',3),
('hgh','2020-2-5',5),
('uiui','2020-2-10',2),
('ewr','2020-3-10',5),
('kll','2020-3-22',1),
('oioi','2020-4-1',3),
('czc','2020-4-18',3),
('wer','2020-5-1',4),
('mbnmb','2020-7-1',2),
('uyiyi','2020-8-1',5),
('jhj','2020-10-1',5),
('xf','2020-12-1',1);

INSERT INTO movie_schedule(movie_id,schedule_id,date,ticket_price) 
VALUES
(1,5,'2020-1-1',200),
(2,5,'2020-2-3',700),
(10,5,'2020-3-2',100),
(5,5,'2020-4-22',800),
(7,5,'2020-5-5',1000),
(12,5,'2020-6-4',1200),
(11,5,'2020-7-28',200),
(4,5,'2020-8-27',400),
(1,5,'2020-9-1',700),
(5,5,'2020-10-1',200),
(3,5,'2020-11-1',300),
(6,5,'2020-12-1',2000);

INSERT INTO movie_schedule(movie_id,schedule_id,date,ticket_price) 
VALUES
(1,5,'2020-1-1',200),
(2,8,'2020-2-3',700),
(10,1,'2020-3-2',100),
(5,3,'2020-4-22',800),
(7,10,'2020-5-5',1000),
(12,12,'2020-6-4',1200),
(11,6,'2020-7-28',200),
(4,3,'2020-8-27',400),
(1,2,'2020-9-1',700),
(5,1,'2020-10-1',200),
(3,12,'2020-11-1',300),
(6,10,'2020-12-1',2000);

INSERT INTO movie_schedule(movie_id,schedule_id,date,ticket_price) 
VALUES
(1,5,'2020-1-1',200),
(2,5,'2020-2-3',700),
(10,2,'2020-3-2',100),
(5,1,'2020-4-22',800),
(7,8,'2020-5-5',1000),
(12,9,'2020-6-4',1200),
(11,12,'2020-7-28',200),
(4,11,'2020-8-27',400),
(1,9,'2020-9-1',700),
(5,1,'2020-10-1',200),
(3,2,'2020-11-1',300),
(6,3,'2020-12-1',2000);

INSERT INTO [user](city_id,first_name) 
VALUES
(1,'hfh'),
(2,'ututy'),
(3,'nvbn'),
(3,'ewrew'),
(3,'lkjlkj'),
(1,'ouio'),
(2,'vxcv'),
(2,'ewr'),
(2,'lkl'),
(1,'czcz'),
(3,'yrty'),
(1,'eqwe');

INSERT INTO [booking](movie_schedule_id,user_id,number_of_seat) 
VALUES
(1,7,200),
(2,9,700),
(10,5,100),
(5,10,800),
(7,4,1000),
(12,8,1200),
(11,11,200),
(4,12,400),
(1,12,700),
(5,12,200),
(3,12,300),
(6,5,2000);

-- query 1

SELECT DISTINCT cinema.name Cinema_name,movie.id Movie_id FROM cinema  INNER JOIN hall ON cinema.id = hall.cinema_id INNER JOIN schedule ON hall.id = schedule.hall_id INNER JOIN 
movie_schedule ON schedule.id = movie_schedule.schedule_id INNER JOIN movie ON movie_schedule.movie_id = movie.id;

-- query 2(Year)

SELECT DISTINCT cinema.name Cinema_name,COUNT(movie.id) Movie_id FROM cinema  INNER JOIN hall ON cinema.id = hall.cinema_id INNER JOIN schedule ON hall.id = schedule.hall_id INNER JOIN 
movie_schedule ON schedule.id = movie_schedule.schedule_id INNER JOIN movie ON movie_schedule.movie_id = movie.id WHERE YEAR(movie.release_date) = 2020
GROUP BY cinema.name ;

-- query 2(month)

SELECT DISTINCT cinema.name Cinema_name,COUNT(movie.id) Movie_id FROM cinema  INNER JOIN hall ON cinema.id = hall.cinema_id INNER JOIN schedule ON hall.id = schedule.hall_id INNER JOIN 
movie_schedule ON schedule.id = movie_schedule.schedule_id INNER JOIN movie ON movie_schedule.movie_id = movie.id WHERE MONTH(movie.release_date) = 3
GROUP BY cinema.name ;

-- query 3

SELECT schedule.id schedule_id,schedule.start_time,schedule.end_time ,schedule.day,hall.name FROM hall inner join schedule ON hall_id = schedule.hall_id 
LEFT OUTER JOIN movie_schedule 
ON movie_schedule.schedule_id = schedule.id WHERE movie_schedule.id IS NULL;

CREATE FUNCTION Getweekend(@hall_id as int) 
RETURNS INT
AS
BEGIN
	RETURN 1;
END

ALTER FUNCTION Getweekend(@hall_id AS INT)
RETURNS INT
AS
BEGIN
	DECLARE @offday VARCHAR(20);
	SET @offday = (
		SELECT value FROM STRING_SPLIT('Saturday,Sunday,Monday,Tuesday,Wednesday,Thursday,Friday', ',')  WHERE value
		NOT IN (SELECT DISTINCT schedule.day FROM schedule inner join hall ON schedule.hall_id = hall.id WHERE hall.id = @hall_id)
	);

	IF(@offday = 'Sunday')
	BEGIN
		RETURN 1;
	END
	IF(@offday = 'Saturday')
	BEGIN
		RETURN 7;
	END
	IF(@offday = 'Monday')
	BEGIN
		RETURN 2;
	END
	IF(@offday = 'Tuesday')
	BEGIN
		RETURN 3;
	END
	IF(@offday = 'Wednesday')
	BEGIN
		RETURN 4;
	END
	IF(@offday = 'Thursday')
	BEGIN
		RETURN 5;
	END
	RETURN 6;
END

SELECT dbo.Getweekend(4);

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
	DECLARE @total_seat INT;
	SET @total_seat = 
	(
	   SELECT SUM(number_of_seat) FROM booking WHERE booking.user_id = @user_id
	);
	IF(@total_seat IS NULL) 
	BEGIN
		SET @total_seat = 0;
	END
	IF(@total_seat + @number_of_tickets <= 4) 
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
		   SELECT hall.capacity FROM movie_schedule INNER JOIN schedule ON movie_schedule.schedule_id = schedule.id 
		   INNER JOIN hall ON schedule.hall_id = hall.id WHERE movie_schedule.id = @movie_schedule_id
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
			SELECT (@total_price * @number_of_tickets);
			INSERT INTO booking (movie_schedule_id,user_id,number_of_seat)
			VALUES 
			(@movie_schedule_id,@user_id,@number_of_tickets);
		END
		ELSE
		BEGIN
			SELECT -1;
		END
	END
	ELSE
	BEGIN
		SELECT -2;
	END
END 

Book_ticket 1,1,8;

select * from booking;


















