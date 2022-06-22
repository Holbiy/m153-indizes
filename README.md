# m153_indizes

## Was ist ein Index
Ein Index ermöglicht das schnellere Durchsuchen einer Datenbanktabelle. Es wird an einem seperaten Ort gespeichert und besteht aus doppelten Daten einer bestehenden Tabelle. Alle Daten werden in den Index sofort übernommen und in einer richtigen Reihenfolge gespeichert. Es ist vergleichbar mit einem Verzeichnis am Ende eines Buches. Es sind doppelte informationen, welche schnell durchsucht werden können und auf die richtigen Daten verweisen.

## Wie wird ein Index erstellt, gelöscht?


## Wie kann ein index beurteilt werden?
Ein Index kann mit dem Vergleich der Abfragezeit ohne Index getestet werden.

Beispiel mit GetDate()
```HTML
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

SELECT @TimeFirstQuery as 'Zeit für erste Abfrage', @TimeSecondQuery as 'Zeit für zweite Abfrage', @TimeSecondQuery- @TimeSecondQuery as 'Differenz';
```