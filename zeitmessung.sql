USE Indizes
GO

DECLARE @t1 DATETIME;
DECLARE @t2 DATETIME;

SET @t1 = GETDATE();
SELECT * FROM Trainingsplan WITH(INDEX(Index1));
SET @t2 = GETDATE();
DECLARE @TimeFirstQuery INT = DATEDIFF(MILLISECOND,@t1,@t2);

SET @t1 = GETDATE();
SELECT * FROM Trainingsplan;
SET @t2 = GETDATE();
DECLARE @TimeSecondQuery INT = DATEDIFF(millisecond,@t1,@t2);

SELECT @TimeFirstQuery as 'Zeit für erste Abfrage(ms)', @TimeSecondQuery as 'Zeit für zweite Abfrage(ms)', (@TimeSecondQuery - @TimeFirstQuery) as 'Differenz(ms)';