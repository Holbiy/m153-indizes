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

INSERT INTO Trainingsplan (Bez, ErstellDatum) VALUES ('Test', '2022-08-08'), ('Test2', '2021-01-01')

CREATE INDEX index1 ON Trainingsplan (Id);
GO
CREATE CLUSTERED INDEX index2 ON Trainingsplan (Id);
GO
CREATE UNIQUE INDEX index3 ON Trainingsplan (Id DESC);
GO

SELECT * FROM Trainingsplan WITH(INDEX(Index1));