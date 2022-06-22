# m153_indizes

## Was ist ein Index
Ein Index ermöglicht das schnellere Durchsuchen einer Datenbanktabelle. Es wird an einem seperaten Ort gespeichert und besteht aus doppelten Daten einer bestehenden Tabelle. Alle Daten werden in den Index sofort übernommen und in einer richtigen Reihenfolge gespeichert. Es ist vergleichbar mit einem Verzeichnis am Ende eines Buches. Es sind doppelte informationen, welche schnell durchsucht werden können und auf die richtigen Daten verweisen.

## Wie wird ein Index erstellt, gelöscht?
```sql
CREATE INDEX index1 ON Trainingsplan (Id);
GO
CREATE CLUSTERED INDEX index2 ON Trainingsplan (Id);
GO
CREATE UNIQUE INDEX index3 ON Trainingsplan (Id DESC);
GO
```


## Wie kann ein index beurteilt werden?
Ein Index kann mit dem Vergleich der Abfragezeit ohne Index getestet werden.

Beispiel mit GetDate()
```sql
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
```

## Viele Datensätze einfügen
```sql
USE Indizes;

DECLARE @Id INT = 0;
While @Id <= 12000
Begin 
    DECLARE @randomString VARCHAR(255);
     SELECT @randomString = CONVERT(varchar(255), NEWID())
   Insert Into Trainingsplan (Bez, ErstellDatum) VALUES (@randomString, '2022-02-02');
   Set @Id = @Id + 1
End

Select * From Trainingsplan
```

