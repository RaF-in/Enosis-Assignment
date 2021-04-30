CREATE FUNCTION Getweekend(@hall_id AS INT) 
RETURNS INT
AS
BEGIN
	RETURN 1;
END

ALTER FUNCTION Getweekend(@hall_id AS INT)
RETURNS INT
AS
BEGIN
	DECLARE @weekdays TABLE 
	(
		Id INT IDENTITY(1, 1) PRIMARY KEY,
		weekdayname VARCHAR(20)
	);
	INSERT INTO @weekdays
	VALUES
	('Sunday'),
	('Monday'),
	('Tuesday'),
	('Wednesday'),
	('Thursday'),
	('Friday'),
	('Saturday');
	DECLARE @offday VARCHAR(20);
	SET @offday = (
		SELECT Id FROM @weekdays  
		WHERE weekdayname 
		NOT IN (SELECT DISTINCT sch.day FROM schedule sch
		INNER JOIN hall ON sch.hall_id = hall.id 
		WHERE hall.id = @hall_id)
	)
	RETURN @offday;
END

SELECT dbo.Getweekend(5);

