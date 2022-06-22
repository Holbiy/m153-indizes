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