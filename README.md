# m153_indizes

## Was ist ein Index
Ein Index ermöglicht das schnellere Durchsuchen einer Datenbanktabelle. Es wird an einem seperaten Ort gespeichert und besteht aus doppelten Daten einer bestehenden Tabelle. Alle Daten werden in den Index sofort übernommen und in einer richtigen Reihenfolge gespeichert. Es ist vergleichbar mit einem Verzeichnis am Ende eines Buches. Es sind doppelte informationen, welche schnell durchsucht werden können und auf die richtigen Daten verweisen.

## Datenbankerstellung zum reproduzieren
```sql
USE MASTER
GO

DROP DATABASE IF EXISTS Indizes

CREATE DATABASE Indizes
GO

USE Indizes
GO

CREATE TABLE Trainingsplan (
    ID INT IDENTITY PRIMARY KEY,
    Bez VARCHAR(max),
    ErstellDatum DATE
)
GO
```

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

SELECT @TimeFirstQuery as 'Zeit für Abfrage mit Index(ms)', @TimeSecondQuery as 'Zeit für Abfrage ohne Index(ms)', (@TimeSecondQuery - @TimeFirstQuery) as 'Differenz(ms)';
```

## Was bringt ein Index bei vielen Datensätzen
Mit folgendem Skript kann man 1200 Datensätze einfügen.

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
Danach kann man mit folgendem Skript die Zeit inkl. Differenz berechnen.

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

SELECT @TimeFirstQuery as 'Zeit für Abfrage mit Index(ms)', @TimeSecondQuery as 'Zeit für Abfrage ohne Index(ms)', (@TimeSecondQuery - @TimeFirstQuery) as 'Differenz(ms)';
```
In der Theorie sollte die Abfrage mithilfe der Indexe schneller sein, jedoch ist dies bei uns in der Praxis nicht der Fall. Mal ist die Abfrage mit Indexen schneller und dann mal langsamer.
Wenn man beide SELECT's ohne Indexe macht, ist auch mal der eine schneller, dann der andere. Also kann man den Unterschied doch nicht so beurteilen wie oben beschrieben. Eine andere Möglichkeit ist uns aber leider nicht eingefallen.

## Viele Beziehungen zwischen den Tabellen

Mit folgendem Skript erstellt man viele Relationen zwischen den Tabellen.
```sql

```
