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


















